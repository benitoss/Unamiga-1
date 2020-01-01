
//============================================================================
//
//	unamiga top modified by delgrom 20/12/2019
//
//============================================================================

`default_nettype none

module Phoenix_unamiga
(

// Clocks
	input wire	clock_50_i,

	// Buttons
	input wire [4:1]	btn_n_i,

	// SRAMs (AS7C34096)
	// output wire	[18:0]sram_addr_o  = 18'b0000000000000000000,
	// inout wire	[7:0]sram_data_io	= 8'bzzzzzzzz,
	// output wire	sram_we_n_o		= 1'b1,
	// output wire	sram_oe_n_o		= 1'b1,
		
	// SDRAM	(H57V256)
	output [12:0] SDRAM_A,
	output  [1:0] SDRAM_BA,
	inout  [15:0] SDRAM_DQ,
	output        SDRAM_DQMH,
	output        SDRAM_DQML,
	output        SDRAM_CKE,
	output        SDRAM_nCS,
	output        SDRAM_nWE,
	output        SDRAM_nRAS,
	output        SDRAM_nCAS,
	output        SDRAM_CLK,

	// PS2
	inout wire	ps2_clk_io			= 1'bz,
	inout wire	ps2_data_io			= 1'bz,
	inout wire	ps2_mouse_clk_io  = 1'bz,
	inout wire	ps2_mouse_data_io = 1'bz,

	// SD Card
	output wire	sd_cs_n_o			= 1'b1,
	output wire	sd_sclk_o			= 1'b0,
	output wire	sd_mosi_o			= 1'b0,
	input wire	sd_miso_i,

	// Joysticks
	input wire	joy1_up_i,
	input wire	joy1_down_i,
	input wire	joy1_left_i,
	input wire	joy1_right_i,
	input wire	joy1_p6_i,
	input wire	joy1_p9_i,
	input wire	joy2_up_i,
	input wire	joy2_down_i,
	input wire	joy2_left_i,
	input wire	joy2_right_i,
	input wire	joy2_p6_i,
	input wire	joy2_p9_i,
	output wire	joyX_p7_o			= 1'b1,

	// Audio
	output        AUDIO_L,
	output        AUDIO_R,
	input wire	ear_i,
	output wire	mic_o					= 1'b0,

		// VGA
	output  [5:0] VGA_R,
	output  [5:0] VGA_G,
	output  [5:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS//,

		// HDMI
	// output wire	[7:0]tmds_o			= 8'b00000000,

	// STM32
	// input wire	stm_tx_i,
	// output wire	stm_rx_o,
	// output wire	stm_rst_o			= 1'bz, // '0' to hold the microcontroller reset line, to free the SD card
		
	// inout wire	stm_b8_io, 
	// inout wire	stm_b9_io,

	// input         SPI_SCK,
	// output        SPI_DO,
	// input         SPI_DI,
	// input         SPI_SS2


);


assign AUDIO_R = AUDIO_L;


// localparam CONF_STR = {
	// "Phoenix;;",
	// "O2,Rotate Controls,Off,On;",
	// "O34,Scanlines,Off,25%,50%,75%;",
	// "T6,Reset;",
	// "V,v1.20.",`BUILD_DATE
// };



wire clk_sys;
wire pll_locked;
pll pll(
	.inclk0(clock_50_i),
	.areset(0),
	.c0(clk_sys)//11
	);

wire [31:0] status;
wire  [1:0] buttons;
wire  [1:0] switches;
wire  [7:0] joystick_0;
wire  [7:0] joystick_1;
wire        scandoublerD = v_scandoublerD; // delgrom 1'b0 vga, 1'b1 15khz ;
wire        ypbpr;
wire [10:0] ps2_key;
reg	[11:0] audio;
wire 			hb1, hb2, vb;
wire        blankn = ~((hb1 & hb2) | vb);
wire 			ce_pix;
wire 			hs, vs;
wire  [1:0] r,g,b;

phoenix phoenix(
	.clk(clk_sys),
	// delgrom conecto el wire de reset
	//	.reset(status[0] | status[6] | buttons[1]),
	.reset(w_reset),
	.dip_switch(8'b00001111),
	.btn_coin(btn_coin),
	.btn_player_start({btn_two_players,btn_one_player}),
	.btn_left(m_left),
	.btn_right(m_right),
	.btn_barrier(m_bomb),
	.btn_fire(m_fire),
	.video_r(r),
	.video_g(g),
	.video_b(b),
	.video_hs(hs),
	.video_vs(vs),
	.video_vblank(vb), 
	.video_hblank_bg(hb1), 
	.video_hblank_fg(hb2),
	.audio_select("000"),
	.audio(audio)
	);

wire [5:0] vga_r_s;	
wire [5:0] vga_g_s;	
wire [5:0] vga_b_s;	
	
assign VGA_R = vga_r_s[5:1];
assign VGA_G = vga_g_s[5:1];
assign VGA_B = vga_b_s[5:1];	
	
mist_video #(.COLOR_DEPTH(2)) mist_video(
	.clk_sys(clk_sys),
//	.SPI_SCK(SPI_SCK),
//	.SPI_SS3(SPI_SS3),
//	.SPI_DI(SPI_DI),
	.R(blankn ? r : 0),
	.G(blankn ? g : 0),
	.B(blankn ? b : 0),
	.HSync(~hs),
	.VSync(~vs),
	.VGA_R(vga_r_s),
	.VGA_G(vga_g_s),
	.VGA_B(vga_b_s),
	.VGA_VS(VGA_VS),
	.VGA_HS(VGA_HS),
	.ce_divider(1'b1),
	.rotate({1'b1,status[2]}),
	.scandoubler_disable(scandoublerD),
	// delgrom scanlines
	//	.scanlines(scandoublerD ? 2'b00 : status[4:3]),
	.scanlines(scanlines_s),
	.ypbpr(ypbpr)
	);

/* user_io #(
	.STRLEN(($size(CONF_STR)>>3)))
user_io(
	.clk_sys        (clk_sys        ),
	.conf_str       (CONF_STR       ),
	.SPI_CLK        (SPI_SCK        ),
	.SPI_SS_IO      (CONF_DATA0     ),
	.SPI_MISO       (SPI_DO         ),
	.SPI_MOSI       (SPI_DI         ),
	.buttons        (buttons        ),
	.switches       (switches       ),
	.scandoubler_disable (scandoublerD	  ),
	.ypbpr          (ypbpr          ),
	.key_strobe     (key_strobe     ),
	.key_pressed    (key_pressed    ),
	.key_code       (key_code       ),
	.joystick_0     (joystick_0     ),
	.joystick_1     (joystick_1     ),
	.status         (status         )
	); */

dac #(
	.C_bits(15))
dac(
	.clk_i(clk_sys),
	.res_n_i(1),
	.dac_i({audio, 3'b000}),
	.dac_o(AUDIO_L)
	);

// wire m_up     = joyBCPPFRLDU[0] | ~joy1_s[0];
// wire m_down   = joyBCPPFRLDU[1] | ~joy1_s[1];
// wire m_left   = joyBCPPFRLDU[2] | ~joy1_s[2];
// wire m_right  = joyBCPPFRLDU[3] | ~joy1_s[3];

// wire m_fire   = joyBCPPFRLDU[4] | ~joy1_s[4];
// wire m_bomb   = joyBCPPFRLDU[8] | ~joy1_s[5];

// wire btn_one_player 	=  joyBCPPFRLDU[5] | ~btn_n_i[1];
// wire btn_two_players =  joyBCPPFRLDU[6] | ~btn_n_i[2];
// wire btn_coin  		=  joyBCPPFRLDU[7] | ~btn_n_i[3];

//wire m_up     = joyBCPPFRLDU[0] | ~joy1_up_i;
//wire m_down   = joyBCPPFRLDU[1] | ~joy1_down_i;
wire m_left   = joyBCPPFRLDU[2] | ~joy1_left_i;
wire m_right  = joyBCPPFRLDU[3] | ~joy1_right_i;

wire m_fire   = joyBCPPFRLDU[4] | ~joy1_p6_i;
wire m_bomb   = joyBCPPFRLDU[8] | ~joy1_p9_i;

wire btn_one_player 	=  joyBCPPFRLDU[5];
wire btn_two_players =  joyBCPPFRLDU[6];
wire btn_coin  		=  joyBCPPFRLDU[7];




//---------------------------------
	//-- scanlines
	
	wire btn_scan_s;
	wire changeScanlines; // delgrom
	wire [1:0] scanlines_s;
	
	debounce # ( .counter_size_g (10))
	btnscl
	(
		.clk_i		( clk_sys ),
		.button_i	( btn_n_i[1] | btn_n_i[2] ),
		.result_o	( btn_scan_s )
	);
 
 	//always @(negedge btn_scan_s) 
	always @(negedge changeScanlines) // delgrom	
	begin
			scanlines_s = scanlines_s + 1'b1;
	end
	
	//---------------------------------
	//-- PS/2 Keyboard
	
	wire kbd_intr;
wire [12:0] joyBCPPFRLDU;
wire [7:0] kbd_scancode;

//get scancode from keyboard
io_ps2_keyboard keyboard 
 (
  .clk       ( clk_sys ),
  .kbd_clk   ( ps2_clk_io ),
  .kbd_dat   ( ps2_data_io ),
  .interrupt ( kbd_intr ),
  .scancode  ( kbd_scancode )
);

//translate scancode to joystick
kbd_joystick k_joystick
(
  .clk         	(  clk_sys ),
  .kbdint      	(  kbd_intr ),
  .kbdscancode 	(  kbd_scancode ), 
  .joyBCPPFRLDU   ( joyBCPPFRLDU ),
  // delgrom
  .changeScandoubler    ( changeScandoubler),
  .changeScanlines    ( changeScanlines),
  .reset          (w_reset)    
);


// delgrom reset
wire w_reset;

// delgrom
wire changeScandoubler;
reg v_scandoublerD =1'b0;  // delgrom 1'b1 inicia a 15khz, 1'b0 inicia a  vga


// delgrom Cambiar entre 15khz y 31khz
always @(posedge changeScandoubler) 
begin
		v_scandoublerD <= ~v_scandoublerD;
end
	
	
//--- Joystick read with sega 6 button support----------------------
	


/* 	reg [11:0]joy1_s; 	
	reg [11:0]joy2_s; 
	reg joyP7_s;

	reg [7:0]state_v = 8'd0;
	reg j1_sixbutton_v = 1'b0;
	reg j2_sixbutton_v = 1'b0;
	
	always @(negedge hs) 
	begin
		

			state_v <= state_v + 1;

			
			case (state_v)			//-- joy_s format MXYZ SACB RLDU
				8'd0:  
					joyP7_s <=  1'b0;
					
				8'd1:
					joyP7_s <=  1'b1;

				8'd2:
					begin
						joy1_s[3:0] <= {joy1_right_i, joy1_left_i, joy1_down_i, joy1_up_i}; //-- R, L, D, U
						joy2_s[3:0] <= {joy2_right_i, joy2_left_i, joy2_down_i, joy2_up_i}; //-- R, L, D, U
						joy1_s[5:4] <= {joy1_p9_i, joy1_p6_i}; //-- C, B
						joy2_s[5:4] <= {joy2_p9_i, joy2_p6_i}; //-- C, B					
						joyP7_s <= 1'b0;
						j1_sixbutton_v <= 1'b0; //-- Assume it's not a six-button controller
						j2_sixbutton_v <= 1'b0; //-- Assume it's not a six-button controller
					end
					
				8'd3:
					begin
						if (joy1_right_i == 1'b0 && joy1_left_i == 1'b0) // it's a megadrive controller
								joy1_s[7:6] <= { joy1_p9_i , joy1_p6_i }; //-- Start, A
						else
								joy1_s[7:4] <= { 1'b1, 1'b1, joy1_p9_i, joy1_p6_i }; //-- read A/B as master System
							
						if (joy2_right_i == 1'b0 && joy2_left_i == 1'b0) // it's a megadrive controller
								joy2_s[7:6] <= { joy2_p9_i , joy2_p6_i }; //-- Start, A
						else
								joy2_s[7:4] <= { 1'b1, 1'b1, joy2_p9_i, joy2_p6_i }; //-- read A/B as master System

							
						joyP7_s <= 1'b1;
					end
					
				8'd4:  
					joyP7_s <= 1'b0;

				8'd5:
					begin
						if (joy1_right_i == 1'b0 && joy1_left_i == 1'b0 && joy1_down_i == 1'b0 && joy1_up_i == 1'b0 )
							j1_sixbutton_v <= 1'b1; // --it's a six button
						
						
						if (joy2_right_i == 1'b0 && joy2_left_i == 1'b0 && joy2_down_i == 1'b0 && joy2_up_i == 1'b0 )
							j2_sixbutton_v <= 1'b1; // --it's a six button
						
						
						joyP7_s <= 1'b1;
					end
					
				8'd6:
					begin
						if (j1_sixbutton_v == 1'b1)
							joy1_s[11:8] <= { joy1_right_i, joy1_left_i, joy1_down_i, joy1_up_i }; //-- Mode, X, Y e Z
						
						
						if (j2_sixbutton_v == 1'b1)
							joy2_s[11:8] <= { joy2_right_i, joy2_left_i, joy2_down_i, joy2_up_i }; //-- Mode, X, Y e Z
						
						
						joyP7_s <= 1'b0;
					end 
					
				default:
					joyP7_s <= 1'b1;
					
			endcase

	end
	
	assign joyX_p7_o = joyP7_s; */
	//---------------------------

endmodule 
module TESTING_MODE
#(
	parameter CLK_1_MHz = 120,
	parameter KOEF_T = 100,
	parameter Kol_sign = 58
)
(
	input	clk_120,	
	
	input			TEST_sig,
	
	input				pin_IZP_sig,
	input				pin_IZP01_sig,
	input				pin_D0_sig,
	input				pin_STROB_ADC_sig,
	input				pin_TIM_sig,
	input				pin_RSPA_sig,
	input				pin_Z_INP_sig,
	input				pin_INK_sig,
	input				pin_IM_sig,
	input				pin_BLANK_sig,
	input				pin_TI_2_sig,
	input				pin_IZL,
	input				pin_VOZD,
	input				pin_IRS,
	input	[9:		8]	MPI_RK1,
	input				MPI_RK3,
	input	[11:	9]	MPI_RK4,
	input				MPI_RK6,
	input				KC1,
	input				KC2,
	input				pin_PRVZ_sig,
	input				VSK,
	input				pin_KNCH_sig,
	input				pin_CARU1_sig,
	input				pin_CARU2_sig,
	input				pin_OSLFM_sig,
	input	[3:		0]	pin_IBP_sig,
		
	output				pin_TI_2,
	output				pin_IZP,		
	output              pin_IZP_K,	
	output              pin_IZP01,	
	output             	pin_IZP01_K,	
	output            	pin_D0,		
	output				pin_STROB,	
	output              pin_STROB_ADC,
	output              pin_TIM_IM,	
	output				pin_RSPA,	
	output              pin_Z_INP,
	output              pin_TIM,	
	output				pin_INK,		
	output              pin_IM,		
	output              pin_BLANK,	
	output              pin_IM_K,		
	output              pin_IZP_IM,
	output              pin_IZL_OUT,
	output				pin_SVR,		
	output              pin_KO,		
	output              pin_IBP1_K,	
	output              pin_PRVZ,		
	output              pin_PRGV05,	
	output              pin_ISPR_IP05,
	output              pin_ISPR_IP27,
	output	[6:	0]		pin_KNCH,	
	output  [5:	0]      pin_CARU1,
	output  [5:	0]      pin_CARU2,
	output	[0:	4]		pin_OSLFM,
	output  [3:	0]      pin_IBP,
	output  [1:	0]      pin_KS,
	output  [1: 0]      pin_DSVR,	
	output  [1: 0]      pin_KPP
	
	
	); 


	assign pin_IZP			= TEST_sig ? TEST_out_signal[0] : (pin_IZP_sig);		// output  pin_IZP
	assign pin_IZP_K		= TEST_sig ? TEST_out_signal[1] : (pin_IZP_sig);		// output  pin_IZP_K
	assign pin_IZP01		= TEST_sig ? TEST_out_signal[2] : (pin_IZP01_sig);		// output  pin_IZP01
	assign pin_IZP01_K		= TEST_sig ? TEST_out_signal[3] : (pin_IZP01_sig);		// output  pin_IZP01_K
	assign pin_D0			= TEST_sig ? TEST_out_signal[4]	: (pin_D0_sig);		// output  pin_D0
	assign pin_STROB		= TEST_sig ? TEST_out_signal[5] : (pin_STROB_ADC_sig);	// output  pin_STROB
	assign pin_STROB_ADC	= TEST_sig ? TEST_out_signal[6] : (pin_STROB_ADC_sig);	// output  pin_STROB
	assign pin_TIM_IM		= TEST_sig ? TEST_out_signal[7] : (pin_TIM_sig);		// output  pin_TIM_IM
	assign pin_RSPA			= TEST_sig ? TEST_out_signal[8] : (pin_RSPA_sig);		// output  pin_RSPA
	assign pin_Z_INP		= TEST_sig ? TEST_out_signal[9] : (pin_Z_INP_sig);		// output  pin_Z_INP
	assign pin_TIM			= TEST_sig ? TEST_out_signal[10] : (pin_TIM_sig);		// output  pin_TIM
	assign pin_INK			= TEST_sig ? TEST_out_signal[11] : (pin_INK_sig);		// output  pin_INK
	assign pin_IM			= TEST_sig ? TEST_out_signal[12] : (pin_IM_sig);		// output  pin_IM
	assign pin_BLANK		= TEST_sig ? TEST_out_signal[13] : pin_BLANK_sig;		//**
	assign pin_IM_K			= TEST_sig ? TEST_out_signal[14] : (pin_IM_sig);		// output  pin_IM_K
	assign pin_IZP_IM		= TEST_sig ? TEST_out_signal[15] : (pin_D0_sig);		// output  pin_IZP_IM
	assign pin_IZL_OUT		= TEST_sig ? TEST_out_signal[16] : (pin_IZL);			// output  pin_IZL_OUT
	assign pin_SVR			= TEST_sig ? TEST_out_signal[17] : ((!pin_VOZD && !pin_IRS && !MPI_RK3) ? 1'b1 : !MPI_RK4[9]);	// output  pin_SVR Изменено 24.09.2021
	assign pin_KO			= TEST_sig ? TEST_out_signal[18] : (!MPI_RK6);		// output  pin_KO
	assign pin_IBP1_K		= TEST_sig ? TEST_out_signal[19] : (pin_IBP_sig[0]);	// output  pin_IBP1_K/////////////////////////////////
	assign pin_PRVZ			= TEST_sig ? TEST_out_signal[20] : pin_PRVZ_sig;		//**
	assign pin_PRGV05		= TEST_sig ? TEST_out_signal[21] : (!VSK);//
	assign pin_ISPR_IP05	= TEST_sig ? TEST_out_signal[22] : 1'b0;
	assign pin_ISPR_IP27	= TEST_sig ? TEST_out_signal[23] : 1'b0;
	assign pin_KNCH		[6:	0]		= TEST_sig ? {TEST_out_signal[24], TEST_out_signal[25], TEST_out_signal[26], TEST_out_signal[27], TEST_out_signal[28], TEST_out_signal[29], TEST_out_signal[30]} : (~pin_KNCH_sig) ;	
	assign pin_CARU1	[5:	0]		= TEST_sig ? {TEST_out_signal[31], TEST_out_signal[32], TEST_out_signal[33], TEST_out_signal[34], TEST_out_signal[35], TEST_out_signal[36]} : (~pin_CARU1_sig) ;	
	assign pin_CARU2	[5:	0]		= TEST_sig ? {TEST_out_signal[37], TEST_out_signal[38], TEST_out_signal[39], TEST_out_signal[40], TEST_out_signal[41], TEST_out_signal[42]} : (~pin_CARU2_sig) ;	
	assign pin_TI_2			= TEST_sig ? TEST_out_signal[43] : pin_TI_2_sig;
	
	assign pin_DSVR		[1: 0]		= TEST_sig ? {TEST_out_signal [44], TEST_out_signal [45]} : 2'b0;
	assign pin_KS		[1:	0] 		= TEST_sig ? {TEST_out_signal[46],  TEST_out_signal[47]}: pin_TI_2_sig;
	
	assign pin_OSLFM 	[0: 4]	= TEST_sig ? {TEST_out_signal[48], TEST_out_signal[49], TEST_out_signal[50], TEST_out_signal[51], TEST_out_signal[52]} : (~pin_OSLFM_sig) ;	
	assign pin_IBP		[3:	0]	= TEST_sig ? {TEST_out_signal[53], TEST_out_signal[54], TEST_out_signal[55], TEST_out_signal[56]} : (pin_IBP_sig) ;	
	assign pin_KPP		[1: 0]	= TEST_sig ? {TEST_out_signal[57], TEST_out_signal[58]} : ((MPI_RK4[9] != 1) ? (~MPI_RK1[9:  8]) : 2'b01) ;	
	

logic [58: 0] TEST_out_signal;
	
//defparam TEST_inst.WIDTH = 17;
genvar i;
generate
	for (i = 0; i < 59; i = i + 1) 
	begin : generator
		pulse_gen_tim TEST_inst
		(
			.clk			(clk_120),		// input  clk_sig
			.enable			(1),			// input  enable_sig
			.reset			(0),		// input  reset_sig
			.delay_in		(0),			// input [WIDTH-1:0] delay_in_sig
			.duration_in	(CLK_1_MHz * ((i + 1) * KOEF_T) * 4),	// input [WIDTH-1:0] duration_in_sig
			.T_in			(CLK_1_MHz * ((i + 1) * KOEF_T)),		// input [WIDTH-1:0] T_in_sig	
			.out_signal		(TEST_out_signal[i]) 	// output  out_signal_sig
		);		
		
	end
endgenerate













endmodule
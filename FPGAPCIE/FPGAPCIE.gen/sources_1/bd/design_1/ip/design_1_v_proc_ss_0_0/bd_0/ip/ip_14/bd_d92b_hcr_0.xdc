
#set_false_path -from [get_cells v_hcresampler_CTRL_s_axi_U/int_HwReg_width_reg[*]]
#set_false_path -from [get_cells v_hcresampler_CTRL_s_axi_U/int_HwReg_height_reg[*]]
#set_false_path -from [get_cells v_hcresampler_CTRL_s_axi_U/int_HwReg_input_video_format_reg[*]]
#set_false_path -from [get_cells v_hcresampler_CTRL_s_axi_U/int_HwReg_output_video_format_reg[*]]

set_false_path -from [get_cells CTRL_s_axi_U/int_width_reg[*]]
set_false_path -from [get_cells CTRL_s_axi_U/int_height_reg[*]]
set_false_path -from [get_cells CTRL_s_axi_U/int_input_video_format_reg[*]]
set_false_path -from [get_cells CTRL_s_axi_U/int_output_video_format_reg[*]]

#
#set_false_path -from [get_cells CTRL_s_axi_U/int_coefs_?_?_reg[*]]
#



# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "east" -parent ${Page_0}
  ipgui::add_param $IPINST -name "east_y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "north" -parent ${Page_0}
  ipgui::add_param $IPINST -name "north_y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "south" -parent ${Page_0}
  ipgui::add_param $IPINST -name "south_y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "west" -parent ${Page_0}
  ipgui::add_param $IPINST -name "west_y" -parent ${Page_0}


}

proc update_PARAM_VALUE.east { PARAM_VALUE.east } {
	# Procedure called to update east when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.east { PARAM_VALUE.east } {
	# Procedure called to validate east
	return true
}

proc update_PARAM_VALUE.east_y { PARAM_VALUE.east_y } {
	# Procedure called to update east_y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.east_y { PARAM_VALUE.east_y } {
	# Procedure called to validate east_y
	return true
}

proc update_PARAM_VALUE.north { PARAM_VALUE.north } {
	# Procedure called to update north when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.north { PARAM_VALUE.north } {
	# Procedure called to validate north
	return true
}

proc update_PARAM_VALUE.north_y { PARAM_VALUE.north_y } {
	# Procedure called to update north_y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.north_y { PARAM_VALUE.north_y } {
	# Procedure called to validate north_y
	return true
}

proc update_PARAM_VALUE.south { PARAM_VALUE.south } {
	# Procedure called to update south when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.south { PARAM_VALUE.south } {
	# Procedure called to validate south
	return true
}

proc update_PARAM_VALUE.south_y { PARAM_VALUE.south_y } {
	# Procedure called to update south_y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.south_y { PARAM_VALUE.south_y } {
	# Procedure called to validate south_y
	return true
}

proc update_PARAM_VALUE.west { PARAM_VALUE.west } {
	# Procedure called to update west when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.west { PARAM_VALUE.west } {
	# Procedure called to validate west
	return true
}

proc update_PARAM_VALUE.west_y { PARAM_VALUE.west_y } {
	# Procedure called to update west_y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.west_y { PARAM_VALUE.west_y } {
	# Procedure called to validate west_y
	return true
}


proc update_MODELPARAM_VALUE.north { MODELPARAM_VALUE.north PARAM_VALUE.north } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.north}] ${MODELPARAM_VALUE.north}
}

proc update_MODELPARAM_VALUE.north_y { MODELPARAM_VALUE.north_y PARAM_VALUE.north_y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.north_y}] ${MODELPARAM_VALUE.north_y}
}

proc update_MODELPARAM_VALUE.south { MODELPARAM_VALUE.south PARAM_VALUE.south } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.south}] ${MODELPARAM_VALUE.south}
}

proc update_MODELPARAM_VALUE.south_y { MODELPARAM_VALUE.south_y PARAM_VALUE.south_y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.south_y}] ${MODELPARAM_VALUE.south_y}
}

proc update_MODELPARAM_VALUE.east { MODELPARAM_VALUE.east PARAM_VALUE.east } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.east}] ${MODELPARAM_VALUE.east}
}

proc update_MODELPARAM_VALUE.east_y { MODELPARAM_VALUE.east_y PARAM_VALUE.east_y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.east_y}] ${MODELPARAM_VALUE.east_y}
}

proc update_MODELPARAM_VALUE.west { MODELPARAM_VALUE.west PARAM_VALUE.west } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.west}] ${MODELPARAM_VALUE.west}
}

proc update_MODELPARAM_VALUE.west_y { MODELPARAM_VALUE.west_y PARAM_VALUE.west_y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.west_y}] ${MODELPARAM_VALUE.west_y}
}


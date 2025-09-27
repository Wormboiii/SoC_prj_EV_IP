set_false_path -through [get_ports "Reset"]

# Waivers for serial debug interface
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-3  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*/C]

create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/D]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CE]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/*/D]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/PRE]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]

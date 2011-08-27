import VerilogParser
import DataTypes

changeName _ mod@Module{moduleName = name} = mod{moduleName = name ++ "_FIFO_ALL_EXPOSED"}

main = verilogParser [("_FIFO_ALL_EXPOSED.v", \x -> id)]

module DataTypes where

import Data.Map
import Data.Set

data IrAndConnection = IrAndConnection
  { ir::Module
  , terminals::Set String
  , depends::Map String [String]
  }

data Module = Module
  { moduleName::String
  , modulePorts::[String]
  , moduleInputs::[Net]
  , moduleOutputs::[Net]
  , moduleWires::[Net]
  , moduleRegs::[Net]
  , moduleAssigns::[String]
  , moduleCases::[String]
  , moduleTasks::[Task]
  , moduleInstances::[Instance]
  }

data Net = Net
  { netName::String
  , netWidth::String
  }

data Instance = Instance
  { instanceType::String
  , instanceParam::Maybe String
  , instanceName::String
  , instancePorts::[(String, String)]
  }

type Task = String

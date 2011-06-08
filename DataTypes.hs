module DataTypes where

import qualified Data.Map as M
import qualified Data.Set as S

data IrAndConnection = IrAndConnection
  { ir::Module
  , terminals::S.Set String
  , depends::M.Map String [String]
  }

emptyIr = IrAndConnection{ir = emptyModule, terminals = S.empty, depends = M.empty}

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

emptyModule = Module
  { moduleName = ""
  , modulePorts = []
  , moduleInputs = []
  , moduleOutputs = []
  , moduleWires = []
  , moduleRegs = []
  , moduleAssigns = []
  , moduleCases = []
  , moduleTasks = []
  , moduleInstances = []
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

data Task = Task
  { taskExpr::String
  , taskStmt::String
  }

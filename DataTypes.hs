module DataTypes where

data Net = Net
  { netName::String
  , netAnnotate::String -- Widths
  , netTerminal::Bool
  }

data Module = Module
  { moduleName::String
  , modulePorts::[String]
  , moduleInputs::[Net]
  , moduleOutputs::[Net]
  , moduleWires::[Net]
  , moduleRegs::[Net]
  , moduleAssigns::[Assign]
  , moduleCases::[Case]
  , moduleTasks::[Task]
  , moduleInstances::[Instance]
  }

data Assign = Assign
  { assignExpr::String
  , assignLhs::String
  , assignRhs::[String]
  }

data Instance = Instance
  { instanceType::String
  , instanceName::String
  , instancePorts::[(String, String)]
  }

data Case = Case
  { caseLhs::String
  , caseList::[String]
  , caseStmt::String
  }

type Task = String

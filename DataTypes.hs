module DataTypes where

import Data.List

data Task = Task
  { taskExpr::Maybe String
  , taskStmt::String
  }

instance Show Task where
  show (Task Nothing     stmt) = "    if(RST_N)\n      " ++ stmt ++ ";\n"
  show (Task (Just expr) stmt) = "    if(RST_N)\n      if(" ++ expr ++ ")\n        " ++ stmt ++ ";\n"

data Stmt =
  Input
    { inputWidth::String
    , inputName::String
    }
  | Output
    { outputWidth::String
    , outputName::String
    }
  | Wires
    { wiresWidth::String
    , wiresNames::[String]
    }
  | Regs
    { regsWidth::String
    , regsNames::[String]
    }
  | Assign String
  | Case String
  | Instance
    { instanceType::String
    , instanceParam::String
    , instanceName::String
    , instancePorts::[(String, String)]
    }
  | TaskStmt [Task]
  | End

printPort (formal, real) = "." ++ formal ++ "(" ++ real ++ ")"

instance Show Stmt where
  show (Input width name) = "  input " ++ width ++ " " ++ name ++ ";\n"
  show (Output width name) = "  output " ++ width ++ " " ++ name ++ ";\n"
  show (Wires width names) = "  wire " ++ width ++ " " ++ (intercalate ", " names) ++ ";\n"
  show (Regs width names) = "  reg " ++ width ++ " " ++ (intercalate ", " names) ++ ";\n"
  show (Assign expr) = "\n  assign " ++ expr ++ ";\n"
  show (Case str) = "\n  always@" ++ str ++ "    endcase\n  end\n"
  show (Instance t param name ports) = "\n  " ++ t ++ " " ++ param ++ " " ++ name ++ " (\n    " ++ (intercalate ",\n    " $ map printPort ports) ++ ");\n"
  show (TaskStmt tasks) = "\n  always@(negedge CLK)\n  begin\n    #0;\n" ++ (concatMap show tasks) ++ "  end\n"
  show End = ""


data Module = Module
  { moduleName::String
  , modulePorts::[String]
  , moduleStmts::[Stmt]
  }

instance Show Module where
  show (Module name ports stmts) =
    "`ifdef BSV_ASSIGNMENT_DELAY\n`else\n`define BSV_ASSIGNMENT_DELAY\n`endif\n\n" ++
    "module " ++ name ++ "(\n  " ++ intercalate ",\n  " ports ++ ");\n\n" ++
    concatMap show [x|x@Input{} <- stmts] ++
    concatMap show [x|x@Output{} <- stmts] ++
    concatMap show [x|x@Wires{} <- stmts] ++
    concatMap show [x|x@Regs{} <- stmts] ++
    concatMap show [x|x@Assign{} <- stmts] ++
    concatMap show [x|x@Case{} <- stmts] ++
    concatMap show [x|x@Instance{} <- stmts] ++
    concatMap show [x|x@TaskStmt{} <- stmts] ++
    "endmodule\n"

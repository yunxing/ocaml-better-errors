(* type termKind = Expression | Pattern *)
(* type conflictPair = {inferred: string list; expected: string list} *)
type fileInfo = {
  name: string;
  line: int;
  cols: int * int;
}

type mismatchTypeArguments = {constructor: string; expectedCount: int; observedCount: int}
type unboundValue = {constructor: string; expectedCount: int; observedCount: int}
type signatureMismatch = {constructor: string; expectedCount: int; observedCount: int}
type signatureItemMissing = {constructor: string; expectedCount: int; observedCount: int}
type unboundModule = {constructor: string; expectedCount: int; observedCount: int}
type unboundRecordField = {constructor: string; expectedCount: int; observedCount: int}
type unboundConstructor = {constructor: string; expectedCount: int; observedCount: int}
type unboundTypeConstructor = {constructor: string; expectedCount: int; observedCount: int}

type appliedTooMany = {
  fileInfo: fileInfo;
  functionType: string;
  expectedArgCount: int;
}

type recordFieldNotInExpression = {constructor: string; expectedCount: int; observedCount: int}
type recordFieldError = {constructor: string; expectedCount: int; observedCount: int}
type syntaxError = {constructor: string; expectedCount: int; observedCount: int}
type inconsistentAssumptions = {constructor: string; expectedCount: int; observedCount: int}
type catchAll = {constructor: string; expectedCount: int; observedCount: int}
type fieldNotBelong = {constructor: string; expectedCount: int; observedCount: int}
type unusedVariable = {constructor: string; expectedCount: int; observedCount: int}

type incompatibleType = {
  (* termKind: termKind; *)
  fileInfo: fileInfo;
  actual: string;
  expected: string;
  (* inferredEquivalentTypes: string list;
  expectedEquivalentTypes: string list; *)
  (* conflicts: conflictPair list; *)
  (* existentialMessage: string option; *)
}
type notAFunction = {
  fileInfo: fileInfo;
  actual: string;
}

type message =
  | Type_MismatchTypeArguments of mismatchTypeArguments
  | Type_UnboundValue of unboundValue
  | Type_SignatureMismatch of signatureMismatch
  | Type_SignatureItemMissing of signatureItemMissing
  | Type_UnboundModule of unboundModule
  | Type_UnboundRecordField of unboundRecordField
  | Type_UnboundConstructor of unboundConstructor
  | Type_UnboundTypeConstructor of unboundTypeConstructor

  | Type_AppliedTooMany of appliedTooMany

  | Type_RecordFieldNotInExpression of recordFieldNotInExpression
  | Type_RecordFieldError of recordFieldError
  (* might be the same thing as above *)
  | Type_RecordFieldNotBelong of recordFieldError
  | Type_FieldNotBelong of fieldNotBelong

  | Type_IncompatibleType of incompatibleType
  | Type_NotAFunction of notAFunction

  | File_SyntaxError of syntaxError
  | Build_InconsistentAssumptions of inconsistentAssumptions
  | Warning_CatchAll of catchAll

  (* not in jordan's stuff *)
  | Warning_UnusedVariable of unusedVariable
  | Warning_OptionalArgumentNotErased of unusedVariable
  | Unparsable of string
  (* | General_CatchAll of string *)
  (* | Project_Unknown of string *)
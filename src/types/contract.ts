export interface IContract {
  contractName: string
  abi: Abi[]
  metadata: string
  bytecode: string
  deployedBytecode: string
  sourceMap: string
  deployedSourceMap: string
  source: string
  sourcePath: string
  ast: Ast
  legacyAST: LegacyAst
  compiler: Compiler
  networks: Networks
  schemaVersion: string
  updatedAt: string
  devdoc: Devdoc
  userdoc: Userdoc
}

export interface Abi {
  constant: boolean
  inputs: any[]
  name: string
  outputs: Output[]
  payable: boolean
  stateMutability: string
  type: string
}

export interface Output {
  name: string
  type: string
}

export interface Ast {
  absolutePath: string
  exportedSymbols: ExportedSymbols
  id: number
  nodeType: string
  nodes: Node[]
  src: string
}

export interface ExportedSymbols {
  Faucet: number[]
}

export interface Node {
  id: number
  literals?: string[]
  nodeType: string
  src: string
  baseContracts?: any[]
  contractDependencies?: any[]
  contractKind?: string
  documentation: any
  fullyImplemented?: boolean
  linearizedBaseContracts?: number[]
  name?: string
  nodes?: Node2[]
  scope?: number
}

export interface Node2 {
  constant: boolean
  id: number
  name: string
  nodeType: string
  scope: number
  src: string
  stateVariable: boolean
  storageLocation: string
  typeDescriptions: TypeDescriptions
  typeName: TypeName
  value: Value
  visibility: string
}

export interface TypeDescriptions {
  typeIdentifier: string
  typeString: string
}

export interface TypeName {
  id: number
  name: string
  nodeType: string
  src: string
  typeDescriptions: TypeDescriptions2
}

export interface TypeDescriptions2 {
  typeIdentifier: string
  typeString: string
}

export interface Value {
  argumentTypes: any
  hexValue: string
  id: number
  isConstant: boolean
  isLValue: boolean
  isPure: boolean
  kind: string
  lValueRequested: boolean
  nodeType: string
  src: string
  subdenomination: any
  typeDescriptions: TypeDescriptions3
  value: string
}

export interface TypeDescriptions3 {
  typeIdentifier: string
  typeString: string
}

export interface LegacyAst {
  attributes: Attributes
  children: Children[]
  id: number
  name: string
  src: string
}

export interface Attributes {
  absolutePath: string
  exportedSymbols: ExportedSymbols2
}

export interface ExportedSymbols2 {
  Faucet: number[]
}

export interface Children {
  attributes: Attributes2
  id: number
  name: string
  src: string
  children?: Children2[]
}

export interface Attributes2 {
  literals?: string[]
  baseContracts?: any[]
  contractDependencies?: any[]
  contractKind?: string
  documentation: any
  fullyImplemented?: boolean
  linearizedBaseContracts?: number[]
  name?: string
  scope?: number
}

export interface Children2 {
  attributes: Attributes3
  children: Children3[]
  id: number
  name: string
  src: string
}

export interface Attributes3 {
  constant: boolean
  name: string
  scope: number
  stateVariable: boolean
  storageLocation: string
  type: string
  visibility: string
}

export interface Children3 {
  attributes: Attributes4
  id: number
  name: string
  src: string
}

export interface Attributes4 {
  name?: string
  type: string
  argumentTypes: any
  hexvalue?: string
  isConstant?: boolean
  isLValue?: boolean
  isPure?: boolean
  lValueRequested?: boolean
  subdenomination: any
  token?: string
  value?: string
}

export interface Compiler {
  name: string
  version: string
}

export interface Networks {}

export interface Devdoc {
  methods: Methods
}

export interface Methods {}

export interface Userdoc {
  methods: Methods2
}

export interface Methods2 {}

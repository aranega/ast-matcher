# AST Matcher
AST matcher for Pharo AST


## Installation 

```smalltalk
Metacello new
	baseline: 'ReflexiveAST';
	repository: 'github://aranega/reflexive-ast';
	load
```

## Usage (will evolve, change)

```smalltalk
"will try to match if a node is a return node with the expression x + x - x"
m := [ ^ ##a + ##a - ##a ] matcher at: 1. 
m match: node.  "node is an AST node"

"will try to match a return with the following form ^ (a) + (a) (operator) (mavar) "
m := ReturnMatcher with: (BinopMatcher op: (NodeMatcher name: #operator) 
                                       left: ([ ##a + ##a ] matcher at: 1) 
                                       right: (NodeMatcher name: #mavar)).
m match: node. "applied on an AST node ^ z + z - b"
"will fully match and return { #a -> VariableNode(z). #operator -> #+. #mavar -> VariableNode(b) }"

m match: node. "applied on an AST node ^ z + a - b"
"will not fully match but patially match { #a -> VariableNode(z). #operator -> #+ }"
```

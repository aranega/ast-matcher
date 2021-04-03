Class {
	#name : #MatcherVisitor,
	#superclass : #RBProgramNodeVisitor,
	#category : #'AST-Matcher'
}

{ #category : #visiting }
MatcherVisitor >> visitAssignmentNode: anAssignmentNode [
	^ AssignMatcher left: (anAssignmentNode variable acceptVisitor: self) right: (anAssignmentNode value acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitBinaryMessage: binaryMessage [
	^ BinopMatcher
		op: binaryMessage selector asMatcher
		left: (binaryMessage receiver acceptVisitor: self)
		right: ((binaryMessage arguments at: 1) acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitBlockNode: aBlockNode [
	^ aBlockNode body acceptVisitor: self
]

{ #category : #visiting }
MatcherVisitor >> visitLiteralNode: aNode [
	aNode value isSymbol
		ifTrue: [ ^ aNode value asMatcher ].
	^ LiteralMatcher v: aNode value
]

{ #category : #visiting }
MatcherVisitor >> visitMessageNode: aMessageNode [
	aMessageNode isBinary
		ifTrue: [ ^ self visitBinaryMessage: aMessageNode ].
	self halt
]

{ #category : #visiting }
MatcherVisitor >> visitReturn: aReturnNode [
	^ ReturnMatcher with: (aReturnNode value accept: self)
]

{ #category : #visiting }
MatcherVisitor >> visitReturnNode: aReturnNode [
	^ ReturnMatcher with: (aReturnNode value acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitSequenceNode: aSequenceNode [
	"^ aSequenceNode statements
		collect: [ :each | each acceptVisitor: self ]"
	^ SequenceMatcher matchers: (aSequenceNode statements
		collect: [ :each | each acceptVisitor: self ])
	
]

{ #category : #visiting }
MatcherVisitor >> visitVariableNode: aVarNode [
	| varname |
	varname := aVarNode name.
	(varname = '_')
		ifTrue: [ ^ DiscardMatcher new ].
	(varname beginsWith: '_')
		ifTrue: [ ^ NodeMatcher name: varname allButFirst asSymbol ].
	^ VariableMatcher v: varname
]

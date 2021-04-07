Class {
	#name : #MatcherVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'condition'
	],
	#category : #'AST-Matcher'
}

{ #category : #accessing }
MatcherVisitor >> condition: anObject [
	condition := anObject
]

{ #category : #visiting }
MatcherVisitor >> visitAssignmentNode: anAssignmentNode [
	^ AssignMatcher left: (anAssignmentNode variable acceptVisitor: self) right: (anAssignmentNode value acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitBinaryMessage: binaryMessage [
	^ BinaryMessageMatcher
		op: binaryMessage selector asMatcher
		left: (binaryMessage receiver acceptVisitor: self)
		right: ((binaryMessage arguments at: 1) acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitBlockNode: aBlockNode [
	^ aBlockNode body acceptVisitor: self
]

{ #category : #visiting }
MatcherVisitor >> visitKeywordMessage: aMessageNode [
	^ KeywordMessageMatcher selector: (aMessageNode selector asMatcher)
	receiver: (aMessageNode receiver acceptVisitor: self)
	arguments: (aMessageNode arguments collect: [:arg | arg acceptVisitor: self])
]

{ #category : #visiting }
MatcherVisitor >> visitLiteralArrayNode: aNode [
	^ ArrayMatcher
		matchers:
			(aNode value
				collect: [ :each | 
					| matcher |
					matcher := each asMatcher.
					matcher condition: condition.
					matcher ])
]

{ #category : #visiting }
MatcherVisitor >> visitLiteralNode: aNode [
	aNode value isSymbol
		ifTrue: [ 
			| matcher |
					matcher := aNode value asMatcher.
					matcher condition: condition.
					^ matcher].
	^ LiteralMatcher v: aNode value
]

{ #category : #visiting }
MatcherVisitor >> visitMessageNode: aMessageNode [
	aMessageNode isBinary
		ifTrue: [ ^ self visitBinaryMessage: aMessageNode ].
	aMessageNode isKeyword
		ifTrue: [ ^ self visitKeywordMessage: aMessageNode ].
	aMessageNode isUnary
		ifTrue: [ ^ self visitUnaryMessage: aMessageNode ].
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
	aSequenceNode statements ifEmpty: [ ^ EmptySequenceMatcher new ].
	^ (SequenceMatcher
		matchers:
			(aSequenceNode statements
				collect: [ :each | each acceptVisitor: self ]))
		condition: condition
]

{ #category : #visiting }
MatcherVisitor >> visitUnaryMessage: aMessageNode [
	^ UnaryMessageMatcher 
		selector: aMessageNode selector asMatcher
		receiver: (aMessageNode receiver acceptVisitor: self)
]

{ #category : #visiting }
MatcherVisitor >> visitVariableNode: aVarNode [
	| varname |
	varname := aVarNode name.
	varname = '_'
		ifTrue: [ ^ DiscardMatcher new ].
	(varname beginsWith: '_')
		ifTrue: [ ^ (NodeMatcher
				name: varname allButFirst asSymbol)
				condition: condition ].
	^ VariableMatcher v: varname
]

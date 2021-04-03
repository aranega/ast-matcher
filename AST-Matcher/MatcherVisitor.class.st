Class {
	#name : #MatcherVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'left'
	],
	#category : #'AST-Matcher'
}

{ #category : #visiting }
MatcherVisitor >> left: aMatcher [
	left := aMatcher
]

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
	^ aNode value asMatcher
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
	^ aSequenceNode statements collect: [ :each | each acceptVisitor: self ].
]

{ #category : #visiting }
MatcherVisitor >> visitVariableNode: aVarNode [
	^ VariableMatcher v: aVarNode name 
]

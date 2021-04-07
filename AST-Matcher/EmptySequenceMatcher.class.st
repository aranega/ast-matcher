Class {
	#name : #EmptySequenceMatcher,
	#superclass : #SequenceMatcher,
	#category : #'AST-Matcher'
}

{ #category : #accessing }
EmptySequenceMatcher >> match: aValue withContext: context [
	| collection |
	collection := aValue isCollection ifTrue: [ aValue ] ifFalse: [ aValue statements ].
	^ collection isEmpty
]

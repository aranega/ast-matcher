Class {
	#name : #LiteralMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchValue'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
LiteralMatcher class >> v: aSymbol [
	^ self new matchValue: aSymbol
]

{ #category : #accessing }
LiteralMatcher >> literal: aLiteral [
	matchValue := aLiteral
]

{ #category : #accessing }
LiteralMatcher >> match: aValue withContext: aContext [
	| value |
	value := aValue isLiteral
		ifTrue: [ aValue ]
		ifFalse: [ aValue value ].
	^ value = matchValue
]

{ #category : #accessing }
LiteralMatcher >> matchValue: aValue [
	matchValue := aValue
]

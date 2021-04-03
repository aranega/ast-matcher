Class {
	#name : #SymbolMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchValue'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
SymbolMatcher class >> v: aSymbol [
	^ self new matchValue: aSymbol
]

{ #category : #accessing }
SymbolMatcher >> match: aValue withContext: aContext [
	| value |
	value := aValue isSymbol
		ifTrue: [ aValue ]
		ifFalse: [ aValue value ].
	^ value isSymbol and: [ value = matchValue ]
]

{ #category : #accessing }
SymbolMatcher >> matchValue: aValue [
	matchValue := aValue
]

{ #category : #accessing }
SymbolMatcher >> symbol: aSymbol [ 
	matchValue := aSymbol 
]

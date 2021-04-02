Class {
	#name : #SymboleMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchValue'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
SymboleMatcher class >> v: aSymbol [
	^ self new matchValue: aSymbol
]

{ #category : #accessing }
SymboleMatcher >> match: aValue withContext: aContext [
	^ aValue isSymbol and: [ aValue = matchValue ]
]

{ #category : #accessing }
SymboleMatcher >> matchValue: aValue [
	matchValue := aValue
]

{ #category : #accessing }
SymboleMatcher >> symbol: aSymbol [ 
	matchValue := aSymbol 
]

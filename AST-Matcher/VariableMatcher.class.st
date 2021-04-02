Class {
	#name : #VariableMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchValue'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
VariableMatcher class >> v: aSymbol [
	^ self new matchValue: aSymbol
]

{ #category : #accessing }
VariableMatcher >> match: aValue withContext: aContext [
	^ aValue isVariable and: [ aValue name = matchValue ]
]

{ #category : #accessing }
VariableMatcher >> matchValue: aValue [
	matchValue := aValue
]

{ #category : #accessing }
VariableMatcher >> symbol: aSymbol [ 
	matchValue := aSymbol 
]

Class {
	#name : #StarMatcher,
	#superclass : #Matcher,
	#instVars : [
		'name',
		'condition'
	],
	#category : #'AST-Matcher'
}

{ #category : #initialization }
StarMatcher class >> name: aMatcher [
	^ self new name: aMatcher
]

{ #category : #accessing }
StarMatcher >> condition: aBlock [
	condition := aBlock
]

{ #category : #accessing }
StarMatcher >> isStarMatcher [ 
	^ true
]

{ #category : #accessing }
StarMatcher >> match: aValue withContext: context [
	| node |
	aValue ifNil: [ ^ false ].
	node := context at: name ifAbsentPut: [ OrderedCollection new ].
	node add: aValue.
	^ true
]

{ #category : #accessing }
StarMatcher >> name: aSymbol [
	name := aSymbol
]

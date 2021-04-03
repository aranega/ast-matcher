Class {
	#name : #StarMatcher,
	#superclass : #Matcher,
	#instVars : [
		'name'
	],
	#category : #'AST-Matcher'
}

{ #category : #initialization }
StarMatcher class >> name: aMatcher [
	^ self new name: aMatcher
]

{ #category : #accessing }
StarMatcher >> isStarMatcher [ 
	^ true
]

{ #category : #accessing }
StarMatcher >> match: aValue withContext: context [
	| node |
	node := context
		at: name
		ifAbsentPut: [ OrderedCollection new ].
	node add: aValue.
	^ true
]

{ #category : #accessing }
StarMatcher >> name: aSymbol [
	name := aSymbol
]

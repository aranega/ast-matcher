Class {
	#name : #NodeMatcher,
	#superclass : #Matcher,
	#instVars : [
		'name',
		'condition'
	],
	#category : #'AST-Matcher'
}

{ #category : #accessing }
NodeMatcher class >> name: aName [
	^ self new name: aName
]

{ #category : #accessing }
NodeMatcher >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
NodeMatcher >> isNodeMatcher [
	^ true
]

{ #category : #accessing }
NodeMatcher >> match: aValue withContext: aContext [
	| node |
	aValue ifNil: [ ^ false ].
	node := aContext
		at: name
		ifAbsent: [ aContext at: name put: aValue.
			condition
				ifNotNil: [ ^ condition valueWithArgumentsDictionary: aContext ].
			^ true ].
	condition
		ifNotNil: [ ^ condition valueWithArgumentsDictionary: aContext ].
	^ node = aValue
]

{ #category : #accessing }
NodeMatcher >> name: aName [
	name := aName
]

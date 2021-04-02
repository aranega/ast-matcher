Class {
	#name : #NodeMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchedValue',
		'name',
		'node'
	],
	#category : #'AST-Matcher'
}

{ #category : #accessing }
NodeMatcher class >> name: aName [
	^ self new name: aName
]

{ #category : #accessing }
NodeMatcher >> match: aValue withContext: aContext [
	node := aContext at: name ifAbsent: [ aContext at: name put: aValue. ^ true ].
	^ node = aValue
]

{ #category : #accessing }
NodeMatcher >> name: aName [
	name := aName
]

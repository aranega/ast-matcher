Class {
	#name : #ReturnMatcher,
	#superclass : #Matcher,
	#instVars : [
		'value'
	],
	#category : #'AST-Matcher'
}

{ #category : #'instance creation' }
ReturnMatcher class >> with: aMatcher [
	^ self new value: aMatcher
]

{ #category : #accessing }
ReturnMatcher >> match: aValue withContext: aContext [
	^ aValue isReturn and: [ value match: aValue value withContext: aContext ]
]

{ #category : #accessing }
ReturnMatcher >> value: aMatcher [
	value := aMatcher
]

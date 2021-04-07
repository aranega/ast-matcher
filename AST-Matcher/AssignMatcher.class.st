Class {
	#name : #AssignMatcher,
	#superclass : #Matcher,
	#instVars : [
		'left',
		'right'
	],
	#category : #'AST-Matcher'
}

{ #category : #'instance creation' }
AssignMatcher class >> left: leftMatcher right: rightMatcher [
	| matcher |
	matcher := self new left: leftMatcher; right: rightMatcher.
	^ matcher
]

{ #category : #initialization }
AssignMatcher >> initialize [
	
]

{ #category : #initialization }
AssignMatcher >> left: aMatcher [
	left := aMatcher
]

{ #category : #initialization }
AssignMatcher >> match: aValue withContext: aContext [
aValue ifNil: [ ^ false ].
	^ aValue isAssignment
		and: [ (left match: aValue variable withContext: aContext)
				and: [ right match: aValue value withContext: aContext ] ]
]

{ #category : #initialization }
AssignMatcher >> right: aMatcher [
	right := aMatcher
]

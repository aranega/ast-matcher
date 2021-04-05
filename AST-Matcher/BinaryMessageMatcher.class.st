Class {
	#name : #BinaryMessageMatcher,
	#superclass : #Matcher,
	#instVars : [
		'left',
		'right',
		'operator'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
BinaryMessageMatcher class >> op: opMatcher left: leftMatcher right: rightMatcher [
	| matcher |
	matcher := self new op: opMatcher.
	matcher left: leftMatcher.
	matcher right: rightMatcher.
	^ matcher
]

{ #category : #'as yet unclassified' }
BinaryMessageMatcher >> left: aMatcher [ 
	left := aMatcher
]

{ #category : #'key matching' }
BinaryMessageMatcher >> match: aValue withContext: aContext [
	^ aValue class = RBMessageNode
		and: [ aValue isBinary
				and: [ (operator match: aValue selector withContext: aContext)
						and: [ (left match: aValue receiver withContext: aContext)
								and: [ right match: (aValue arguments at: 1) withContext: aContext ] ] ] ]
]

{ #category : #'key matching' }
BinaryMessageMatcher >> matchValue: aValue [
	operator := aValue
]

{ #category : #'key matching' }
BinaryMessageMatcher >> op: aMatcher [
	operator := aMatcher	
]

{ #category : #'as yet unclassified' }
BinaryMessageMatcher >> right: aMatcher [ 
	right := aMatcher
]

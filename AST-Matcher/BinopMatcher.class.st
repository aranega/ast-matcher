Class {
	#name : #BinopMatcher,
	#superclass : #Matcher,
	#instVars : [
		'left',
		'right',
		'operator'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
BinopMatcher class >> op: opMatcher left: leftMatcher right: rightMatcher [
	| matcher |
	matcher := self new op: opMatcher.
	matcher left: leftMatcher.
	matcher right: rightMatcher.
	^ matcher
]

{ #category : #'as yet unclassified' }
BinopMatcher >> left: aMatcher [ 
	left := aMatcher
]

{ #category : #'key matching' }
BinopMatcher >> match: aValue withContext: aContext [
	^ aValue class = RBMessageNode
		and: [ aValue isBinary
				and: [ (operator match: aValue selector withContext: aContext)
						and: [ (left match: aValue receiver withContext: aContext)
								and: [ right match: (aValue arguments at: 1) withContext: aContext ] ] ] ]
]

{ #category : #'key matching' }
BinopMatcher >> matchValue: aValue [
	operator := aValue
]

{ #category : #'key matching' }
BinopMatcher >> op: aMatcher [
	operator := aMatcher	
]

{ #category : #'as yet unclassified' }
BinopMatcher >> right: aMatcher [ 
	right := aMatcher
]

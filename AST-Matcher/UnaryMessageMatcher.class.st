Class {
	#name : #UnaryMessageMatcher,
	#superclass : #Matcher,
	#instVars : [
		'selectorMatcher',
		'receiverMatcher'
	],
	#category : #'AST-Matcher'
}

{ #category : #'instance creation' }
UnaryMessageMatcher class >> selector: selectorMatcher receiver: receiverMatcher [
	^ self new
		selector: selectorMatcher;
		receiver: receiverMatcher
]

{ #category : #accessing }
UnaryMessageMatcher >> match: aValue withContext: aContext [
	^ aValue class = RBMessageNode
		and: [ aValue isUnary
				and: [(selectorMatcher match: aValue selector withContext: aContext)
								and: [ (receiverMatcher match: aValue receiver withContext: aContext)
									 ] ] ]  
]

{ #category : #accessing }
UnaryMessageMatcher >> receiver: anObject [
	receiverMatcher := anObject
]

{ #category : #accessing }
UnaryMessageMatcher >> selector: anObject [
	selectorMatcher := anObject
]

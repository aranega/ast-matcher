Class {
	#name : #KeywordMessageMatcher,
	#superclass : #Matcher,
	#instVars : [
		'selectorMatcher',
		'argumentsMatchers',
		'receiverMatcher'
	],
	#category : #'AST-Matcher'
}

{ #category : #'instance creation' }
KeywordMessageMatcher class >> everything [
	^self
		selector: #'@selector' asMatcher
		receiver: #'@receiver' asMatcher
		arguments: {#'@arguments' asMatcher}
]

{ #category : #'instance creation' }
KeywordMessageMatcher class >> selector: selectorMatcher receiver: receiverMatcher arguments: argsMatchers [
	^ self new selector: selectorMatcher; receiver: receiverMatcher ; arguments: argsMatchers
]

{ #category : #accessing }
KeywordMessageMatcher >> arguments: anObject [
	argumentsMatchers := anObject
]

{ #category : #accessing }
KeywordMessageMatcher >> match: aValue withContext: aContext [
	aValue ifNil: [ ^ false ].
	aValue class = RBMessageNode
		ifFalse: [ ^ false ].
	aValue isKeyword
		ifFalse: [ ^ false ].
	(selectorMatcher match: aValue selector withContext: aContext) ifFalse: [ ^ false ].
	(receiverMatcher match: aValue receiver withContext: aContext) ifFalse: [ ^false ].
	(argumentsMatchers size = 1
		and: [ argumentsMatchers first isNodeMatcher ])
		ifTrue: [ ^ argumentsMatchers first
				match: aValue arguments
				withContext: aContext ].
	^ argumentsMatchers size = aValue arguments size
		and: [  (1 to: argumentsMatchers size)
								allSatisfy: [ :i | 
									(argumentsMatchers at: i)
										match: (aValue arguments at: i)
										withContext: aContext ] ] 
]

{ #category : #accessing }
KeywordMessageMatcher >> receiver: anObject [
	receiverMatcher := anObject
]

{ #category : #accessing }
KeywordMessageMatcher >> selector: anObject [
	selectorMatcher := anObject
]

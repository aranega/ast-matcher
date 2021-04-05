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
KeywordMessageMatcher class >> selector: selectorMatcher receiver: receiverMatcher arguments: argsMatchers [
	^ self new selector: selectorMatcher; receiver: receiverMatcher ; arguments: argsMatchers
]

{ #category : #accessing }
KeywordMessageMatcher >> arguments: anObject [
	argumentsMatchers := anObject
]

{ #category : #accessing }
KeywordMessageMatcher >> match: aValue withContext: aContext [
	^ aValue class = RBMessageNode
		and: [ aValue isKeyword
				and: [ argumentsMatchers size = aValue arguments size
				and: [ (selectorMatcher match: aValue selector withContext: aContext)
						and: [ (receiverMatcher match: aValue receiver withContext: aContext)
								and: [ (1 to: argumentsMatchers size)
										allSatisfy: [ :i | 
											(argumentsMatchers at: i)
												match: (aValue arguments at: i)
												withContext: aContext ] ] ] ] ] ]
]

{ #category : #accessing }
KeywordMessageMatcher >> receiver: anObject [
	receiverMatcher := anObject
]

{ #category : #accessing }
KeywordMessageMatcher >> selector: anObject [
	selectorMatcher := anObject
]

Class {
	#name : #MatchProduceRule,
	#superclass : #Object,
	#instVars : [
		'matcher',
		'producer',
		'nextRule'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
MatchProduceRule class >> match: aMatcher produce: aBlock [
	^ self new
		matcher: aMatcher;
		produce: aBlock
]

{ #category : #accessing }
MatchProduceRule >> execute [
	
]

{ #category : #accessing }
MatchProduceRule >> execute: aNode [
	| matchResult |
	matchResult := matcher match: aNode.
	matchResult isMatch
		ifTrue:
			[ ^ producer
				valueWithArgumentsDictionary: matchResult matchedVariables ].
				nextRule
		ifNotNil: [ ^ nextRule execute: aNode ].
	^ nil
]

{ #category : #accessing }
MatchProduceRule >> matcher [
	^ matcher
]

{ #category : #accessing }
MatchProduceRule >> matcher: aMatcher [
	matcher := aMatcher
]

{ #category : #accessing }
MatchProduceRule >> next: aMatchProduceRule [
	nextRule := aMatchProduceRule
]

{ #category : #accessing }
MatchProduceRule >> printString [
	^ '({1} => {2})' format: {matcher. producer}
]

{ #category : #accessing }
MatchProduceRule >> produce [
	^ producer
]

{ #category : #accessing }
MatchProduceRule >> produce: aBlock [
	producer := aBlock
]

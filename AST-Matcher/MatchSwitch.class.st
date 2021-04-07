Class {
	#name : #MatchSwitch,
	#superclass : #Object,
	#instVars : [
		'node',
		'first',
		'last'
	],
	#category : #'AST-Matcher'
}

{ #category : #accessing }
MatchSwitch class >> match: aMPRule [
	^ self new first: aMPRule; last: aMPRule 
]

{ #category : #accessing }
MatchSwitch class >> node: aNode [
	^ self new node: aNode
]

{ #category : #accessing }
MatchSwitch >> execute [
	^ first execute: node
]

{ #category : #accessing }
MatchSwitch >> match: aMPRule [
	first
		ifNil: [ first := last := aMPRule.
			^ self ].
	last := last next: aMPRule.
	 
]

{ #category : #accessing }
MatchSwitch >> node: aNode [
	node := aNode
]

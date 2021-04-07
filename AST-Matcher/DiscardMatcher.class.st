Class {
	#name : #DiscardMatcher,
	#superclass : #NodeMatcher,
	#category : #'AST-Matcher'
}

{ #category : #initialization }
DiscardMatcher >> initialize [
	name := #_
]

{ #category : #initialization }
DiscardMatcher >> match: aValue withContext: aContext [
	^ aValue isNotNil
]

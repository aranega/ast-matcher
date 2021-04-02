Class {
	#name : #Matcher,
	#superclass : #Object,
	#category : #'AST-Matcher'
}

{ #category : #accessing }
Matcher >> + aMatcher [
	^ BinopMatcher op: #+ left: self right: aMatcher
]

{ #category : #accessing }
Matcher >> asMatcher [
	^ self
]

{ #category : #accessing }
Matcher >> match: aValue [
	| result |
	result := MatcherResult new.
	result isMatch: (self match: aValue withContext: result).
	^ result
]

{ #category : #accessing }
Matcher >> match: aValue withContext: context [
	self subclassResponsibility 
]

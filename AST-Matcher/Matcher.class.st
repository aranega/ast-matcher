Class {
	#name : #Matcher,
	#superclass : #Object,
	#category : #'AST-Matcher'
}

{ #category : #accessing }
Matcher >> + aMatcher [
	^ BinaryMessageMatcher op: #+ left: self right: aMatcher
]

{ #category : #accessing }
Matcher >> asMatcher [
	^ self
]

{ #category : #accessing }
Matcher >> isStarMatcher [
	^ false
]

{ #category : #accessing }
Matcher >> match: aValue [
	| result |
	result := MatcherResult new.
	result isMatch: (self match: aValue withContext: result).
	^ result
]

{ #category : #accessing }
Matcher >> match: aValue withContext: aContext [
	self subclassResponsibility 
]

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
Matcher >> => produceRule [
	^ MatchProduceRule match: self produce: produceRule
]

{ #category : #accessing }
Matcher >> asMatcher [
	^ self
]

{ #category : #accessing }
Matcher >> condition: ablock [
]

{ #category : #accessing }
Matcher >> isNodeMatcher [
	^ false
]

{ #category : #accessing }
Matcher >> isSequenceMatcher [
	^ false
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

{ #category : #accessing }
Matcher >> matchValidate: aValue withContext: result [

	^ 4
]

{ #category : #accessing }
Matcher >> matcher [
	^ self
]

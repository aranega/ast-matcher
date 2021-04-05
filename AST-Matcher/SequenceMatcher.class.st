Class {
	#name : #SequenceMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchers'
	],
	#category : #'AST-Matcher'
}

{ #category : #'as yet unclassified' }
SequenceMatcher class >> matchers: aMatcherCollection [
	^ self new matchers: aMatcherCollection
]

{ #category : #accessing }
SequenceMatcher >> at: index [
	^ matchers at: index
]

{ #category : #accessing }
SequenceMatcher >> match: aValue withContext: context [
	| sequenceSize sizeOfStarMatcher matcherArray starMatcher index newMatchers |
	sequenceSize := aValue statements size.
	sizeOfStarMatcher := sequenceSize
		- (matchers reject: [ :matcher | matcher isStarMatcher ]) size.
	starMatcher := (matchers select: [ :matcher | matcher isStarMatcher ]).
	starMatcher ifEmpty: [ ^ (1 to: sequenceSize)
		allSatisfy: [ :i | 
			(matchers at: i)
				match: (aValue statements at: i)
				withContext: context ]  ].
	starMatcher := starMatcher first.
	matcherArray := Array new: sizeOfStarMatcher.
	1 to: sizeOfStarMatcher do: [ :i | matcherArray at: i put: starMatcher ].
	index := matchers indexOf: starMatcher.
	newMatchers := matchers
		copyReplaceFrom: index
		to: index
		with: matcherArray.
	^ (1 to: sequenceSize)
		allSatisfy: [ :i | 
			(newMatchers at: i)
				match: (aValue statements at: i)
				withContext: context ]
]

{ #category : #accessing }
SequenceMatcher >> matchers: aMatcherCollection [
	matchers := aMatcherCollection 
]

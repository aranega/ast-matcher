Class {
	#name : #SequenceMatcher,
	#superclass : #Matcher,
	#instVars : [
		'matchers',
		'condition'
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
SequenceMatcher >> condition: aBlock [
	condition := aBlock
]

{ #category : #accessing }
SequenceMatcher >> match: aValue withContext: context [

	| sequenceSize sizeOfStarMatcher matcherArray starMatcher index newMatchers  res |
	sequenceSize := aValue statements size.
	sizeOfStarMatcher := sequenceSize
		- (matchers reject: [ :matcher | matcher isStarMatcher ]) size.
	(sizeOfStarMatcher < 0) ifTrue: [ ^ false ].
	starMatcher := matchers select: [ :matcher | matcher isStarMatcher ].
	starMatcher
		ifEmpty: [ 
			res := (1 to: sequenceSize)
				allSatisfy:
					[ :i | (matchers at: i) match: (aValue statements at: i) withContext: context ].
			res
				and: [ condition
						ifNotNil: [ ^ condition valueWithArgumentsDictionary: context ] ].
			^ res ].
	starMatcher := starMatcher first.
	matcherArray := Array new: sizeOfStarMatcher.
	1 to: sizeOfStarMatcher do: [ :i | matcherArray at: i put: starMatcher ].
	index := matchers indexOf: starMatcher.
	newMatchers := matchers
		copyReplaceFrom: index
		to: index
		with: matcherArray.
	res := (1 to: sequenceSize)
				allSatisfy:
					[ :i | (newMatchers at: i) match: (aValue statements at: i) withContext: context ].
			res
				and: [ condition
						ifNotNil: [ ^ condition valueWithArgumentsDictionary: context ] ].
			^ res

]

{ #category : #accessing }
SequenceMatcher >> matchers: aMatcherCollection [
	matchers := aMatcherCollection 
]

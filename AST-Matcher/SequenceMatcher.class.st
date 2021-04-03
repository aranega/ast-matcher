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
		- (matchers select: [ :matcher | matcher isStarMatcher not ]) size.
	starMatcher := (matchers select: [ :matcher | matcher isStarMatcher ])
		first.
	matcherArray := Array new: sizeOfStarMatcher.
	1 to: sizeOfStarMatcher do: [ :i | matcherArray at: i put: starMatcher ].
	index := matchers indexOf: starMatcher.
	newMatchers := matchers
		copyReplaceFrom: index
		to: index
		with: matcherArray.
	^ (aValue statements withIndexCollect: [ :stmt :i | (newMatchers at: i) match: stmt withContext: context ]) allSatisfy: [ :each | each = true ]
]

{ #category : #accessing }
SequenceMatcher >> matchers: aMatcherCollection [
	matchers := aMatcherCollection 
]

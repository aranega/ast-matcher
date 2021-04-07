Extension { #name : #BlockClosure }

{ #category : #'*AST-Matcher' }
BlockClosure >> => aProduction [
	^ MatchProduceRule match: self matcher produce: aProduction
]

{ #category : #'*AST-Matcher' }
BlockClosure >> matcher [
	^ self matcherWith: nil
]

{ #category : #'*AST-Matcher' }
BlockClosure >> matcherWith: conditionBlock [
	| ast |
	ast := self sourceNode.
	^ ast body acceptVisitor: (MatcherVisitor new condition: conditionBlock)
]

{ #category : #'*AST-Matcher' }
BlockClosure >> valueWithArgumentsDictionary: aDictionnary [
	^ self valueWithArguments: (self argumentNames collect: [:name | aDictionnary at: name])
]

Extension { #name : #Symbol }

{ #category : #'*AST-Matcher' }
Symbol >> asMatcher [
	(self beginsWith: #@*)
		ifTrue: [ ^ NodeMatcher name: self ].
	self = #@%
		ifTrue: [ ^ DiscardMatcher new ].
	self = #_
		ifTrue: [ ^ DiscardMatcher new ].
	self first = $@
		ifTrue: [ ^ NodeMatcher name: self allButFirst asSymbol ].
	^ SymbolMatcher v: self
]

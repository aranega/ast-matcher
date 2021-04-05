Extension { #name : #Symbol }

{ #category : #'*AST-Matcher' }
Symbol >> asMatcher [
	(self beginsWith: #@*)
		ifTrue: [ ^ NodeMatcher name: self ].
	(self beginsWith: #*)
		ifTrue: [ ^ StarMatcher name: self allButFirst asSymbol ].
	self = #@%
		ifTrue: [ ^ DiscardMatcher new ].
	self = #_
		ifTrue: [ ^ DiscardMatcher new ].
	self first = $_
		ifTrue: [ ^ NodeMatcher name: self allButFirst asSymbol ].
	self first = $@
		ifTrue: [ ^ NodeMatcher name: self allButFirst asSymbol ].
	^ SymbolMatcher v: self
]


local:
	danger-swift local

ci:
	swift run danger-swift ci

dep:
	npm install -g danger
	brew install danger/tap/danger-swift

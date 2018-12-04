test-all:
	raco test sicp

test:
	raco test $(dir)

.PHONY: test, test-all

.PHONY: help release

help:
	@echo "Available targets:"
	@echo ""
	@echo "  make release VERSION=v1.2.3 - Tag, push, and create a GitHub release."

release:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make release VERSION=v1.2.3"; \
		exit 1; \
	fi
	@case "$(VERSION)" in \
		v[0-9]*.[0-9]*.[0-9]*) ;; \
		*) echo "VERSION must look like vN.M.P, got: $(VERSION)"; exit 1 ;; \
	esac
	gh release create $(VERSION) --generate-notes
	git fetch --tags
	major=$$(echo $(VERSION) | cut -d. -f1); \
	git tag -f $$major $(VERSION); \
	git push origin $$major --force

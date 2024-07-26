.PHONY: default flutter-activate-melos clean git-clean format-all upgrade-all

default:
	melos bs

flutter-activate-melos:
	flutter pub global activate melos

clean:
	melos flutter_clean --no-select

git-clean:
	git clean -fdx

format-all:
	@melos exec -- "dart format ."

upgrade-all:
	@melos exec -- "flutter pub upgrade --major-versions"

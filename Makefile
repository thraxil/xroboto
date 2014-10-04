newvideo:
	export FILENAME=`date +'video/%FT%H%M%S.md'`; \
	hugo new $$FILENAME; \
	git add content/$$FILENAME

server:
	hugo server --watch --buildDrafts --verboseLog=true -v

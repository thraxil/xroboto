newvideo:
	export FILENAME=`date +'video/%Y/%m/%d/%H%M%S.md'`; \
	hugo new $$FILENAME --kind=video; \
	git add content/$$FILENAME

server:
	hugo server --watch --buildDrafts --verboseLog=true -v

deploy:
	rm -rf public/*
	hugo
	rsync -avp --delete public/ north.thraxil.org:/var/www/xroboto/


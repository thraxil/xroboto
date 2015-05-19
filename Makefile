newvideo:
	export FILENAME=`date +'video/%Y/%m/%d/%H%M%S.md'`; \
	hugo new $$FILENAME --kind=video; \
	git add content/$$FILENAME

server:
	hugo --buildDrafts
	cp public/json/index.html public/js/videos.json
	hugo server --watch --buildDrafts --verboseLog=true -v

deploy:
	rm -rf public/*
	hugo
	cp public/json/index.html public/js/videos.json
	rsync -avp --delete public/ north.thraxil.org:/var/www/xroboto/


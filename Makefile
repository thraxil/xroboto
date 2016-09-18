PROD_URL=https://xroboto.thraxil.org/
PROD_BUCKET=site.xroboto-thraxil-org
INTERMEDIATE_STEPS ?= cp public/json/index.html public/js/videos.json
S3_FLAGS ?= -c ~/.s3cfg-xroboto --acl-public --delete-removed --no-progress --no-mime-magic --guess-mime-type
JS_FILES=static/js/src

all: jshint jscs

include *.mk

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py


newvideo:
	export FILENAME=`date +'video/%Y/%m/%d/%H%M%S.md'`; \
	hugo new $$FILENAME --kind=video; \
	git add content/$$FILENAME

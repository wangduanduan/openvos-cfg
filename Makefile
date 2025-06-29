my_version=$(shell cat VERSION)
my_build_time=$(shell date)
image_name=wangduanduan/opensips:3.5.6

sinclude openvos.std.rc
export

cfg:
	m4  -P  \
		-D my_version=$(my_version) \
		-D my_build_time="$(my_build_time)" \
		main.m4 > dist/opensips.cfg

run: cfg
	-docker rm -f ops
	docker run -d --name ops \
	-v $$PWD/dist:/usr/local/etc/opensips \
	-v $$PWD/log:/var/log \
	$(image_name) -m 1024 -M 64

exec:
	docker exec -it ops bash

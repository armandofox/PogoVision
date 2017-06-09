APPNAME = ScrollingPix
ROKU_DEV_TARGET = 192.168.1.190
DEVPASSWORD = dumdum
include ../app.mk

SRCS = $(shell find components manifest source -type f)
TAGS: $(SRCS)
	etags $^

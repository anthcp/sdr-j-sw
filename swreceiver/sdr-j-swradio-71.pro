######################################################################
# Automatically generated by qmake (2.01a) Wed Jun 19 18:47:11 2013
######################################################################
TEMPLATE = app
QT	+= widgets
CONFIG	+= console
TARGET	= sdr-j-swreceiver-7.1

QT_DEBUG_PLUGINS	= 1
DEPENDPATH += .  \
	      ./plugins \
	      ./plugins/decoders \
	      ./plugins/input \
	      ./includes \
	      ./includes/various \
	      ./includes/output \
	      ./includes/filters \
	      ./includes/scopes-qwt6 \
	      ./src \
	      ./src/various \
	      ./src/output
INCLUDEPATH += .  \
	      ./plugins \
	      ./plugins/decoders \
	      ./plugins/input \
	      ./includes \
	      ./includes/various \
	      ./includes/output \
	      ./includes/filters \
	      ./includes/scopes-qwt6 

#CONFIG += static

# Input
HEADERS += ./includes/swradio-constants.h \
	   ./includes/gui.h \
           ./includes/output/pa-writer.h \
           ./includes/various/agchandler.h \
	   ./includes/various/attenuator.h \
           ./includes/various/ringbuffer.h \
           ./includes/various/fft.h \
           ./includes/various/oscillator.h \
           ./includes/various/sincos.h \
           ./includes/various/utilities.h \
	   ./includes/various/resampler.h \
	   ./includes/various/newconverter.h \
	   ./includes/various/deviceloader.h \
	   ./includes/various/decoderloader.h \
	   ./includes/various/s-meter.h \
           ./includes/filters/fft-filters.h \
           ./includes/filters/fir-filters.h \
           ./includes/filters/iir-filters.h \
           ./includes/scopes-qwt6/fft-scope.h \
	   ./includes/scopes-qwt6/scope.h \
           ./plugins/input/rig-interface.h \
           ./plugins/input/pa-reader.h \
	   ./plugins/input/no-rig.h \
	   ./plugins/decoders/decoder-interface.h 
	   
FORMS	+= ./src/sdrgui.ui
SOURCES += ./src/main.cpp \
	   ./src/gui.cpp \
	   ./src/various/deviceloader.cpp \
	   ./src/various/decoderloader.cpp \
	   ./src/output/pa-writer.cpp \
           ./src/various/agchandler.cpp \
	   ./src/various/attenuator.cpp \
           ./src/various/fft.cpp \
           ./src/various/oscillator.cpp \
           ./src/various/sincos.cpp \
           ./src/various/utilities.cpp \
	   ./src/various/resampler.cpp \
	   ./src/various/s-meter.cpp \
           ./src/filters/fft-filters.cpp \
           ./src/filters/fir-filters.cpp \
           ./src/filters/iir-filters.cpp \
           ./src/scopes-qwt6/fft-scope.cpp \
	   ./src/scopes-qwt6/scope.cpp \
           ./plugins/input/pa-reader.cpp \	
	   ./plugins/input/no-rig.cpp

#for 32 bits windows, choose
win32 {
DESTDIR		= ../../windows-bin-sw
# includes in mingw differ from the includes in fedora linux
INCLUDEPATH += /usr/i686-w64-mingw32/sys-root/mingw/include
INCLUDEPATH += /usr/i686-w64-mingw32/sys-root/mingw/include/qt5/qwt
LIBS	+= -lfftw3f
LIBS	+= -lportaudio
LIBS	+= -lqwt-qt5
LIBS	+= -lusb-1.0
LIBS	+= -lsndfile
LIBS	+= -lsamplerate
LIBS	+= -lole32
LIBS	+= -lwinmm
}

#It is - obviously - possible to generate a 64 bits version,
#However, the dll handler will not work anymore
#for 64 bits windows, choose
#win32 {
#DESTDIR	= ../../windows64-bin
## includes in mingw differ from the includes in fedora linux
#INCLUDEPATH += /usr/x86-w64-mingw32/sys-root/mingw/include
#INCLUDEPATH += /usr/x86-w64-mingw32/sys-root/mingw/include/qwt
#LIBS	+= -lfftw3f-3
#LIBS	+= -lportaudio
#LIBS	+= -lqwt
#LIBS	+= -lusb-1.0
#LIBS	+= -lsndfile
#LIBS	+= -lsamplerate
#LIBS	+= -lole32
#LIBS	+= -lwinmm
#}

unix {
DESTDIR		= ../linux-bin
INCLUDEPATH	+= /usr/include/qwt
LIBS		+= -L/usr/lib64
LIBS		+= -L/usr/lib/x86_84-linux-gnu
LIBS		+= -L/lib64
# ubuntu 15.04
#LIBS		+= -lqwt -lrt -lsndfile -lsamplerate -lportaudio -lusb-1.0 -lfftw3f 
# fedora 21
LIBS		+= -lqwt-qt5 -lrt -lsndfile -lsamplerate -lportaudio -lusb-1.0 -lfftw3f 
}


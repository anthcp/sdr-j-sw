cmake_minimum_required( VERSION 2.8 )
#set ( CMAKE_BUILD_TYPE Release )
set (objectName device_remote)
ADD_DEFINITIONS (-DQT_PLUGIN)
ADD_DEFINITIONS (-DQT_SHARED)
ADD_DEFINITIONS (-DQT_NO_DEBUG)
ADD_DEFINITIONS (-DQR_NETWORKING)
set (CMAKE_INSTALL_PREFIX ../../../../../../../)
add_definitions ( -Wall )

	find_package (Qt5Widgets REQUIRED)
	find_package (Qt5Declarative REQUIRED)
	find_package (Qt5Network REQUIRED)

	find_library (DYNAMIC_LOAD dl)
	if(NOT(DYNAMIC_LOAD))
	   message(FATAL_ERROR "please install -ldl")
	else(NOT(DYNAMIC_LOAD))
	   set(extraLibs ${DYNAMIC_LOAD})
	endif(NOT(DYNAMIC_LOAD))
#

	find_library (DYNAMIC_LOAD dl)
	if(NOT(DYNAMIC_LOAD))
	   message(FATAL_ERROR "please install -ldl")
	else(NOT(DYNAMIC_LOAD))
	   set(extraLibs ${DYNAMIC_LOAD})
	endif(NOT(DYNAMIC_LOAD))


	find_library (PTHREADS pthread)
	if(NOT(PTHREADS))
	   message (FATAL_ERROR "please install libpthread")
	else(NOT(PTHREADS))
	   set (extraLibs ${extraLibs} ${PTHREADS})
	endif(NOT(PTHREADS))

	include_directories (
	   ${CMAKE_SOURCE_DIR}
	   ${CMAKE_CURRENT_BINARY_DIR}
	   ${QT5Widgets_INCLUDES}
	   ${QT_QTCORE_INCLUDE_DIR}
	   ${QT_QTGUI_INCLUDE_DIR}
	   .
	   ../
	   ../.. 
	   ../decoder-utils 
	   ../../radio-utils 
	   ../../../includes 
	   ../../../includes/filters 
	   ../../../includes/various 
	)

	set ( ${objectName}_HDRS
	   ../rig-interface.h 
	   ./remote.h 
	   ../../../includes/filters/fir-filters.h 
	   ../../../includes/filters/iir-filters.h 
	   ../../../includes/various/sincos.h 
	   ../../../includes/various/utilities.h 
	   ../../../includes/swradio-constants.h
	)

	set ( ${objectName}_SRCS
	   ./remote.cpp 
	   ../../../src/filters/fir-filters.cpp 
	   ../../../src/filters/iir-filters.cpp 
	   ../../../src/various/sincos.cpp 
	   ../../../src/various/utilities.cpp 
	)

	set (${objectName}_UIS ./widget.ui)
	QT5_WRAP_UI(UIS ${${objectName}_UIS})

	set ( ${objectName}_MOCS
	   ../rig-interface.h 
	   ./remote.h
	)

	QT5_WRAP_CPP(MOCS ${${objectName}_MOCS})

	add_library (${objectName}
	             SHARED ${${objectName}_SRCS}
	             ${UIS} ${RSCS} ${TRS} ${MOCS}
	)

	target_link_libraries (${objectName}
	                       Qt5::Widgets
	                       Qt5::Network
	                       ${extraLibs}
	)


	INSTALL(TARGETS ${objectName} LIBRARY DESTINATION ./linux-bin/input-plugins-sw)

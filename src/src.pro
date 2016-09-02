TEMPLATE = lib
TARGET = systemsettings

CONFIG += qt create_pc create_prl no_install_prl c++11
QT += qml dbus systeminfo
QT -= gui

CONFIG += c++11 hide_symbols link_pkgconfig
PKGCONFIG += profile mlite5 timed-qt5 libshadowutils blkid libcrypto nemomodels-qt5

system(qdbusxml2cpp -p mceiface.h:mceiface.cpp mce.xml)
system(qdbusxml2cpp -c ConnmanVpnProxy -p connmanvpnproxy ../dbus/net.connman.vpn.xml -i qdbusxml2cpp_dbus_types.h)
system(qdbusxml2cpp -c ConnmanVpnConnectionProxy -p connmanvpnconnectionproxy ../dbus/net.connman.vpn.Connection.xml -i qdbusxml2cpp_dbus_types.h)

SOURCES += \
    languagemodel.cpp \
    datetimesettings.cpp \
    profilecontrol.cpp \
    alarmtonemodel.cpp \
    mceiface.cpp \
    displaysettings.cpp \
    aboutsettings.cpp \
    certificatemodel.cpp \
    vpnmodel.cpp \
    connmanvpnproxy.cpp \
    connmanvpnconnectionproxy.cpp \
    developermodesettings.cpp \
    diskusage.cpp \
    diskusage_impl.cpp \
    partition.cpp \
    partitionmanager.cpp \
    partitionmodel.cpp

PUBLIC_HEADERS = \
    languagemodel.h \
    datetimesettings.h \
    profilecontrol.h \
    alarmtonemodel.h \
    mceiface.h \
    displaysettings.h \
    aboutsettings.h \
    certificatemodel.h \
    vpnmodel.h \
    connmanvpnproxy.h \
    connmanvpnconnectionproxy.h \
    developermodesettings.h \
    diskusage.h \
    partition.h \
    partitionmanager.h \
    partitionmodel.h \
    systemsettingsglobal.h

HEADERS += \
    $$PUBLIC_HEADERS \
    qdbusxml2cpp_dbus_types.h \
    diskusage_p.h \
    partition_p.h \
    partitionmanager_p.h

DEFINES += \
    SYSTEMSETTINGS_BUILD_LIBRARY

develheaders.path = /usr/include/systemsettings
develheaders.files = $$PUBLIC_HEADERS

target.path = $$[QT_INSTALL_LIBS]
pkgconfig.files = $$PWD/pkgconfig/systemsettings.pc
pkgconfig.path = $$target.path/pkgconfig

QMAKE_PKGCONFIG_NAME = lib$$TARGET
QMAKE_PKGCONFIG_DESCRIPTION = System settings application development files
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$develheaders.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_REQUIRES = Qt5Core Qt5DBus profile

INSTALLS += target develheaders pkgconfig

project(plasma-phone-components)

# minimal requirements
cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
set (QT_MIN_VERSION "5.2.0")
set(KF5_MIN_VERSION "5.0.0")

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


find_package(ECM 0.0.9 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)
include(ECMOptionalAddSubdirectory)
include(ECMInstallIcons)
include(ECMSetupVersion)
include(ECMMarkNonGuiExecutable)
include(ECMGenerateHeaders)
include(GenerateExportHeader)
include(FeatureSummary)

#find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED Core Gui Widgets Qml Quick Test)

find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS Plasma )
#find_package(KF5 REQUIRED COMPONENTS PlasmaQuick DBusAddons )

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

include(CheckIncludeFiles)

#plasma_install_package(shell org.kde.plasma.aireal shells)

# add_subdirectory(applets)
# add_subdirectory(containments)

install(DIRECTORY app/ DESTINATION ${KDE_INSTALL_DATAROOTDIR}/kpackage/genericqml/org.kde.aireal.app)
install(FILES app/metadata.desktop DESTINATION ${XDG_APPS_INSTALL_DIR} RENAME org.kde.aireal.app.desktop)


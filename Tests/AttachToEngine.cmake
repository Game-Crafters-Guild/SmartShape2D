# Optional test attachment through CMAKE_PROJECT_INCLUDE. Runtime package builds use package.json.
get_property(_smartshape_tests_scheduled GLOBAL PROPERTY SMARTSHAPE_TESTS_SCHEDULED)
if(NOT _smartshape_tests_scheduled)
    set_property(GLOBAL PROPERTY SMARTSHAPE_TESTS_SCHEDULED TRUE)
    set_property(GLOBAL PROPERTY SMARTSHAPE_TESTS_ROOT "${CMAKE_CURRENT_LIST_DIR}")
    function(smartshape_attach_tests)
        get_property(package_tests GLOBAL PROPERTY SMARTSHAPE_TESTS_ROOT)
        if(NOT TARGET Engine OR NOT TARGET EditorTests)
            message(FATAL_ERROR "SmartShape tests require an OpenEngine source build with BUILD_TESTING=ON")
        endif()
        include("${package_tests}/CMakeLists.txt")
        target_sources(EditorTests PRIVATE
            "${package_tests}/ShapeEditorUndoTests.cpp"
            "${package_tests}/../Editor/CreateSmartShapeCommand.cpp")
        set_source_files_properties(
            "${package_tests}/ShapeEditorUndoTests.cpp"
            "${package_tests}/../Editor/CreateSmartShapeCommand.cpp"
            TARGET_DIRECTORY EditorTests
            PROPERTIES INCLUDE_DIRECTORIES "${package_tests}/../Native;${package_tests}/../Editor")
    endfunction()
    cmake_language(DEFER DIRECTORY "${CMAKE_SOURCE_DIR}" CALL smartshape_attach_tests)
endif()

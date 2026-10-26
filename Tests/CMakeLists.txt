find_package(GTest CONFIG REQUIRED)
add_executable(SmartShape2DTests
    "${CMAKE_CURRENT_LIST_DIR}/ShapeGeometryTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeDestructionTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeDestructionHistoryTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeDestructionHistory.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeDestruction.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeExplosion.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeAnchorTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/EdgeQuadTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/TextureSetTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeOffsetTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeAnchor.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/EdgeQuad.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeOffset.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeMesh.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeEdges.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/clipper2/clipper.engine.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/clipper2/clipper.offset.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/clipper2/clipper.rectclip.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeRuntimeTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeRuntime.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeCollisionOwnerTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeCollisionOwner.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/ShapeCollisionTests.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeCollision.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/../Native/SmartShape2D/ShapeGeometry.cpp")
target_compile_features(SmartShape2DTests PRIVATE cxx_std_20)
target_include_directories(SmartShape2DTests PRIVATE "${CMAKE_CURRENT_LIST_DIR}/../Native")
target_link_libraries(SmartShape2DTests PRIVATE Engine GTest::gtest_main)
ge_set_output_tests(SmartShape2DTests)
ge_stage_runtime_dependencies(SmartShape2DTests)
add_test(NAME SmartShape2DTests COMMAND SmartShape2DTests)

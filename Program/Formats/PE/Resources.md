# Resources
[Wikipedia](https://en.wikipedia.org/wiki/Resource_(Windows))

## CMake
`resource.rc.cmake.in`:
```cmake
1 TYPELIB "resource.rc"

1 VERSIONINFO
 FILEVERSION @PROJECT_VERSION_MAJOR@, @PROJECT_VERSION_MINOR@, @PROJECT_VERSION_PATCH@, 0
 PRODUCTVERSION @PROJECT_VERSION_MAJOR@, @PROJECT_VERSION_MINOR@, @PROJECT_VERSION_PATCH@, 0
 FILEFLAGSMASK 0x3fL
#ifdef _DEBUG
 FILEFLAGS 0x1L
#else
 FILEFLAGS 0x0L
#endif
 FILEOS 0x4L
 FILETYPE 0x2L
 FILESUBTYPE 0x0L
BEGIN
    BLOCK "StringFileInfo"
    BEGIN
        BLOCK "040904e4"
        BEGIN
            VALUE "CompanyName", "https://github.com/Chaoses-Ib/IbInputSimulator"
            VALUE "FileDescription", "A library for simulating keyboard and mouse input with drivers"
            VALUE "FileVersion","@PROJECT_VERSION_MAJOR@.@PROJECT_VERSION_MINOR@.@PROJECT_VERSION_PATCH@.0"
            VALUE "InternalName", "@PROJECT_NAME@"
            VALUE "LegalCopyright", "Copyright (c) 2024 Chaoses-Ib"
#ifdef _DEBUG
            VALUE "OriginalFilename", "IbInputSimulatorD.dll"
#else
            VALUE "OriginalFilename", "IbInputSimulator.dll"
#endif
            VALUE "ProductName", "IbInputSimulator"
            VALUE "ProductVersion","@PROJECT_VERSION_MAJOR@.@PROJECT_VERSION_MINOR@.@PROJECT_VERSION_PATCH@.0"
        END
    END
    BLOCK "VarFileInfo"
    BEGIN
        VALUE "Translation", 0x409, 1252
    END
END
```
```cmake
set(PROJECT_VERSION_MAJOR 0)
set(PROJECT_VERSION_MINOR 1)
set(PROJECT_VERSION_PATCH 0)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/resource.rc.cmake.in resource.rc @ONLY)
target_sources(dll_target_name PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/resource.rc")
```

[How to Generate Windows DLL versioning information with CMake - Stack Overflow](https://stackoverflow.com/questions/6693100/how-to-generate-windows-dll-versioning-information-with-cmake)

[c++ - Adding Copyright / File description info to dll when compiling with cmake - Stack Overflow](https://stackoverflow.com/questions/63133300/adding-copyright-file-description-info-to-dll-when-compiling-with-cmake)

[How do I generate Windows DLL versioning information with CMake? - Stack Overflow](https://stackoverflow.com/questions/57791746/how-do-i-generate-windows-dll-versioning-information-with-cmake)
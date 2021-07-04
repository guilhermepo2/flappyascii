-- Visions2D
-- Dependencies: SDL2, SDL2 TTF, GLEW (TODO: dynamically link? I don't know!)
-- Header Only dependencies: spdlog, dearimgui, stbimage, glm, rapidjsson

workspace "FlappyASCII"
    architecture "x64"

    configurations
    {
        "Debug"
    }

    startproject "flappyascii"

outputdir = "%{cfg.buildcfg}-%{cfg.system}.%{cfg.architecture}"

include "visions2D/v2d_standalone.lua"

project "flappyascii"
        location "flappyascii"
        kind "ConsoleApp"
        language "C++"
        warnings "Extra"

        targetdir("bin/" .. outputdir .. "/%{prj.name}")
        objdir("binobj/" .. outputdir .. "/%{prj.name}")

        files
        {
            "%{prj.name}/**.h",
            "%{prj.name}/**.cpp",
        }

        links
        {
            "visions2D"
        }

        -- This is exactly the same includedirs as visions2D, have to fing a way to fix this!
        includedirs
        {
            "%{prj.name}/src",
            "visions2D/visions2D/src",
            "visions2D/visions2D/thirdparty/SDL2-2.0.12/include",
            "visions2D/visions2D/thirdparty/SDL2_ttf-2.0.15/include",
            "visions2D/visions2D/thirdparty/glew-2.1.0/include",
            "visions2D/visions2D/thirdparty/spdlog/include",
            "visions2D/visions2D/thirdparty/dearimgui",
            -- "%{IncludeDirectories.STBIMAGE}",
            "visions2D/visions2D/thirdparty/glm",
            "visions2D/visions2D/thirdparty/rapidjson-1.1.0/include"
        }

        filter "system:windows"
            cppdialect "C++17"
            staticruntime "On"
            systemversion "latest"

            defines
            {
                "visions2D_DEBUG",
                "flappyascii_DEBUG"
            }

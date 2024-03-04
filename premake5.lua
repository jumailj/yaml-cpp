project "yaml-cpp"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

    filter "configurations:Debug"
        defines "FLARE_DEBUG"
        runtime "Debug"
        symbols  "on"

    filter "configurations:Release"
        defines "FLARE_RELEASE"
        runtime "Release"
        symbols  "off"


    filter "configurations:Ship"
        defines "FLARE_DEBUG"
        runtime "Release"
        symbols  "off"
        
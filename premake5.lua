
-- Workspace: AutoGame
-- -------------------
workspace "SilverEngine"
	architecture "x86_64"
	configurations { "Debug", "Release" }

-- Project: AutoGame
-- -----------------
	project "SilverEngine"
		location "SilverEngine"
		kind "ConsoleApp"
		language "C++"
		cppdialect "c++17"
		staticruntime "Off"

		targetdir "Bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
		objdir "Bin-Int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"

		pchheader "AgPch.h"
		pchsource "%{prj.name}/Src/AgPch.cpp"

		files {
			"%{prj.name}/Src/**.cpp",
			"%{prj.name}/Src/**.h"
		}

		includedirs {
			"%{prj.name}/Src",
			"Vendor/Glfw/include",
			"Vendor/Glad/include"
		}

		libdirs {
			"Vendor/Glfw/lib-vc2019",
			"Vendor/Glad"
		}

		links {
			"glfw3.lib",
			"glad.lib",
			"opengl32.lib"
		}

		filter "system:windows"
			defines "AG_PLAT_WINDOWS"
			systemversion "latest"

		filter "configurations:Debug"
			defines "AG_BUILD_DEBUG"
			symbols "Full"
			optimize "Off"

		filter "configurations:Release"
			defines "AG_BUILD_RELEASE"
			symbols "Off"
			optimize "Full"
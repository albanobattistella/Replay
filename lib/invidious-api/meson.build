invidious_api_sources = files (
	'models/thumbnail.vala',
	'models/video.vala',

	'resources/videos.vala',

	'utils/api-error.vala',
	'utils/camel-case.vala',

	'api-client.vala',
)

invidious_api_deps = [
	gio_dep,
	gee_dep,
	soup_dep,
	json_glib_dep,
]

invidious_api = library ('invidious-api', invidious_api_sources,
	dependencies: invidious_api_deps,
	     install: true,
)

invidious_api_dep = declare_dependency (
	dependencies: invidious_api_deps,
	include_directories: '.',
	link_with: invidious_api,
)

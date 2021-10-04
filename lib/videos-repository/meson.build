videos_repository_sources = files (
	'models/video.vala',

	'videos-repository.vala',
)

videos_repository_deps = [
	gio_dep,
	invidious_api_dep,
]

videos_repository = library ('videos-repository', videos_repository_sources,
	dependencies: videos_repository_deps,
	install: true,
)

videos_repository_dep = declare_dependency (
	dependencies: videos_repository_deps,
	include_directories: '.',
	link_with: videos_repository,
)

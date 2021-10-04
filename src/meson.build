replay_sources = files (
	'view-models/trending-view-model.vala',

	'views/view.vala',

	'app.vala',
	'app-window.vala',
)


replay_sources += icon_resources

replay_sources += gnome.compile_resources (
	'replay-ui-resources',
	'replay-ui-resources.xml',
)


replay_deps = [
	gio_dep,
	gtk_dep,
	gee_dep,
	config_dep,
	adwaita_dep,
	videos_repository_dep,
]


executable (meson.project_name (), replay_sources,
	       dependencies: replay_deps,
	            install: true,
	      win_subsystem: 'windows',
	include_directories: confinc,
)

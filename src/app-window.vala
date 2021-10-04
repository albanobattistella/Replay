/*
 * Copyright 2019 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/com/github/replaydev/Replay/app-window.ui")]
class Rpy.AppWindow : Adw.ApplicationWindow {
	public AppWindow (App app) {
		Object (application: app);
	}

	construct {
#if DEVEL
		this.add_css_class ("devel");
#endif

		this.trending_list.model = new Gtk.NoSelection (this.view_model.trending_list);
		this.trending_list.factory = new Gtk.BuilderListItemFactory.from_resource (null, "/com/github/replaydev/Replay/video-item.ui");
	}

	[GtkChild]
	private unowned Gtk.ListView trending_list;

	public TrendingViewModel view_model { get; default = new TrendingViewModel (); }
}

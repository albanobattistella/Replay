/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

private class Rpy.TrendingViewModel : Object {
	public ListStore trending_list { get; default = new ListStore (typeof (Video)); }

	construct {
		var session = new Soup.Session.with_options ("user-agent", "Mozilla/5.0 (GNOME 41) Replay/0.1");

		var logger = new Soup.Logger (Soup.LoggerLogLevel.MINIMAL);
		session.add_feature (logger);

		var api_client = new Iv.ApiClient (session);

		var repository = new VideosRepository (api_client);

		repository.get_trending.begin ((obj, res) => {
			var videos = repository.get_trending.end (res);

			foreach (var video in videos) {
				trending_list.append (video);
			}
		});
	}
}

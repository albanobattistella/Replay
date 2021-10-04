/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Rpy.VideosRepository : Object {
	public VideosRepository (Iv.ApiClient api_client = new Iv.ApiClient ()) {
		Object (
			api_client: api_client
		);
	}

	public Iv.ApiClient api_client { private get; construct; }

	public async Gee.List<Video> get_trending () {
		var iv_videos = yield this.api_client.videos.get_trending ();

		var result = new Gee.ArrayList<Video> ();
		foreach (var video in iv_videos) {
			result.add (new Video () {
				title = video.title,
				channel_title = video.author
			});
		}

		return result;
	}
}

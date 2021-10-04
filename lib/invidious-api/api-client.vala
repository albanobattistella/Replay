/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Iv.ApiClient : Object {
	public ApiClient (Soup.Session session = new Soup.Session ()) {
		Object (
			session: session
		);
	}

	construct {
		this.videos = new Videos (this);
	}

	// TODO: Due to the nature of invidious, we must implement a mechanism to
	//       query api.invidious.io for a url of a healthy instance with support
	//       for queries to its API, rather than hardcoding one.
	internal const string BASE_URL = "invidious.snopyta.org";

	public Soup.Session session { internal get; construct; }
	public Videos videos { get; private set; }
}

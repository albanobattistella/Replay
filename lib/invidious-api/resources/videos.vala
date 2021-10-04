/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Iv.Videos : Object {
	public Videos (ApiClient api_client) {
		Object (
			api_client: api_client
		);
	}

	public ApiClient api_client { private get; construct; }

	private string base_url {
		get { return ApiClient.BASE_URL; }
	}

	private Soup.Session session {
		get { return api_client.session; }
	}

	private async Json.Node fetch_data (
		string method,
		string path
	) throws ApiError {
		var uri = "https://" + this.base_url + path;
		var message = new Soup.Message (method, uri);

		var response = yield this.session.send_and_read_async (
			message,
			Priority.DEFAULT,
			null
		);

		if (message.status_code < 200 || message.status_code > 299) {
			throw new ApiError.UNSUCCESSFUL_STATUS_CODE_RESPONSE (
				"The server responded with status code %u",
				message.status_code
			);
		}

		Json.Node json = null;

		try {
			json = Json.from_string ((string) response.get_data ());
		} catch (Error e) {
			throw new ApiError.FAILED_TO_PARSE_RESPONSE (
				"A failure occurred while parsing the response: %s",
				e.message
			);
		}

		if (json == null) {
			throw new ApiError.EMPTY_RESPONSE ("The server sent an empty response");
		}

		return json;
	}

	public async Gee.List<Video> get_trending () throws ApiError {
		var json = yield fetch_data ("GET", "/api/v1/trending");

		var json_array = json.get_array ();
		var result = new Gee.ArrayList<Video> ();

		json_array.foreach_element ((_, __, element_node) => {
			result.add (Video.from_json (element_node));
		});

		return result;
	}
}

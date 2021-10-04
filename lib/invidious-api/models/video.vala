/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Iv.Video : CamelCase, Json.Serializable {
	public string title { get; set; }
	public string video_id { get; set; }
	public Gee.List<Thumbnail> video_thumbnails { get; set; }

	public int32 length_seconds { get; set; }
	public int64 view_count { get; set; }

	public string author { get; set; }
	public string author_id { get; set; }
	public string author_url { get; set; }

	public int64 published { get; set; }
	public string published_text { get; set; }
	public string description { get; set; }
	public string description_html { get; set; }

	public bool live_now { get; set; }
	public bool paid { get; set; }
	public bool premium { get; set; }

	public static Video from_json (Json.Node node)
		requires (node.get_node_type () == Json.NodeType.OBJECT)
	{
		return (Video) Json.gobject_deserialize (typeof (Video), node);
	}

	private bool deserialize_property (
		string property_name,
		out Value @value,
		ParamSpec pspec,
		Json.Node property_node
	) {
		if (property_name != "video-thumbnails") {
			return default_deserialize_property (
				property_name,
				out @value,
				pspec,
				property_node
			);
		}

		var json_array = property_node.get_array ();
		var result = new Gee.ArrayList<Thumbnail> ();

		json_array.foreach_element ((_, __, element_node) => {
			result.add (Thumbnail.from_json (element_node));
		});

		@value = result;

		return true;
	}
}

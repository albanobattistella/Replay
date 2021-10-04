/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Iv.Thumbnail : Object {
	public string quality { get; set; }
	public string url { get; set; }
	public int32 width { get; set; }
	public int32 height { get; set; }

	public static Thumbnail from_json (Json.Node node)
		requires (node.get_node_type () == Json.NodeType.OBJECT)
	{
		return (Thumbnail) Json.gobject_deserialize (typeof (Thumbnail), node);
	}
}

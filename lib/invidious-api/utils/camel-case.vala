/*
 * Copyright 2021 Nahuel Gomez Castro <contact@nahuelgomez.com.ar>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Iv.CamelCase : Object, Json.Serializable {
	private Regex regex = /(?<=[a-z])(?=[A-Z])/;
	private ObjectClass klass;

	construct {
		this.klass = (ObjectClass) this.get_type ().class_ref ();
	}

	protected virtual unowned ParamSpec? find_property (string name) {
		try {
			var new_name = this.regex.replace (name, name.length, 0, "-");
			new_name = new_name.down ();

			return klass.find_property (new_name);
		} catch (RegexError e) {
			warning (
				"An error occurred when converting the property name from " +
				"camelCase to kebab-case. It will be proceeded to use the " +
				"property name without conversions."
			);

			return klass.find_property (name);
		}
	}
}

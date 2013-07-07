package com.admo.datamodel.content;

import com.admo.datamodel.Advertisement;

public class AdContent {
	private Advertisement advertisement;

	/**
	 * In case of TextContent it will be main content of Ad, in other cases it
	 * will be meta text of message.
	 */
	private String text;
}

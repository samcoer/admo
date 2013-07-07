package com.admo.datamodel.profiles;

import java.util.List;

public class EducationProfile extends Profile{
	private enum EDUCATION{
		MATRIC, GRADUATE, POST_GRADUATE
	}
	private List<EDUCATION> educationList;
}

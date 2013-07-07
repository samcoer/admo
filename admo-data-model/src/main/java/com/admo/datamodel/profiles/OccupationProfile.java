package com.admo.datamodel.profiles;

import java.util.List;

public class OccupationProfile extends Profile {
	// TODO enum for now but it may be too restrictive and also require code
	// changes, might remove later
	private enum Occupation {
		DOCTOR, ENGINEER
	}

	private List<Occupation> occupations;
}

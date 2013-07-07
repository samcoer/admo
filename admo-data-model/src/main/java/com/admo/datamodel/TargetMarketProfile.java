package com.admo.datamodel;

import java.util.List;

import com.admo.datamodel.profiles.Profile;

/**
 * An {@link Advertisement} will have a target market profile which will consist of a
 * list of profiles (defined at the time of creating {@link Advertisement}) based on which {@link TargetMarket} will be selected.
 * 
 * @author bhatt
 * 
 */
public class TargetMarketProfile {
	private String segmentName;
	private Advertisement advertisement;
	private List<Profile> profiles;
}

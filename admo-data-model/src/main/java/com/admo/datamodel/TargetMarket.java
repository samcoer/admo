package com.admo.datamodel;

import java.util.List;

import com.admo.datamodel.profiles.Profile;

/**
 * An algorithm maps {@link EndUser}s for an advertisement. An
 * {@link Advertisement} defines a list of {@link Profile}s. Algorithm matches
 * user profiles with {@link TargetMarketProfile} mentioned in
 * {@link Advertisement} and all {@link EndUser}s matching a certain percentage
 * of {@link Profile}s are added to targets in {@link TargetMarket}.
 * 
 * @author bhatt
 * 
 */
public class TargetMarket {
	private Advertisement advertisement;
	private List<EndUser> targets;
}

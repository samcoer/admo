// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.Tag;
import com.advmon.webapp.datamodel.profiles.TagProfile;
import java.util.List;

privileged aspect TagProfile_Roo_JavaBean {
    
    public List<Tag> TagProfile.getTags() {
        return this.tags;
    }
    
    public void TagProfile.setTags(List<Tag> tags) {
        this.tags = tags;
    }
    
}

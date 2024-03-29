// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.IntRangeProfile;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect IntRangeProfile_Roo_Jpa_ActiveRecord {
    
    public static long IntRangeProfile.countIntRangeProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM IntRangeProfile o", Long.class).getSingleResult();
    }
    
    public static List<IntRangeProfile> IntRangeProfile.findAllIntRangeProfiles() {
        return entityManager().createQuery("SELECT o FROM IntRangeProfile o", IntRangeProfile.class).getResultList();
    }
    
    public static IntRangeProfile IntRangeProfile.findIntRangeProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(IntRangeProfile.class, id);
    }
    
    public static List<IntRangeProfile> IntRangeProfile.findIntRangeProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM IntRangeProfile o", IntRangeProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public IntRangeProfile IntRangeProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        IntRangeProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

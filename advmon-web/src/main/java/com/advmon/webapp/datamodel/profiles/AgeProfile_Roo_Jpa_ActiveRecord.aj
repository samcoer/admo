// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.AgeProfile;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AgeProfile_Roo_Jpa_ActiveRecord {
    
    public static long AgeProfile.countAgeProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AgeProfile o", Long.class).getSingleResult();
    }
    
    public static List<AgeProfile> AgeProfile.findAllAgeProfiles() {
        return entityManager().createQuery("SELECT o FROM AgeProfile o", AgeProfile.class).getResultList();
    }
    
    public static AgeProfile AgeProfile.findAgeProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(AgeProfile.class, id);
    }
    
    public static List<AgeProfile> AgeProfile.findAgeProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AgeProfile o", AgeProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public AgeProfile AgeProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AgeProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
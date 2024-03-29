// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.InterestProfile;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InterestProfile_Roo_Jpa_ActiveRecord {
    
    public static long InterestProfile.countInterestProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM InterestProfile o", Long.class).getSingleResult();
    }
    
    public static List<InterestProfile> InterestProfile.findAllInterestProfiles() {
        return entityManager().createQuery("SELECT o FROM InterestProfile o", InterestProfile.class).getResultList();
    }
    
    public static InterestProfile InterestProfile.findInterestProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(InterestProfile.class, id);
    }
    
    public static List<InterestProfile> InterestProfile.findInterestProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM InterestProfile o", InterestProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public InterestProfile InterestProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InterestProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

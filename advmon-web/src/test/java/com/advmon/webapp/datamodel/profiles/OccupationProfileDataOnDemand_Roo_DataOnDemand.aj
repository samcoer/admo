// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.OccupationProfile;
import com.advmon.webapp.datamodel.profiles.OccupationProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect OccupationProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OccupationProfileDataOnDemand: @Component;
    
    private Random OccupationProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<OccupationProfile> OccupationProfileDataOnDemand.data;
    
    public OccupationProfile OccupationProfileDataOnDemand.getNewTransientOccupationProfile(int index) {
        OccupationProfile obj = new OccupationProfile();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void OccupationProfileDataOnDemand.setDescription(OccupationProfile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void OccupationProfileDataOnDemand.setName(OccupationProfile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public OccupationProfile OccupationProfileDataOnDemand.getSpecificOccupationProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OccupationProfile obj = data.get(index);
        Long id = obj.getId();
        return OccupationProfile.findOccupationProfile(id);
    }
    
    public OccupationProfile OccupationProfileDataOnDemand.getRandomOccupationProfile() {
        init();
        OccupationProfile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return OccupationProfile.findOccupationProfile(id);
    }
    
    public boolean OccupationProfileDataOnDemand.modifyOccupationProfile(OccupationProfile obj) {
        return false;
    }
    
    public void OccupationProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = OccupationProfile.findOccupationProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OccupationProfile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OccupationProfile>();
        for (int i = 0; i < 10; i++) {
            OccupationProfile obj = getNewTransientOccupationProfile(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
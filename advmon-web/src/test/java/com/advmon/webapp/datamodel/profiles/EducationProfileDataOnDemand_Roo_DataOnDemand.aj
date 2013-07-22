// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.EducationProfile;
import com.advmon.webapp.datamodel.profiles.EducationProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect EducationProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EducationProfileDataOnDemand: @Component;
    
    private Random EducationProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<EducationProfile> EducationProfileDataOnDemand.data;
    
    public EducationProfile EducationProfileDataOnDemand.getNewTransientEducationProfile(int index) {
        EducationProfile obj = new EducationProfile();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void EducationProfileDataOnDemand.setDescription(EducationProfile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void EducationProfileDataOnDemand.setName(EducationProfile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public EducationProfile EducationProfileDataOnDemand.getSpecificEducationProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        EducationProfile obj = data.get(index);
        Long id = obj.getId();
        return EducationProfile.findEducationProfile(id);
    }
    
    public EducationProfile EducationProfileDataOnDemand.getRandomEducationProfile() {
        init();
        EducationProfile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return EducationProfile.findEducationProfile(id);
    }
    
    public boolean EducationProfileDataOnDemand.modifyEducationProfile(EducationProfile obj) {
        return false;
    }
    
    public void EducationProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = EducationProfile.findEducationProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'EducationProfile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<EducationProfile>();
        for (int i = 0; i < 10; i++) {
            EducationProfile obj = getNewTransientEducationProfile(i);
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
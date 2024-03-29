// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.Profile;
import com.advmon.webapp.datamodel.profiles.ProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProfileDataOnDemand: @Component;
    
    private Random ProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<Profile> ProfileDataOnDemand.data;
    
    public Profile ProfileDataOnDemand.getNewTransientProfile(int index) {
        Profile obj = new Profile();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void ProfileDataOnDemand.setDescription(Profile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void ProfileDataOnDemand.setName(Profile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Profile ProfileDataOnDemand.getSpecificProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Profile obj = data.get(index);
        Long id = obj.getId();
        return Profile.findProfile(id);
    }
    
    public Profile ProfileDataOnDemand.getRandomProfile() {
        init();
        Profile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Profile.findProfile(id);
    }
    
    public boolean ProfileDataOnDemand.modifyProfile(Profile obj) {
        return false;
    }
    
    public void ProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Profile.findProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Profile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Profile>();
        for (int i = 0; i < 10; i++) {
            Profile obj = getNewTransientProfile(i);
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

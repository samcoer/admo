// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.GenderProfile;
import com.advmon.webapp.datamodel.profiles.GenderProfile.Gender;
import com.advmon.webapp.datamodel.profiles.GenderProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect GenderProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: GenderProfileDataOnDemand: @Component;
    
    private Random GenderProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<GenderProfile> GenderProfileDataOnDemand.data;
    
    public GenderProfile GenderProfileDataOnDemand.getNewTransientGenderProfile(int index) {
        GenderProfile obj = new GenderProfile();
        setDescription(obj, index);
        setGender(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void GenderProfileDataOnDemand.setDescription(GenderProfile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void GenderProfileDataOnDemand.setGender(GenderProfile obj, int index) {
        Gender gender = Gender.class.getEnumConstants()[0];
        obj.setGender(gender);
    }
    
    public void GenderProfileDataOnDemand.setName(GenderProfile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public GenderProfile GenderProfileDataOnDemand.getSpecificGenderProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        GenderProfile obj = data.get(index);
        Long id = obj.getId();
        return GenderProfile.findGenderProfile(id);
    }
    
    public GenderProfile GenderProfileDataOnDemand.getRandomGenderProfile() {
        init();
        GenderProfile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return GenderProfile.findGenderProfile(id);
    }
    
    public boolean GenderProfileDataOnDemand.modifyGenderProfile(GenderProfile obj) {
        return false;
    }
    
    public void GenderProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = GenderProfile.findGenderProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'GenderProfile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<GenderProfile>();
        for (int i = 0; i < 10; i++) {
            GenderProfile obj = getNewTransientGenderProfile(i);
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

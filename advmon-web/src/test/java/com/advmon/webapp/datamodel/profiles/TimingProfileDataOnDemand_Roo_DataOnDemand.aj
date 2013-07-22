// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.TimingProfile;
import com.advmon.webapp.datamodel.profiles.TimingProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect TimingProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TimingProfileDataOnDemand: @Component;
    
    private Random TimingProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<TimingProfile> TimingProfileDataOnDemand.data;
    
    public TimingProfile TimingProfileDataOnDemand.getNewTransientTimingProfile(int index) {
        TimingProfile obj = new TimingProfile();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void TimingProfileDataOnDemand.setDescription(TimingProfile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void TimingProfileDataOnDemand.setName(TimingProfile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public TimingProfile TimingProfileDataOnDemand.getSpecificTimingProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TimingProfile obj = data.get(index);
        Long id = obj.getId();
        return TimingProfile.findTimingProfile(id);
    }
    
    public TimingProfile TimingProfileDataOnDemand.getRandomTimingProfile() {
        init();
        TimingProfile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return TimingProfile.findTimingProfile(id);
    }
    
    public boolean TimingProfileDataOnDemand.modifyTimingProfile(TimingProfile obj) {
        return false;
    }
    
    public void TimingProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TimingProfile.findTimingProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TimingProfile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TimingProfile>();
        for (int i = 0; i < 10; i++) {
            TimingProfile obj = getNewTransientTimingProfile(i);
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
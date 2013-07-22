// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.EndUser;
import com.advmon.webapp.datamodel.EndUserDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect EndUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EndUserDataOnDemand: @Component;
    
    private Random EndUserDataOnDemand.rnd = new SecureRandom();
    
    private List<EndUser> EndUserDataOnDemand.data;
    
    public EndUser EndUserDataOnDemand.getNewTransientEndUser(int index) {
        EndUser obj = new EndUser();
        setEmailId(obj, index);
        setName(obj, index);
        setPassword(obj, index);
        setPaymentMultiplier(obj, index);
        return obj;
    }
    
    public void EndUserDataOnDemand.setEmailId(EndUser obj, int index) {
        String emailId = "foo" + index + "@bar.com";
        obj.setEmailId(emailId);
    }
    
    public void EndUserDataOnDemand.setName(EndUser obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void EndUserDataOnDemand.setPassword(EndUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void EndUserDataOnDemand.setPaymentMultiplier(EndUser obj, int index) {
        Float paymentMultiplier = new Integer(index).floatValue();
        obj.setPaymentMultiplier(paymentMultiplier);
    }
    
    public EndUser EndUserDataOnDemand.getSpecificEndUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        EndUser obj = data.get(index);
        Long id = obj.getId();
        return EndUser.findEndUser(id);
    }
    
    public EndUser EndUserDataOnDemand.getRandomEndUser() {
        init();
        EndUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return EndUser.findEndUser(id);
    }
    
    public boolean EndUserDataOnDemand.modifyEndUser(EndUser obj) {
        return false;
    }
    
    public void EndUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = EndUser.findEndUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'EndUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<EndUser>();
        for (int i = 0; i < 10; i++) {
            EndUser obj = getNewTransientEndUser(i);
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
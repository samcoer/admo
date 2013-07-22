// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.AdvertisementDataOnDemand;
import com.advmon.webapp.datamodel.PaymentInfo;
import com.advmon.webapp.datamodel.PaymentInfoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PaymentInfoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PaymentInfoDataOnDemand: @Component;
    
    private Random PaymentInfoDataOnDemand.rnd = new SecureRandom();
    
    private List<PaymentInfo> PaymentInfoDataOnDemand.data;
    
    @Autowired
    AdvertisementDataOnDemand PaymentInfoDataOnDemand.advertisementDataOnDemand;
    
    public PaymentInfo PaymentInfoDataOnDemand.getNewTransientPaymentInfo(int index) {
        PaymentInfo obj = new PaymentInfo();
        setBudget(obj, index);
        setIsDifferential(obj, index);
        setPpi(obj, index);
        return obj;
    }
    
    public void PaymentInfoDataOnDemand.setBudget(PaymentInfo obj, int index) {
        Double budget = new Integer(index).doubleValue();
        obj.setBudget(budget);
    }
    
    public void PaymentInfoDataOnDemand.setIsDifferential(PaymentInfo obj, int index) {
        Boolean isDifferential = Boolean.TRUE;
        obj.setIsDifferential(isDifferential);
    }
    
    public void PaymentInfoDataOnDemand.setPpi(PaymentInfo obj, int index) {
        Double ppi = new Integer(index).doubleValue();
        obj.setPpi(ppi);
    }
    
    public PaymentInfo PaymentInfoDataOnDemand.getSpecificPaymentInfo(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PaymentInfo obj = data.get(index);
        Long id = obj.getId();
        return PaymentInfo.findPaymentInfo(id);
    }
    
    public PaymentInfo PaymentInfoDataOnDemand.getRandomPaymentInfo() {
        init();
        PaymentInfo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return PaymentInfo.findPaymentInfo(id);
    }
    
    public boolean PaymentInfoDataOnDemand.modifyPaymentInfo(PaymentInfo obj) {
        return false;
    }
    
    public void PaymentInfoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = PaymentInfo.findPaymentInfoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PaymentInfo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PaymentInfo>();
        for (int i = 0; i < 10; i++) {
            PaymentInfo obj = getNewTransientPaymentInfo(i);
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

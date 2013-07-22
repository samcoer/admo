// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.IncomeProfile;
import com.advmon.webapp.datamodel.profiles.IncomeProfileDataOnDemand;
import com.advmon.webapp.datamodel.profiles.IncomeProfileIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect IncomeProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: IncomeProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: IncomeProfileIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: IncomeProfileIntegrationTest: @Transactional;
    
    @Autowired
    IncomeProfileDataOnDemand IncomeProfileIntegrationTest.dod;
    
    @Test
    public void IncomeProfileIntegrationTest.testCountIncomeProfiles() {
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", dod.getRandomIncomeProfile());
        long count = IncomeProfile.countIncomeProfiles();
        Assert.assertTrue("Counter for 'IncomeProfile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testFindIncomeProfile() {
        IncomeProfile obj = dod.getRandomIncomeProfile();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to provide an identifier", id);
        obj = IncomeProfile.findIncomeProfile(id);
        Assert.assertNotNull("Find method for 'IncomeProfile' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'IncomeProfile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testFindAllIncomeProfiles() {
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", dod.getRandomIncomeProfile());
        long count = IncomeProfile.countIncomeProfiles();
        Assert.assertTrue("Too expensive to perform a find all test for 'IncomeProfile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<IncomeProfile> result = IncomeProfile.findAllIncomeProfiles();
        Assert.assertNotNull("Find all method for 'IncomeProfile' illegally returned null", result);
        Assert.assertTrue("Find all method for 'IncomeProfile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testFindIncomeProfileEntries() {
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", dod.getRandomIncomeProfile());
        long count = IncomeProfile.countIncomeProfiles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<IncomeProfile> result = IncomeProfile.findIncomeProfileEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'IncomeProfile' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'IncomeProfile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testFlush() {
        IncomeProfile obj = dod.getRandomIncomeProfile();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to provide an identifier", id);
        obj = IncomeProfile.findIncomeProfile(id);
        Assert.assertNotNull("Find method for 'IncomeProfile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIncomeProfile(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'IncomeProfile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testMergeUpdate() {
        IncomeProfile obj = dod.getRandomIncomeProfile();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to provide an identifier", id);
        obj = IncomeProfile.findIncomeProfile(id);
        boolean modified =  dod.modifyIncomeProfile(obj);
        Integer currentVersion = obj.getVersion();
        IncomeProfile merged = (IncomeProfile)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'IncomeProfile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", dod.getRandomIncomeProfile());
        IncomeProfile obj = dod.getNewTransientIncomeProfile(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'IncomeProfile' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'IncomeProfile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void IncomeProfileIntegrationTest.testRemove() {
        IncomeProfile obj = dod.getRandomIncomeProfile();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IncomeProfile' failed to provide an identifier", id);
        obj = IncomeProfile.findIncomeProfile(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'IncomeProfile' with identifier '" + id + "'", IncomeProfile.findIncomeProfile(id));
    }
    
}
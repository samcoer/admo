// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.OccupationProfile;
import com.advmon.webapp.datamodel.profiles.OccupationProfileDataOnDemand;
import com.advmon.webapp.datamodel.profiles.OccupationProfileIntegrationTest;
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

privileged aspect OccupationProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OccupationProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OccupationProfileIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OccupationProfileIntegrationTest: @Transactional;
    
    @Autowired
    OccupationProfileDataOnDemand OccupationProfileIntegrationTest.dod;
    
    @Test
    public void OccupationProfileIntegrationTest.testCountOccupationProfiles() {
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", dod.getRandomOccupationProfile());
        long count = OccupationProfile.countOccupationProfiles();
        Assert.assertTrue("Counter for 'OccupationProfile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testFindOccupationProfile() {
        OccupationProfile obj = dod.getRandomOccupationProfile();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to provide an identifier", id);
        obj = OccupationProfile.findOccupationProfile(id);
        Assert.assertNotNull("Find method for 'OccupationProfile' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'OccupationProfile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testFindAllOccupationProfiles() {
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", dod.getRandomOccupationProfile());
        long count = OccupationProfile.countOccupationProfiles();
        Assert.assertTrue("Too expensive to perform a find all test for 'OccupationProfile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<OccupationProfile> result = OccupationProfile.findAllOccupationProfiles();
        Assert.assertNotNull("Find all method for 'OccupationProfile' illegally returned null", result);
        Assert.assertTrue("Find all method for 'OccupationProfile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testFindOccupationProfileEntries() {
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", dod.getRandomOccupationProfile());
        long count = OccupationProfile.countOccupationProfiles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<OccupationProfile> result = OccupationProfile.findOccupationProfileEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'OccupationProfile' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'OccupationProfile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testFlush() {
        OccupationProfile obj = dod.getRandomOccupationProfile();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to provide an identifier", id);
        obj = OccupationProfile.findOccupationProfile(id);
        Assert.assertNotNull("Find method for 'OccupationProfile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOccupationProfile(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'OccupationProfile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testMergeUpdate() {
        OccupationProfile obj = dod.getRandomOccupationProfile();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to provide an identifier", id);
        obj = OccupationProfile.findOccupationProfile(id);
        boolean modified =  dod.modifyOccupationProfile(obj);
        Integer currentVersion = obj.getVersion();
        OccupationProfile merged = (OccupationProfile)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'OccupationProfile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", dod.getRandomOccupationProfile());
        OccupationProfile obj = dod.getNewTransientOccupationProfile(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'OccupationProfile' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'OccupationProfile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OccupationProfileIntegrationTest.testRemove() {
        OccupationProfile obj = dod.getRandomOccupationProfile();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OccupationProfile' failed to provide an identifier", id);
        obj = OccupationProfile.findOccupationProfile(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'OccupationProfile' with identifier '" + id + "'", OccupationProfile.findOccupationProfile(id));
    }
    
}
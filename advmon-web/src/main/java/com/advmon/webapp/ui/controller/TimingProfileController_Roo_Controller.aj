// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.ui.controller;

import com.advmon.webapp.datamodel.EndUser;
import com.advmon.webapp.datamodel.MarketProfileHistory;
import com.advmon.webapp.datamodel.TargetMarketProfile;
import com.advmon.webapp.datamodel.etc.LongRange;
import com.advmon.webapp.datamodel.profiles.TimingProfile;
import com.advmon.webapp.ui.controller.TimingProfileController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TimingProfileController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TimingProfileController.create(@Valid TimingProfile timingProfile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, timingProfile);
            return "timingprofiles/create";
        }
        uiModel.asMap().clear();
        timingProfile.persist();
        return "redirect:/timingprofiles/" + encodeUrlPathSegment(timingProfile.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TimingProfileController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TimingProfile());
        return "timingprofiles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TimingProfileController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("timingprofile", TimingProfile.findTimingProfile(id));
        uiModel.addAttribute("itemId", id);
        return "timingprofiles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TimingProfileController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("timingprofiles", TimingProfile.findTimingProfileEntries(firstResult, sizeNo));
            float nrOfPages = (float) TimingProfile.countTimingProfiles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("timingprofiles", TimingProfile.findAllTimingProfiles());
        }
        return "timingprofiles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TimingProfileController.update(@Valid TimingProfile timingProfile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, timingProfile);
            return "timingprofiles/update";
        }
        uiModel.asMap().clear();
        timingProfile.merge();
        return "redirect:/timingprofiles/" + encodeUrlPathSegment(timingProfile.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TimingProfileController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TimingProfile.findTimingProfile(id));
        return "timingprofiles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TimingProfileController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TimingProfile timingProfile = TimingProfile.findTimingProfile(id);
        timingProfile.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/timingprofiles";
    }
    
    void TimingProfileController.populateEditForm(Model uiModel, TimingProfile timingProfile) {
        uiModel.addAttribute("timingProfile", timingProfile);
        uiModel.addAttribute("endusers", EndUser.findAllEndUsers());
        uiModel.addAttribute("marketprofilehistorys", MarketProfileHistory.findAllMarketProfileHistorys());
        uiModel.addAttribute("targetmarketprofiles", TargetMarketProfile.findAllTargetMarketProfiles());
        uiModel.addAttribute("longranges", LongRange.findAllLongRanges());
    }
    
    String TimingProfileController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
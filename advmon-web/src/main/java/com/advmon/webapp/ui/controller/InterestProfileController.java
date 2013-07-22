package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.profiles.InterestProfile;

@RequestMapping("/interestprofiles")
@Controller
@RooWebScaffold(path = "interestprofiles", formBackingObject = InterestProfile.class)
public class InterestProfileController {
}

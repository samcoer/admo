package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.profiles.OccupationProfile;

@RequestMapping("/occupationprofiles")
@Controller
@RooWebScaffold(path = "occupationprofiles", formBackingObject = OccupationProfile.class)
public class OccupationProfileController {
}

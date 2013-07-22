package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.profiles.LocationProfile;

@RequestMapping("/locationprofiles")
@Controller
@RooWebScaffold(path = "locationprofiles", formBackingObject = LocationProfile.class)
public class LocationProfileController {
}

package com.advmon.webapp.ui.controller;
import com.advmon.webapp.datamodel.profiles.LongRangeProfile;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/longrangeprofiles")
@Controller
@RooWebScaffold(path = "longrangeprofiles", formBackingObject = LongRangeProfile.class)
public class LongRangeProfileController {
}

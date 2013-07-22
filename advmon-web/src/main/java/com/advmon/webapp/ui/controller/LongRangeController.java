package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.etc.LongRange;

@RequestMapping("/longranges")
@Controller
@RooWebScaffold(path = "longranges", formBackingObject = LongRange.class)
public class LongRangeController {
}

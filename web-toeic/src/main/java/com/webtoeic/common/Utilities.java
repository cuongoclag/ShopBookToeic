package com.webtoeic.common;
import com.github.slugify.Slugify;

import javax.servlet.http.HttpServletRequest;

public class Utilities {
    public static String createSeoLink(final String text) {
        Slugify slg = new Slugify();
        String result = slg.slugify(text + "-" + System.currentTimeMillis());
        return result;
    }
    public static String createSeoLinkCategory(final String text) {
        Slugify slg = new Slugify();
        String result = slg.slugify(text);
        return result;
    }

    public static String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}

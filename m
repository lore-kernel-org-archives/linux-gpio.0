From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 11:18:26 -0400
Message-ID: <CACPiFC+Sv842XdZcWYca+wKZZTU02RJdUcUsXsXWDhg_DGzFxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34901 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbcCVPSq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 11:18:46 -0400
Received: by mail-ob0-f173.google.com with SMTP id fp4so203729196obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 08:18:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

[resend w/o html, apologies]

Hi pinctrl_cherryview maintainers.

I unsuspectingly bought a laptop for a family member which hits
trouble with pinctrl_cherryview; it only boots with the module
blacklisted or acpi=off .

System is (trying) to run Fedora 23 -- made more difficult by recent
Fedora kernels having the module built-in.

Are there any useful debugging steps I can follow to narrow this down?
Already tried the acpi diagnostics steps (acpi=ht, etc) to no avail.

thank you!



m
-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff

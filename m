From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: "gpio: Move irqdomain into struct gpio_irq_chip" breaks gpio-reg.c
Date: Mon, 4 Dec 2017 10:22:54 +0000
Message-ID: <20171204102254.GS10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35664 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbdLDKXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Dec 2017 05:23:07 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Patch f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
breaks the build for gpio-reg.c:

drivers/gpio/gpio-reg.c: In function 'gpio_reg_to_irq':
drivers/gpio/gpio-reg.c:106:19: error: 'struct gpio_reg' has no member named 'irq'
drivers/gpio/gpio-reg.c:107:27: error: 'struct gpio_reg' has no member named 'irq'

It's obvious when you look at the patch, which only did this:

-       if (irq >= 0 && r->irqdomain)
-               irq = irq_find_mapping(r->irqdomain, irq);
+       if (irq >= 0 && r->irq.domain)
+               irq = irq_find_mapping(r->irq.domain, irq);

and made no other changes to this file.  Please revert the change to
this file, or fix it.  Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up

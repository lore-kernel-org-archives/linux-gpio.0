From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
 distinctions
Date: Tue, 23 May 2017 20:12:30 -0400
Message-ID: <20170524001230.GJ11504@windriver.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com>
 <804d9519-5e1b-d9b1-4591-010dcafa2ff1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:42038 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933457AbdEXANO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 May 2017 20:13:14 -0400
Content-Disposition: inline
In-Reply-To: <804d9519-5e1b-d9b1-4591-010dcafa2ff1@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org

[Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular distinctions] On 23/05/2017 (Tue 15:15) Scott Branden wrote:

> Hi Paul,
> 
> Some comments - leave our file headers intact.  If you want to add a new
> comment do so after the existing file header in another comment.  But, I
> don't think any of that information is needed by us.

OK, no problem, if that is what is desired for your driver.  I just
normally move the author information from the bottom of the file to the
top of the file.  As a lot of the linux driver work was (is?) done for
kudos and not for career, I can't just delete author information.  That
would not be fair to most of those contributors.

It hasn't been a problem before in all of the other similar commits I've
made, but I can imagine a tool that does a check on the comment block on
the top of a file and complains if it changes, or similar.

Would you prefer something like this instead?  It leaves your header
completely untouched, and still gives credit to the original author,
and those lines are also untouched.

I've not re-done build coverage on this yet, but let me know if this is
what you'd prefer.

Thanks,
Paul
--

 From 3f8bf38bcdbf38484182222965aac2748cc1d5cd Mon Sep 17 00:00:00 2001
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Mon, 31 Aug 2015 17:35:47 -0400
Subject: [PATCH] pinctrl: bcm: clean up modular vs. non-modular distinctions

Fixups here tend to be more of a conglomerate of some of the other
repeated/systematic ones we've seen in the earlier pinctrl cleanups.

We remove module.h from code that isn't doing anything modular at
all;  if they have __init sections, then replace it with init.h

One driver has a .remove that would be dispatched on module_exit,
and as that code is essentially orphaned, so we remove it.  In case
anyone was previously doing the (pointless) unbind to get to that
function, we disable unbind for this one driver as well.

A couple bool drivers (hence non-modular) are converted over to
to builtin_platform_driver().

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We leave the MODULE_AUTHOR and MODULE_LICENSE tag etc. at the bottom
of the file since Broadcom would prefer the comment block at the top
of the file remain unchanged.  We just use CPP to take it out of the
picture with an #if 0 / #endif instead.

Cc: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Jon Mason <jonmason@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Sherman Yin <syin@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-gpio@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c   |  7 ++++---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c    | 18 +++++-------------
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c |  3 ++-
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 810a81786f62..cc01acc988d0 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -12,7 +12,7 @@
  */
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1444,10 +1444,11 @@ static struct platform_driver bcm281xx_pinctrl_driver = {
 		.of_match_table = bcm281xx_pinctrl_of_match,
 	},
 };
+builtin_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
 
-module_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
-
+#if 0 /* ...def MODULE ; never supported as such; kept for documentation. */
 MODULE_AUTHOR("Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>");
 MODULE_AUTHOR("Sherman Yin <syin@broadcom.com>");
 MODULE_DESCRIPTION("Broadcom BCM281xx pinctrl driver");
 MODULE_LICENSE("GPL v2");
+#endif
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 85d009112864..3924ff17e955 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -27,7 +27,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -1075,31 +1075,23 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bcm2835_pinctrl_remove(struct platform_device *pdev)
-{
-	struct bcm2835_pinctrl *pc = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pc->gpio_chip);
-
-	return 0;
-}
-
 static const struct of_device_id bcm2835_pinctrl_match[] = {
 	{ .compatible = "brcm,bcm2835-gpio" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, bcm2835_pinctrl_match);
 
 static struct platform_driver bcm2835_pinctrl_driver = {
 	.probe = bcm2835_pinctrl_probe,
-	.remove = bcm2835_pinctrl_remove,
 	.driver = {
 		.name = MODULE_NAME,
 		.of_match_table = bcm2835_pinctrl_match,
+		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver(bcm2835_pinctrl_driver);
+builtin_platform_driver(bcm2835_pinctrl_driver);
 
+#if 0 /* ...def MODULE ; never supported as such; kept for documentation. */
 MODULE_AUTHOR("Chris Boot, Simon Arlott, Stephen Warren");
 MODULE_DESCRIPTION("BCM2835 Pin control driver");
 MODULE_LICENSE("GPL");
+#endif
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index d31c95701a92..84c2a182a5b7 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -17,7 +17,6 @@
 
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1017,6 +1016,8 @@ static int __init cygnus_pinmux_init(void)
 }
 arch_initcall(cygnus_pinmux_init);
 
+#if 0 /* ...def MODULE ; never supported as such; kept for documentation. */
 MODULE_AUTHOR("Ray Jui <rjui@broadcom.com>");
 MODULE_DESCRIPTION("Broadcom Cygnus IOMUX driver");
 MODULE_LICENSE("GPL v2");
+#endif
-- 
2.11.0



From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/3] gpio: brcmstb: have driver register during subsys_initcall()
Date: Wed,  6 Jan 2016 10:55:21 -0800
Message-ID: <1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:34750 "EHLO
	mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752213AbcAFS4M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2016 13:56:12 -0500
Received: by mail-pf0-f171.google.com with SMTP id e65so190261640pfe.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2016 10:56:12 -0800 (PST)
In-Reply-To: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-mips@linux-mips.org, gregory.0xf0@gmail.com, jaedon.shin@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, bcm-kernel-feedback-list@broadcom.com, Jim Quinlan <jim2101024@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>

From: Jim Quinlan <jim2101024@gmail.com>

Because regulators are started with subsys_initcall(), and gpio references may
be contained in the regulators, it makes sense to start the brcmstb-gpio's with
a subsys_initcall(). The order within the drivers/Makefile ensures that the
gpio initialization happens prior to the regulator's initialization.

We need to unroll module_platform_driver() now to allow this and have custom
exit and init module functions to control the initialization level.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index dc3f0395693b..3618b9fd0cba 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -535,7 +535,18 @@ static struct platform_driver brcmstb_gpio_driver = {
 	.probe = brcmstb_gpio_probe,
 	.remove = brcmstb_gpio_remove,
 };
-module_platform_driver(brcmstb_gpio_driver);
+
+static int __init brcmstb_gpio_init(void)
+{
+	return platform_driver_register(&brcmstb_gpio_driver);
+}
+subsys_initcall(brcmstb_gpio_init);
+
+static void __exit brcmstb_gpio_exit(void)
+{
+	platform_driver_unregister(&brcmstb_gpio_driver);
+}
+module_exit(brcmstb_gpio_exit);
 
 MODULE_AUTHOR("Gregory Fong");
 MODULE_DESCRIPTION("Driver for Broadcom BRCMSTB SoC UPG GPIO");
-- 
2.1.0


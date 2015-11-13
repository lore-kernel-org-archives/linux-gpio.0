From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] gpio: pxa: change initcall level second attempt
Date: Fri, 13 Nov 2015 21:22:38 +0100
Message-ID: <1447446158-20213-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:31558 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754225AbbKMUaU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2015 15:30:20 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

This patch is a second attempt at what was previously in commit
6c7e660a27da ("gpio: pxa: set initcall level to module init").

The goal is the same : enable gpio & pinctrl driver to work
together. As pinctrl driver will be initialized at device level, the
gpio should be as well, so that the deferring mechanism is honored.

Yet this patch should also respect the legacy platforms, so the set of
constraints is :
 - in legacy platforms (ie. non dt), gpio_[gs]et_*() should be available
   for machine code => core initcall
 - in new platforms (ie. dt based), pinctrl will be available and no
   machine code => device initcall

In order to fullfill all these constraints, the initcall level is either
postcore for non devicetree platforms, and device for devicetree platforms.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index df2ce550f309..bce99182578b 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -690,11 +690,23 @@ static struct platform_driver pxa_gpio_driver = {
 	.id_table	= gpio_id_table,
 };
 
-static int __init pxa_gpio_init(void)
+static int __init pxa_gpio_legacy_init(void)
 {
+	if (of_have_populated_dt())
+		return 0;
+
 	return platform_driver_register(&pxa_gpio_driver);
 }
-postcore_initcall(pxa_gpio_init);
+postcore_initcall(pxa_gpio_legacy_init);
+
+static int __init pxa_gpio_dt_init(void)
+{
+	if (of_have_populated_dt())
+		return platform_driver_register(&pxa_gpio_driver);
+
+	return 0;
+}
+device_initcall(pxa_gpio_dt_init);
 
 #ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
-- 
2.1.4


From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/9] drivers/gpio: make gpio-bcm-kona.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:41 -0400
Message-ID: <1459093489-18314-2-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:56722 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154AbcC0PpL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 11:45:11 -0400
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config GPIO_BCM_KONA
        bool "Broadcom Kona GPIO"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-bcm-kona.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 2fd38d598f3d..9aabc48ff5de 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -1,4 +1,7 @@
 /*
+ * Broadcom Kona GPIO Driver
+ *
+ * Author: Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>
  * Copyright (C) 2012-2014 Broadcom Corporation
  *
  * This program is free software; you can redistribute it and/or
@@ -17,7 +20,7 @@
 #include <linux/gpio.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 
@@ -502,8 +505,6 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{}
 };
 
-MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
-
 /*
  * This lock class tells lockdep that GPIO irqs are in a different
  * category than their parents, so it won't report false recursion.
@@ -659,9 +660,4 @@ static struct platform_driver bcm_kona_gpio_driver = {
 	},
 	.probe = bcm_kona_gpio_probe,
 };
-
-module_platform_driver(bcm_kona_gpio_driver);
-
-MODULE_AUTHOR("Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>");
-MODULE_DESCRIPTION("Broadcom Kona GPIO Driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(bcm_kona_gpio_driver);
-- 
2.6.1


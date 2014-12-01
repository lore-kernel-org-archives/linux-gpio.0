From: <kamlakant.patel@linaro.org>
Subject: [PATCH v1 5/5] gpio: document basic mmio gpio library
Date: Mon, 1 Dec 2014 17:39:38 +0530
Message-ID: <1417435778-21879-6-git-send-email-kamlakant.patel@linaro.org>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:23926 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051AbaLAMJI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 07:09:08 -0500
In-Reply-To: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This is a brief documentation on how to use GPIO Generic
library for memory-mapped GPIO controllers.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
---
 Documentation/gpio/driver.txt | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 31e0b5d..563abea 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -190,3 +190,53 @@ gpiochip_free_own_desc().
 These functions must be used with care since they do not affect module use
 count. Do not use the functions to request gpio descriptors not owned by the
 calling driver.
+
+
+Generic driver for memory-mapped GPIO controllers
+-------------------------------------------------
+The GPIO generic library provides support for basic platform_device
+memory-mapped GPIO controllers, which can be accessed by selecting Kconfig
+symbol GPIO_GENERIC and using library functions provided by GPIO generic
+driver (see drivers/gpio/gpio-generic.c).
+The simplest form of a GPIO controller that the driver support is just a
+single "data" register, where GPIO state can be read and/or written.
+
+The driver can be registered using "basic-mmio-gpio" or for big-endian
+notation support use "basic-mmio-gpio-be". The code will configure gpio_chip
+and issue gpiochip_add().
+
+The driver supports:
+- 8/16/32/64 bits registers. The number of GPIOs is determined by the width of
+  the registers.
+- GPIO controllers with clear/set registers.
+- GPIO controllers with a single "data" register.
+- Big endian bits/GPIOs ordering.
+
+For setting GPIO's there are three supported configurations:
+- single input/output register resource (named "dat").
+- set/clear pair (named "set" and "clr").
+- single output register resource and single input resource ("set" and dat").
+
+For setting the GPIO direction, there are three supported configurations:
+- simple bidirection GPIO that requires no configuration.
+- an output direction register (named "dirout") where a 1 bit indicates the
+  GPIO is an output.
+- an input direction register (named "dirin") where a 1 bit indicates the GPIO
+  is an input.
+
+It is possible to use only parts of GPIO generic library. Each GPIO controller
+using GPIO generic library needs to include the following header.
+
+        #include <linux/basic_mmio_gpio.h>
+
+Use bgpio_init to configure gpio_chip and bgpio_remove to remove the controller.
+int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
+               unsigned long sz, void __iomem *dat, void __iomem *set,
+               void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
+               unsigned long flags);
+
+The "flag" parameter can be following depending on controller configuration:
+BGPIOF_BIG_ENDIAN               BIT(0)
+BGPIOF_UNREADABLE_REG_SET       BIT(1) /* reg_set is unreadable */
+BGPIOF_UNREADABLE_REG_DIR       BIT(2) /* reg_dir is unreadable */
+BGPIOF_BIG_ENDIAN_BYTE_ORDER    BIT(3)
-- 
1.9.1


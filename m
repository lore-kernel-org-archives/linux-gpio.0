From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 1/2] gpio: mb86s7x: share with other SoCs as module
Date: Fri, 27 Oct 2017 21:21:47 +0100
Message-ID: <20171027202148.4188-2-ard.biesheuvel@linaro.org>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:53116 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751831AbdJ0UWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Oct 2017 16:22:08 -0400
Received: by mail-wm0-f67.google.com with SMTP id t139so5844078wmt.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Oct 2017 13:22:07 -0700 (PDT)
In-Reply-To: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, daniel.thompson@linaro.org, leif.lindholm@linaro.org, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Geliang Tang <geliangtang@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

In order to reuse this driver for the Socionext Synquacer SC2A11 SoC,
which inherited this IP from Fujitsu, remove the ARCH_MB86S7X Kconfig
dependency, and revert the changes that prevent it from being built as
a module.

This reverts commits d65aa4b67b4f47f303bdeaef1e4d42ef18e6b293 and
d5610e514e92144d19bd5e39e5cf3804bbf85f3e.

Cc: Geliang Tang <geliangtang@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/gpio/Kconfig        |  3 +--
 drivers/gpio/gpio-mb86s7x.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3f80f167ed56..bf40a948e4cc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -286,8 +286,7 @@ config GPIO_LYNXPOINT
 	  Requires ACPI device enumeration code to set up a platform device.
 
 config GPIO_MB86S7X
-	bool "GPIO support for Fujitsu MB86S7x Platforms"
-	depends on ARCH_MB86S7X || COMPILE_TEST
+	tristate "GPIO support for Fujitsu MB86S7x Platforms"
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 94d772677ed6..6e1598471733 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/clk.h>
+#include <linux/module.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/ioport.h>
@@ -209,6 +210,7 @@ static const struct of_device_id mb86s70_gpio_dt_ids[] = {
 	{ .compatible = "fujitsu,mb86s70-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
 
 static struct platform_driver mb86s70_gpio_driver = {
 	.driver = {
@@ -219,4 +221,12 @@ static struct platform_driver mb86s70_gpio_driver = {
 	.remove = mb86s70_gpio_remove,
 };
 
-builtin_platform_driver(mb86s70_gpio_driver);
+static int __init mb86s70_gpio_init(void)
+{
+	return platform_driver_register(&mb86s70_gpio_driver);
+}
+module_init(mb86s70_gpio_init);
+
+MODULE_DESCRIPTION("MB86S7x GPIO Driver");
+MODULE_ALIAS("platform:mb86s70-gpio");
+MODULE_LICENSE("GPL");
-- 
2.11.0


From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] gpiolib: Include GPIO label in log messages for GPIOs
Date: Mon,  9 Sep 2013 10:33:50 +0100
Message-ID: <1378719230-10931-2-git-send-email-broonie@kernel.org>
References: <1378719230-10931-1-git-send-email-broonie@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37614 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751128Ab3IIJeG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 05:34:06 -0400
In-Reply-To: <1378719230-10931-1-git-send-email-broonie@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Provide the human readable label for the GPIO as well as the number when
we are recording it in order to improve the readability of log messages.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/gpio/gpiolib.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e4937b7..b126403 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -103,6 +103,26 @@ static int gpiod_export_link(struct device *dev, const char *name,
 static int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
 static void gpiod_unexport(struct gpio_desc *desc);
 
+#ifdef CONFIG_DEBUG_FS
+#define gpiod_emerg(desc, fmt, ...)			                \
+	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+                 ##__VA_ARGS__)
+#define gpiod_crit(desc, fmt, ...)			                \
+	pr_crit("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+                 ##__VA_ARGS__)
+#define gpiod_err(desc, fmt, ...)				        \
+	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,   \
+                 ##__VA_ARGS__)
+#define gpiod_warn(desc, fmt, ...)				        \
+	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+                 ##__VA_ARGS__)
+#define gpiod_info(desc, fmt, ...)				        \
+	pr_info("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label,  \
+                ##__VA_ARGS__)
+#define gpiod_dbg(desc, fmt, ...)				   \
+	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label, \
+                 ##__VA_ARGS__)
+#else
 #define gpiod_emerg(desc, fmt, ...)			           \
 	pr_emerg("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_crit(desc, fmt, ...)			           \
@@ -115,6 +135,7 @@ static void gpiod_unexport(struct gpio_desc *desc);
 	pr_info("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
 #define gpiod_dbg(desc, fmt, ...)				   \
 	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
+#endif
 
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
-- 
1.8.4.rc3


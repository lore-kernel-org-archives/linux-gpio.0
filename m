From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Add helpers to determin direction of gpiods
Date: Sun, 10 Dec 2017 01:23:40 +0100
Message-ID: <20171210002340.18460-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40405 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751002AbdLJAZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Dec 2017 19:25:48 -0500
Received: by mail-lf0-f65.google.com with SMTP id c140so8645887lfg.7
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2017 16:25:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>

The gpiod_get_direction() returns 1 for input and 0 for output
but it's pretty hard to remember which one is which and generally
unintuitive and messy to provide #defines so let's simply add
two static inlines to do the job.

Cc: Wolfram Sang <wsa@the-dreams.de>
Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/consumer.txt | 14 +++++++++++---
 include/linux/gpio/consumer.h   | 25 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 63e1bd1d88e3..c4b8e3d8c29f 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -162,8 +162,8 @@ The device-managed variants are, unsurprisingly:
 Using GPIOs
 ===========
 
-Setting Direction
------------------
+Setting and Getting Direction
+-----------------------------
 The first thing a driver must do with a GPIO is setting its direction. If no
 direction-setting flags have been given to gpiod_get*(), this is done by
 invoking one of the gpiod_direction_*() functions:
@@ -184,7 +184,15 @@ A driver can also query the current direction of a GPIO:
 
 	int gpiod_get_direction(const struct gpio_desc *desc)
 
-This function will return either GPIOF_DIR_IN or GPIOF_DIR_OUT.
+This function will return either 1 (input) or 0 (output). There are also
+these convenience helpers:
+
+	bool gpiod_is_input(const struct gpio_desc *desc)
+	bool gpiod_is_output(const struct gpio_desc *desc)
+
+These will not provide the same level of error fallbacks: if they fail to
+obtain the direction, they will print an error and report as input since this
+is usually safest.
 
 Be aware that there is no default direction for GPIOs. Therefore, **using a GPIO
 without setting its direction first is illegal and will result in undefined
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 7447d85dbe2f..4e5ee3ec1913 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -487,6 +487,31 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+/*
+ * Helpers that quickly tell whether a line is input or output.
+ */
+static inline bool gpiod_is_input(struct gpio_desc *desc)
+{
+	int ret = gpiod_get_direction(desc);
+	if (ret < 0) {
+		pr_err("GPIO: failed to get direction\n");
+		/* It is usually safest to assume we are input */
+		return true;
+	}
+	return !!ret;
+}
+
+static inline bool gpiod_is_output(struct gpio_desc *desc)
+{
+	int ret = gpiod_get_direction(desc);
+	if (ret < 0) {
+		pr_err("GPIO: failed to get direction\n");
+		/* It is usually safest to assume we are input */
+		return false;
+	}
+	return !ret;
+}
+
 static inline
 struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
 						   const char *con_id,
-- 
2.14.3


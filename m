From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 4/6] gpiolib-sysfs: Add gpio name parsing for sysfs export
Date: Tue,  4 Aug 2015 11:23:21 +0200
Message-ID: <1438680203-13432-5-git-send-email-mpa@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40314 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932399AbbHDJXi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:23:38 -0400
In-Reply-To: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-sysfs.c | 47 ++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b57ed8e55ab5..e22a86e31c90 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -443,18 +443,28 @@ static ssize_t export_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
-	if (status < 0)
-		goto done;
+	if (!status)
+		desc = gpio_to_desc(gpio);
 
-	desc = gpio_to_desc(gpio);
-	/* reject invalid GPIOs */
+	/* Fall back on detection by name */
 	if (!desc) {
-		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
-		return -EINVAL;
+		char *gpio_name = kstrdup(buf, GFP_KERNEL);
+
+		if (!gpio_name)
+			return -ENOMEM;
+
+		desc = gpio_name_to_desc(strim(gpio_name));
+		kfree(gpio_name);
+
+		/* reject invalid GPIOs */
+		if (!desc) {
+			pr_warn("%s: invalid GPIO %s\n", __func__, buf);
+			return -EINVAL;
+		}
 	}
 
 	/* No extra locking here; FLAG_SYSFS just signifies that the
@@ -485,17 +495,28 @@ static ssize_t unexport_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
-	if (status < 0)
-		goto done;
+	if (!status)
+		desc = gpio_to_desc(gpio);
+
+	/* Fall back on detection by name */
+	if (!desc) {
+		char *gpio_name = kstrdup(buf, GFP_KERNEL);
+
+		if (!gpio_name)
+			return -ENOMEM;
+
+		desc = gpio_name_to_desc(strim(gpio_name));
+		kfree(gpio_name);
+	}
+
 
-	desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpio_unexport ignores them) */
 	if (!desc) {
-		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
+		pr_warn("%s: invalid GPIO %s\n", __func__, buf);
 		return -EINVAL;
 	}
 
@@ -509,7 +530,7 @@ static ssize_t unexport_store(struct class *class,
 		status = 0;
 		gpiod_free(desc);
 	}
-done:
+
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
-- 
2.1.4


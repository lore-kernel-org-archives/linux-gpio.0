From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 5/6] gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
Date: Tue,  4 Aug 2015 11:23:22 +0200
Message-ID: <1438680203-13432-6-git-send-email-mpa@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40666 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932425AbbHDJXy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:23:54 -0400
In-Reply-To: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

This patch adds a sysfs attribute 'name' to gpios that were exported. It
exposes the newly added name property of gpio descriptors.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-sysfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index e22a86e31c90..c5e8224428ac 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -139,6 +139,17 @@ static ssize_t value_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(value);
 
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_desc *desc = data->desc;
+
+	return sprintf(buf, "%s\n", desc->name ? : "");
+}
+
+static DEVICE_ATTR_RO(name);
+
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
@@ -377,6 +388,7 @@ static struct attribute *gpio_attrs[] = {
 	&dev_attr_edge.attr,
 	&dev_attr_value.attr,
 	&dev_attr_active_low.attr,
+	&dev_attr_name.attr,
 	NULL,
 };
 
-- 
2.1.4


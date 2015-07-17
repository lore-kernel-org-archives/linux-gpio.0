From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 8/9] gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
Date: Fri, 17 Jul 2015 11:32:49 +0200
Message-ID: <1437125570-28623-9-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45005 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756674AbbGQJdd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:33 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

This patch adds a sysfs attribute 'name' to gpios that were exported. It
exposes the newly added name property of gpio descriptors.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-sysfs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c3b74440ca67..058019879bab 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -139,6 +139,25 @@ static ssize_t value_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(value);
 
+static ssize_t gpio_name_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gpio_desc	*desc = dev_get_drvdata(dev);
+	ssize_t			status;
+
+	mutex_lock(&sysfs_lock);
+
+	if (!test_bit(FLAG_EXPORT, &desc->flags))
+		status = -EIO;
+	else
+		status = sprintf(buf, "%s\n", desc->name);
+
+	mutex_unlock(&sysfs_lock);
+	return status;
+}
+
+static DEVICE_ATTR(name, 0444, gpio_name_show, NULL);
+
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
@@ -377,6 +396,7 @@ static struct attribute *gpio_attrs[] = {
 	&dev_attr_edge.attr,
 	&dev_attr_value.attr,
 	&dev_attr_active_low.attr,
+	&dev_attr_name.attr,
 	NULL,
 };
 
-- 
2.1.4


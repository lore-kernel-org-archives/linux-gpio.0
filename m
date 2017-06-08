From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/7] gpio: use class_groups instead of class_attrs
Date: Thu,  8 Jun 2017 10:12:40 +0200
Message-ID: <20170608081242.27061-6-gregkh@linuxfoundation.org>
References: <20170608081242.27061-1-gregkh@linuxfoundation.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39348 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751785AbdFHING (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 04:13:06 -0400
In-Reply-To: <20170608081242.27061-1-gregkh@linuxfoundation.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The class_attrs pointer is long depreciated, and is about to be finally
removed, so move to use the class_groups pointer instead.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: <linux-gpio@vger.kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpio/gpiolib-sysfs.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4b44dd97c07f..16fe9742597b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -479,6 +479,7 @@ static ssize_t export_store(struct class *class,
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
 }
+static CLASS_ATTR_WO(export);
 
 static ssize_t unexport_store(struct class *class,
 				struct class_attribute *attr,
@@ -514,18 +515,20 @@ static ssize_t unexport_store(struct class *class,
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
 }
+static CLASS_ATTR_WO(unexport);
 
-static struct class_attribute gpio_class_attrs[] = {
-	__ATTR(export, 0200, NULL, export_store),
-	__ATTR(unexport, 0200, NULL, unexport_store),
-	__ATTR_NULL,
+static struct attribute *gpio_class_attrs[] = {
+	&class_attr_export.attr,
+	&class_attr_unexport.attr,
+	NULL,
 };
+ATTRIBUTE_GROUPS(gpio_class);
 
 static struct class gpio_class = {
 	.name =		"gpio",
 	.owner =	THIS_MODULE,
 
-	.class_attrs =	gpio_class_attrs,
+	.class_groups = gpio_class_groups,
 };
 
 
-- 
2.13.1


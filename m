From: <gregkh@linuxfoundation.org>
Subject: patch "gpio: use class_groups instead of class_attrs" added to driver-core-next
Date: Fri, 09 Jun 2017 20:08:15 +0200
Message-ID: <149703169515551@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59470 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751538AbdFISIp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 14:08:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gregkh@linuxfoundation.org, gnurou@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    gpio: use class_groups instead of class_attrs

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


>From d83bb159f4c6af4a7465ed457d554d30df95e890 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 8 Jun 2017 10:12:40 +0200
Subject: gpio: use class_groups instead of class_attrs

The class_attrs pointer is long depreciated, and is about to be finally
removed, so move to use the class_groups pointer instead.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
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



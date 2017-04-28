From: Anatolij Gustschin <agust@denx.de>
Subject: (unknown)
Date: Fri, 28 Apr 2017 10:20:10 +0200
Message-ID: <1493367610-7330-1-git-send-email-agust@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:53360 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032235AbdD1IUO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 04:20:14 -0400
Subject: 
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Subject: [PATCH v3] gpiolib: Add stubs for gpiod lookup table interface

Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
for the !GPIOLIB case to prevent build errors. Also add prototypes.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
Changes in v3:
 - add stubs for !GPIOLIB case. Drop prototypes, these are
   already in gpio/machine.h

Changes in v2:
 - move gpiod_lookup_table out of #ifdef

 include/linux/gpio/consumer.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8f702fc..cf3fee2 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -41,6 +41,8 @@ enum gpiod_flags {
 			  GPIOD_FLAGS_BIT_DIR_VAL,
 };
 
+struct gpiod_lookup_table;
+
 #ifdef CONFIG_GPIOLIB
 
 /* Return the number of GPIOs associated with a device / function */
@@ -435,6 +437,12 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline
+void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
+
+static inline
+void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
+
 #endif /* CONFIG_GPIOLIB */
 
 static inline
-- 
2.7.4


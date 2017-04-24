From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH] gpiolib: Add stubs for gpiod lookup table interface
Date: Mon, 24 Apr 2017 16:04:22 +0200
Message-ID: <1493042662-30435-1-git-send-email-agust@denx.de>
References: <CAHp75VeHmOpSAAZM87_0Y120mrXpPG0aCns=Zp5tBTMh3GBXmw@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:55226 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1170533AbdDXOE3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 10:04:29 -0400
In-Reply-To: <CAHp75VeHmOpSAAZM87_0Y120mrXpPG0aCns=Zp5tBTMh3GBXmw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org

Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
for the !GPIOLIB case to prevent build errors. Also add prototypes.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 include/linux/gpio/consumer.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 933d936..6c0cc67 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -144,6 +144,11 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 						enum gpiod_flags flags,
 						const char *label);
 
+struct gpiod_lookup_table;
+
+void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
+void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -435,6 +440,16 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+struct gpiod_lookup_table;
+
+static inline void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
+{
+}
+
+static inline void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
+{
+}
+
 #endif /* CONFIG_GPIOLIB */
 
 static inline
-- 
2.7.4


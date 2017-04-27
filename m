From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v2] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 27 Apr 2017 08:52:36 +0200
Message-ID: <1493275956-14759-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
for the !GPIOLIB case to prevent build errors. Also add prototypes.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
Changes in v2:
 move gpiod_lookup_table out of #ifdef

 include/linux/gpio/consumer.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8f702fc..f4a3fed 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -41,6 +41,8 @@ enum gpiod_flags {
 			  GPIOD_FLAGS_BIT_DIR_VAL,
 };
 
+struct gpiod_lookup_table;
+
 #ifdef CONFIG_GPIOLIB
 
 /* Return the number of GPIOs associated with a device / function */
@@ -144,6 +146,9 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 						enum gpiod_flags flags,
 						const char *label);
 
+void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
+void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -435,6 +440,14 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
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

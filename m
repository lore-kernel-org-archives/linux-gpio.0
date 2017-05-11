From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v4] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 11 May 2017 20:24:31 +0200
Message-ID: <1494527071-6412-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
for the !GPIOLIB case to prevent build errors.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
Changes in v4:
 - move stubs to gpio/machine.h

Changes in v3:
 - add stubs for !GPIOLIB case. Drop prototypes, these are
   already in gpio/machine.h

Changes in v2:
 - move gpiod_lookup_table out of #ifdef

 include/linux/gpio/machine.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index c0d712d..f738d50 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -56,7 +56,14 @@ struct gpiod_lookup_table {
 	.flags = _flags,                                                  \
 }
 
+#ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
+#else
+static inline
+void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
+static inline
+void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
+#endif
 
 #endif /* __LINUX_GPIO_MACHINE_H */
-- 
2.7.4

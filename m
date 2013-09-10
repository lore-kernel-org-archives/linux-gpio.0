From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 7/7] ARM: ixp4xx: stop broadcasting the custom GPIO API
Date: Tue, 10 Sep 2013 14:31:46 +0200
Message-ID: <1378816306-8244-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:59008 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3IJMbv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 08:31:51 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so6276970lab.28
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2013 05:31:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

Now that these custom GPIO accessors are only used from the
gpio chip in this machine, move the code out of the include
file and right next to the gpiochip implementation.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-ixp4xx/common.c                | 38 +++++++++++++++++++++++++++
 arch/arm/mach-ixp4xx/include/mach/platform.h | 39 ----------------------------
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 8708ac8..9edaf47 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -81,6 +81,44 @@ void __init ixp4xx_map_io(void)
   	iotable_init(ixp4xx_io_desc, ARRAY_SIZE(ixp4xx_io_desc));
 }
 
+/*
+ * GPIO-functions
+ */
+/*
+ * The following converted to the real HW bits the gpio_line_config
+ */
+/* GPIO pin types */
+#define IXP4XX_GPIO_OUT 		0x1
+#define IXP4XX_GPIO_IN  		0x2
+
+/* GPIO signal types */
+#define IXP4XX_GPIO_LOW			0
+#define IXP4XX_GPIO_HIGH		1
+
+/* GPIO Clocks */
+#define IXP4XX_GPIO_CLK_0		14
+#define IXP4XX_GPIO_CLK_1		15
+
+static void gpio_line_config(u8 line, u32 direction)
+{
+	if (direction == IXP4XX_GPIO_IN)
+		*IXP4XX_GPIO_GPOER |= (1 << line);
+	else
+		*IXP4XX_GPIO_GPOER &= ~(1 << line);
+}
+
+static void gpio_line_get(u8 line, int *value)
+{
+	*value = (*IXP4XX_GPIO_GPINR >> line) & 0x1;
+}
+
+static void gpio_line_set(u8 line, int value)
+{
+	if (value == IXP4XX_GPIO_HIGH)
+	    *IXP4XX_GPIO_GPOUTR |= (1 << line);
+	else if (value == IXP4XX_GPIO_LOW)
+	    *IXP4XX_GPIO_GPOUTR &= ~(1 << line);
+}
 
 /*************************************************************************
  * IXP4xx chipset IRQ handling
diff --git a/arch/arm/mach-ixp4xx/include/mach/platform.h b/arch/arm/mach-ixp4xx/include/mach/platform.h
index 4c4c6a6..75c4c65 100644
--- a/arch/arm/mach-ixp4xx/include/mach/platform.h
+++ b/arch/arm/mach-ixp4xx/include/mach/platform.h
@@ -131,44 +131,5 @@ struct pci_sys_data;
 extern int ixp4xx_setup(int nr, struct pci_sys_data *sys);
 extern struct pci_ops ixp4xx_ops;
 
-/*
- * GPIO-functions
- */
-/*
- * The following converted to the real HW bits the gpio_line_config
- */
-/* GPIO pin types */
-#define IXP4XX_GPIO_OUT 		0x1
-#define IXP4XX_GPIO_IN  		0x2
-
-/* GPIO signal types */
-#define IXP4XX_GPIO_LOW			0
-#define IXP4XX_GPIO_HIGH		1
-
-/* GPIO Clocks */
-#define IXP4XX_GPIO_CLK_0		14
-#define IXP4XX_GPIO_CLK_1		15
-
-static inline void gpio_line_config(u8 line, u32 direction)
-{
-	if (direction == IXP4XX_GPIO_IN)
-		*IXP4XX_GPIO_GPOER |= (1 << line);
-	else
-		*IXP4XX_GPIO_GPOER &= ~(1 << line);
-}
-
-static inline void gpio_line_get(u8 line, int *value)
-{
-	*value = (*IXP4XX_GPIO_GPINR >> line) & 0x1;
-}
-
-static inline void gpio_line_set(u8 line, int value)
-{
-	if (value == IXP4XX_GPIO_HIGH)
-	    *IXP4XX_GPIO_GPOUTR |= (1 << line);
-	else if (value == IXP4XX_GPIO_LOW)
-	    *IXP4XX_GPIO_GPOUTR &= ~(1 << line);
-}
-
 #endif // __ASSEMBLY__
 
-- 
1.8.3.1


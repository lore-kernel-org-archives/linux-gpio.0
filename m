From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v1 1/2] gpio: gpio-wcove: fix GPIO irq status mask
Date: Fri, 14 Apr 2017 10:29:24 -0700
Message-ID: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:49345 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751416AbdDNRdD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Apr 2017 13:33:03 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

According to Whiskey cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
battery IO. So we should skip this bit when checking for GPIO irq pending
status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
loop until irq "pending" status becomes 0. This patch fixes this issue.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/gpio/gpio-wcove.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 97613de..68ef061 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -51,6 +51,8 @@
 #define GROUP1_NR_IRQS		6
 #define IRQ_MASK_BASE		0x4e19
 #define IRQ_STATUS_BASE		0x4e0b
+#define GPIO_IRQ0_MASK		0x7f
+#define GPIO_IRQ1_MASK		0x3f
 #define UPDATE_IRQ_TYPE		BIT(0)
 #define UPDATE_IRQ_MASK		BIT(1)
 
@@ -309,7 +311,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	pending = p[0] | (p[1] << 8);
+	pending = (p[0] & GPIO_IRQ0_MASK) | ((p[1] & GPIO_IRQ1_MASK) << 7);
 	if (!pending)
 		return IRQ_NONE;
 
@@ -333,7 +335,8 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 			break;
 		}
 
-		pending = p[0] | (p[1] << 8);
+		pending = (p[0] & GPIO_IRQ0_MASK) |
+			((p[1] & GPIO_IRQ1_MASK) << 7);
 	}
 
 	return IRQ_HANDLED;
-- 
2.7.4


From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v2 1/1] gpio: gpio-wcove: fix GPIO IRQ status mask
Date: Mon, 24 Apr 2017 12:15:04 -0700
Message-ID: <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:54503 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S976034AbdDXTSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Apr 2017 15:18:34 -0400
In-Reply-To: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org, andy.shevchenko@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

According to Whiskey Cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
battery IO. So we should skip this bit when checking for GPIO IRQ pending
status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
loop until IRQ "pending" status becomes 0. This patch fixes this issue.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/gpio/gpio-wcove.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Changes since v1:
 * Used GENMASK API.
 * Fixed some style issues.
 * Updated commit message.

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 97613de..7872435 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -51,6 +51,8 @@
 #define GROUP1_NR_IRQS		6
 #define IRQ_MASK_BASE		0x4e19
 #define IRQ_STATUS_BASE		0x4e0b
+#define GPIO_IRQ0_MASK		GENMASK(6, 0)
+#define GPIO_IRQ1_MASK		GENMASK(5, 0)
 #define UPDATE_IRQ_TYPE		BIT(0)
 #define UPDATE_IRQ_MASK		BIT(1)
 
@@ -309,7 +311,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	pending = p[0] | (p[1] << 8);
+	pending = (p[0] & GPIO_IRQ0_MASK) | ((p[1] & GPIO_IRQ1_MASK) << 7);
 	if (!pending)
 		return IRQ_NONE;
 
@@ -333,7 +335,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 			break;
 		}
 
-		pending = p[0] | (p[1] << 8);
+		pending = (p[0] & GPIO_IRQ0_MASK) | ((p[1] & GPIO_IRQ1_MASK) << 7);
 	}
 
 	return IRQ_HANDLED;
-- 
2.7.4


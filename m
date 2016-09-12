From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/8] gpio: ath79: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:28 -0400
Message-ID: <20160912221631.15812-6-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig for this file is:

drivers/gpio/Kconfig:config GPIO_ATH79
drivers/gpio/Kconfig: tristate "Atheros AR71XX/AR724X/AR913X GPIO support"

...but however it does not include module.h -- it in turn gets it from
another header (gpio/driver.h) and we'd like to replace that with a
forward delcaration of "struct module;" but if we do, this file will
fail to compile.

So we fix this first to avoid putting build failures into the bisect
commit history.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-ath79.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index c4f4cddc7c1a..9457e2022bf6 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -15,6 +15,7 @@
 #include <linux/platform_data/gpio-ath79.h>
 #include <linux/of_device.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/irq.h>
 
 #define AR71XX_GPIO_REG_OE		0x00
-- 
2.8.4

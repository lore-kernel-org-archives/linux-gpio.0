From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/8] gpio: altera: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:27 -0400
Message-ID: <20160912221631.15812-5-paul.gortmaker@windriver.com>
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

drivers/gpio/Kconfig:config GPIO_ALTERA
drivers/gpio/Kconfig:   tristate "Altera GPIO"

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
 drivers/gpio/gpio-altera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 3f87a03abc22..5bddbd507ca9 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 
-- 
2.8.4

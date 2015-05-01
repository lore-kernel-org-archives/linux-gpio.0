From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 03/11] drivers/gpio: include <module.h> for modular crystalcove code
Date: Thu, 30 Apr 2015 21:47:39 -0400
Message-ID: <1430444867-22342-4-git-send-email-paul.gortmaker@windriver.com>
References: <1430444867-22342-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430444867-22342-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This file is built off of a tristate Kconfig option and also contains
modular function calls so it should explicitly include module.h to
avoid compile breakage during header shuffles done in the future.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-crystalcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 91a7ffe83135..cf28ec525e93 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/seq_file.h>
-- 
2.2.1

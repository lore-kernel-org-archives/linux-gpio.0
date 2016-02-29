From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/8] drivers/pinctrl: sunxi/pinctrl-sunxi.c does not need module.h
Date: Mon, 29 Feb 2016 15:48:37 -0500
Message-ID: <1456778924-20730-2-git-send-email-paul.gortmaker@windriver.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This file is not modular, nor is it using modular functions. The
only thing close is the global THIS_MODULE which comes from export.h
so lets replace it appropriately and cut back on the amount of
header stuff we draw in by several thousand lines.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 45135500c8d5..12a1dfabb1af 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -15,7 +15,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-- 
2.6.1

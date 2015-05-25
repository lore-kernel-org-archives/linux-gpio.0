From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 08/21] gpio: Probe GPIO drivers on demand
Date: Mon, 25 May 2015 16:53:12 +0200
Message-ID: <1432565608-26036-9-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <stephane.marchesin@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexander Holler <holler@ahsoftware.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Ensure that the device corresponding to the DT node of the gpiochip has
been registered.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a6c67c6..190183d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
+#include <linux/of_platform.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
 #include <linux/gpio/machine.h>
@@ -95,6 +96,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
+	of_platform_device_ensure(gg_data.gpiospec.np);
+
 	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
 
 	of_node_put(gg_data.gpiospec.np);
-- 
2.4.1

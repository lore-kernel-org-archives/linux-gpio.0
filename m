From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: mxs: remove __init annotation
Date: Fri, 16 Dec 2016 10:08:14 +0100
Message-ID: <20161216090825.2299257-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marex@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, Gregory Fong <gregory.0xf0@gmail.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Building with an old toolchain, I ran into this warning:

WARNING: vmlinux.o(.text+0x63eef0): Section mismatch in reference from the function mxs_gpio_probe() to the function .init.text:mxs_gpio_init_gc()

Clearly the annotation is wrong, since the function is called from the
non-init probe, so let's remove it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 1e8fde8cb803..2292742eac8f 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -205,7 +205,7 @@ static int mxs_gpio_set_wake_irq(struct irq_data *d, unsigned int enable)
 	return 0;
 }
 
-static int __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
+static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
-- 
2.9.0

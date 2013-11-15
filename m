From: Liu Gang <Gang.Liu@freescale.com>
Subject: [PATCH] powerpc/gpio: Fix the wrong GPIO input data on MPC8572/MPC8536
Date: Fri, 15 Nov 2013 15:16:29 +0800
Message-ID: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:24633 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752483Ab3KOIeQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 15 Nov 2013 03:34:16 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: b07421@freescale.com, r61911@freescale.com, Liu Gang <Gang.Liu@freescale.com>

For MPC8572/MPC8536, the status of GPIOs defined as output
cannot be determined by reading GPDAT register, so the code
use shadow data register instead. But if the input pins are
asserted high, they will always read high due to the shadow
data, even if the pins are set to low.

So the input pins should be read directly from GPDAT, not
the shadow data.

Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 9ae29cc..1d4ac75 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -71,6 +71,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
 
 	val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
+	mpc8xxx_gc->data &= in_be32(mm->regs + GPIO_DIR);
 
 	return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
 }
-- 
1.8.4.1



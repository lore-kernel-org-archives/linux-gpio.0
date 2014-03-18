From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] gpio: iop: fix devm_ioremap_resource() return value checking
Date: Tue, 18 Mar 2014 10:58:33 +0100
Message-ID: <1625450.oZua1OVhNs@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16069 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753462AbaCRJ6v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Mar 2014 05:58:51 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

devm_ioremap_resource() returns a pointer to the remapped memory or
an ERR_PTR() encoded error code on failure.  Fix the check inside
iop3xx_gpio_probe() accordingly.

Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
Compile tested only.

 drivers/gpio/gpio-iop.c |    2 ++
 1 file changed, 2 insertions(+)

Index: b/drivers/gpio/gpio-iop.c
===================================================================
--- a/drivers/gpio/gpio-iop.c	2014-03-14 16:45:08.152724313 +0100
+++ b/drivers/gpio/gpio-iop.c	2014-03-18 10:50:01.903194680 +0100
@@ -111,6 +111,8 @@ static int iop3xx_gpio_probe(struct plat
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	return gpiochip_add(&iop3xx_chip);
 }


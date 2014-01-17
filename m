From: Waibel Georg <Georg.Waibel@sensor-technik.de>
Subject: [PATCH 1/1] iMX gpio: Allow reading back of pin status if
 configured as gpio output
Date: Fri, 17 Jan 2014 14:11:18 +0000
Message-ID: <E1C9442006A9AE48A7A4B85E0D01C4D474F059@stwexdb.stww2k.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.sensor-technik.de ([80.150.181.156]:16880 "EHLO
	mail.sensor-technik.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958AbaAQOVq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2014 09:21:46 -0500
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>From cb384950a1153e856ec03109a5156e660a89bf6d Mon Sep 17 00:00:00 2001
From: Georg Waibel <georg.waibel@sensor-technik.de>
Date: Fri, 17 Jan 2014 14:51:38 +0100
Subject: [PATCH 1/1] iMX gpio: Allow reading back of pin status if configured
 as gpio output

Register PSR was used to read the pin status in the mxc_gpio driver. This
register reflects the pin status if a pin is configured as gpio input.
If a pin is configured as an gpio output register PSR is not updated and
returns 0 instead of the actual pin status. Thus attempting to read back the
status of an gpio output pin via PSR returns a wrong value.

Reading register DR instead of PSR fixes this issue:
- If pin is gpio output: DR returns the value written to DR by software
- If pin is gpio input: DR returns the value of register PSR und thus the
  pin status

This behaviour is valid for all processors >= iMX31. Verified on iMX6q.
See the iMX reference manuals gpio section for details.

Signed-off-by: Georg Waibel <georg.waibel@sensor-technik.de>
---
 drivers/gpio/gpio-mxc.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3307f6d..3717e09 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -407,6 +407,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	struct resource *iores;
 	int irq_base;
 	int err;
+	int dat;
 
 	mxc_gpio_get_hw(pdev);
 
@@ -447,8 +448,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
+	dat = (mxc_gpio_hwtype == IMX21_GPIO) ? GPIO_PSR : GPIO_DR;
 	err = bgpio_init(&port->bgc, &pdev->dev, 4,
-			 port->base + GPIO_PSR,
+			 port->base + dat,
 			 port->base + GPIO_DR, NULL,
 			 port->base + GPIO_GDIR, NULL, 0);
 	if (err)
-- 
1.7.9.5

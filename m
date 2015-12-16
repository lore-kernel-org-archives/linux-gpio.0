From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Wed, 16 Dec 2015 15:05:02 +0100
Message-ID: <20151216140456.GA20121@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36438 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933935AbbLPOFH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 09:05:07 -0500
Received: by mail-wm0-f45.google.com with SMTP id p187so2665129wmp.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2015 06:05:07 -0800 (PST)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, michael@amarulasolutions.com

Hi

I have get a problem using gpio and imx6q freescale architecture. I don't
really understand how should work your change and I have done a quick
fix for me. Can you explain what was the idea?

Michael

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index a3f0753..f9c6ff7 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
 	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
+	unsigned long reg;
 
 	if (bgc->dir & pinmask)
-		return bgc->read_reg(bgc->reg_set) & pinmask;
+		reg = bgc->read_reg(bgc->reg_set) & pinmask;
 	else
-		return bgc->read_reg(bgc->reg_dat) & pinmask;
+		reg = bgc->read_reg(bgc->reg_dat) & pinmask;
+
+	return !!(reg &  bgc->pin2mask(bgc, gpio));
 }
 
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |

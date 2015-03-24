From: <grygorii.strashko@linaro.org>
Subject: [PATCH] gpio: syscon: reduce message level when direction reg offset not in dt
Date: Tue, 24 Mar 2015 20:42:42 +0200
Message-ID: <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
References: <20150324161358.GA694@kahuna>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33173 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932111AbbCXSm4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2015 14:42:56 -0400
Received: by labto5 with SMTP id to5so1505778lab.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2015 11:42:54 -0700 (PDT)
In-Reply-To: <20150324161358.GA694@kahuna>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux@arm.linux.org.uk, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: m-karicheri2@ti.com, ssantosh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>

From: Grygorii Strashko <grygorii.strashko@linaro.org>

Now GPIO syscon driver produces bunch of warnings during the
boot of Kesytone 2 SoCs:
 gpio-syscon soc:keystone_dsp_gpio@02620240: can't read the dir register offset!
 gpio-syscon soc:keystone_dsp_gpio@2620244: can't read the dir register offset!

This message unintentionally was added using dev_err(), but its
actual log level is debug, because third cell of "ti,syscon-dev" is
optional.

Hence change it to dev_dbg() as it should be.

This patch fixes commit:
 5a3e3f8 ("gpio: syscon: retriave syscon node and regs offsets from dt")

Reported-by: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 257e298..045a952 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -219,7 +219,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
 						 &priv->dir_reg_offset);
 		if (ret)
-			dev_err(dev, "can't read the dir register offset!\n");
+			dev_dbg(dev, "can't read the dir register offset!\n");
 
 		priv->dir_reg_offset <<= 3;
 	}
-- 
1.9.1


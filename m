From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 2/3] gpio: mxc: lower level of gpio_mxc_init() initcall
Date: Sat, 20 Aug 2016 01:10:14 +0300
Message-ID: <1471644615-10320-3-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1471644615-10320-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:35677 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755489AbcHSWK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 18:10:28 -0400
In-Reply-To: <1471644615-10320-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Deepak Das <deepak_das@mentor.com>

gpio-mxc probe should be called after imx pinctrl driver to make
sure that gpio-ranges are mapped to the corresponding pins of pin
controller.

This commit changes the initcall level of gpio-mxc driver from
postcore to device level.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1b342a3842c8..1f0deb7d3380 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -510,7 +510,7 @@ static int __init gpio_mxc_init(void)
 {
 	return platform_driver_register(&mxc_gpio_driver);
 }
-postcore_initcall(gpio_mxc_init);
+device_initcall(gpio_mxc_init);
 
 MODULE_AUTHOR("Freescale Semiconductor, "
 	      "Daniel Mack <danielncaiaq.de>, "
-- 
2.8.1


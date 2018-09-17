From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] gpio: pxa: avoid attempting to set pin direction via pinctrl on MMP2
Date: Mon, 17 Sep 2018 13:17:21 +0200
Message-ID: <20180917111721.7412-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Similarly to PXA3xx pinctrl-single can't set pin direction on MMP2 either.
See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
PXA3xx")

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index c18712dabf93..2f8fade7497d 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -245,6 +245,7 @@ static bool pxa_gpio_has_pinctrl(void)
 {
 	switch (gpio_type) {
 	case PXA3XX_GPIO:
+	case MMP2_GPIO:
 		return false;
 
 	default:
-- 
2.17.1

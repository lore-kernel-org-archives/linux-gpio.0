From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/2] pinctrl: sunxi: Increase size of regulator array
Date: Thu, 10 Jan 2019 16:26:32 +0800
Message-ID: <20190110082633.6321-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On the A80, the pin banks go up to PN, which translates to the 14th
entry in the regulator array. The array is only 12 entries long, which
causes the sunxi_pmx_{request,free} functions to access beyond the
array on the A80 and the A31 (which has pin bank PM). While the
accessed data is still valid allocated data within the same driver
data structure, it is likely not a pointer.

Increase the size of the regulator array from 12 to 14. This is a simple
fix. While we could have the code take into account the fact that R_PIO
pin banks start from PL, or maybe even dynamically allocate the array
based on the last pin of the pin controller, the size reduction probably
isn't worth the additional code complexity.

Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
This fixes a crash due to an invalid pointer on the A80.
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index e340d2a24b44..e8161aa17dab 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -136,7 +136,7 @@ struct sunxi_pinctrl {
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
-	struct sunxi_pinctrl_regulator	regulators[12];
+	struct sunxi_pinctrl_regulator	regulators[14];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
2.20.1

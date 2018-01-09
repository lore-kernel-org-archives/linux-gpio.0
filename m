From: hao_zhang <hao5781286@gmail.com>
Subject: [RESEND PATCH] ARM: pinctrl: sunxi-pinctrl: fix pin funtion can not
 be match correctly.
Date: Tue, 9 Jan 2018 13:59:02 +0800
Message-ID: <20180109055902.GA1306@arx-s1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:41331 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932532AbeAIF7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jan 2018 00:59:13 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, hao5781286@gmail.com

Pin function can not be match correctly when SUNXI_PIN describe with
mutiple variant and same function.

such as:
on pinctrl-sun4i-a10.c

SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
		SUNXI_FUNCTION(0x0, "gpio_in"),
		SUNXI_FUNCTION(0x1, "gpio_out"),
		SUNXI_FUNCTION_VARIANT(0x2, "pwm",    /* PWM0 */
			PINCTRL_SUN4I_A10 |
			PINCTRL_SUN7I_A20),
		SUNXI_FUNCTION_VARIANT(0x3, "pwm",    /* PWM0 */
			PINCTRL_SUN8I_R40)),

it would always match to the first variant function
(PINCTRL_SUN4I_A10, PINCTRL_SUN7I_A20)

so we should add variant compare on it.

Regards
Hao

Signed-off-by: hao_zhang <hao5781286@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 4b6cb25..131adf7 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -83,7 +83,9 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 			struct sunxi_desc_function *func = pin->functions;
 
 			while (func->name) {
-				if (!strcmp(func->name, func_name))
+				if (!strcmp(func->name, func_name) &&
+					(!func->variant ||
+					func->variant & pctl->variant))
 					return func;
 
 				func++;
-- 
2.7.4


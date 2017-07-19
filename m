From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 066/102] pinctrl: stm32: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:10 +0200
Message-ID: <20170719152646.25903-67-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:58783 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933125AbdGSP3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jul 2017 11:29:35 -0400
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-gpio@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 06431ff49ffb2..50299ad966590 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -952,7 +952,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	int npins = STM32_GPIO_PINS_PER_BANK;
 	int bank_nr, err;
 
-	rstc = of_reset_control_get(np, NULL);
+	rstc = of_reset_control_get_exclusive(np, NULL);
 	if (!IS_ERR(rstc))
 		reset_control_deassert(rstc);
 
-- 
2.11.0


From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 1/3] pinctrl: imx: accept gpio request/free from pinctrl
Date: Sat, 20 Aug 2016 01:10:13 +0300
Message-ID: <1471644615-10320-2-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1471644615-10320-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:35670 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755404AbcHSWK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 18:10:28 -0400
In-Reply-To: <1471644615-10320-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

While only Freescale Vybrid SoC has settings of GPIO capabilities done
by iomux controller, it is only a matter of GPIO controller driver
implementation for the rest of Freescale/NXP SoCs from iMX series.

As a practical example on GPIO request a pad function should be
switched to GPIO, but because this requires updates to all particular
iMX pinctrl drivers, for simplicity at the moment add only a proper
connection between shared pinctrl-imx and pinctrl/pinmux core, namely
.gpio_request_enable/.gpio_disable_free/.gpio_set_direction callbacks
should return success to a caller. This change allows to progress by
adding request/free callbacks into gpio-mxc.c driver.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 56fd88013850..47613201269a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -315,7 +315,7 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	/* Currently implementation only for shared mux/conf register */
 	if (!(info->flags & SHARE_MUX_CONF_REG))
-		return -EINVAL;
+		return 0;
 
 	pin_reg = &info->pin_regs[offset];
 	if (pin_reg->mux_reg == -1)
@@ -380,7 +380,7 @@ static int imx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	 * They are part of the shared mux/conf register.
 	 */
 	if (!(info->flags & SHARE_MUX_CONF_REG))
-		return -EINVAL;
+		return 0;
 
 	pin_reg = &info->pin_regs[offset];
 	if (pin_reg->mux_reg == -1)
-- 
2.8.1


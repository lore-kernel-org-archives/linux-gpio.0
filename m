From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] pinctrl: freescale: imx7d: make of_device_ids const.
Date: Tue, 27 Jun 2017 17:25:21 +0530
Message-ID: <d854989da39127f5008ad7332eae63a01631dab6.1498564430.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34572 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbdF0L4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jun 2017 07:56:10 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

of_device_ids are not supposed to change at runtime. All functions
working with of_device_ids provided by <linux/of.h> work with const
of_device_ids. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx7d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index a465a66..754159e 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -358,19 +358,19 @@ enum imx7d_lpsr_pads {
 	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO07),
 };
 
-static struct imx_pinctrl_soc_info imx7d_pinctrl_info = {
+static const struct imx_pinctrl_soc_info imx7d_pinctrl_info = {
 	.pins = imx7d_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx7d_pinctrl_pads),
 	.gpr_compatible = "fsl,imx7d-iomuxc-gpr",
 };
 
-static struct imx_pinctrl_soc_info imx7d_lpsr_pinctrl_info = {
+static const struct imx_pinctrl_soc_info imx7d_lpsr_pinctrl_info = {
 	.pins = imx7d_lpsr_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx7d_lpsr_pinctrl_pads),
 	.flags = ZERO_OFFSET_VALID,
 };
 
-static struct of_device_id imx7d_pinctrl_of_match[] = {
+static const struct of_device_id imx7d_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx7d-iomuxc", .data = &imx7d_pinctrl_info, },
 	{ .compatible = "fsl,imx7d-iomuxc-lpsr", .data = &imx7d_lpsr_pinctrl_info },
 	{ /* sentinel */ }
-- 
1.9.1


From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] pinctrl: imx: reset group index on probe
Date: Tue, 18 Oct 2016 14:09:15 -0700
Message-ID: <20161018210915.31614-1-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:47062 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933332AbcJRVJl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 17:09:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: shawnguo@kernel.org, vladimir_zapolskiy@mentor.com, mpa@pengutronix.de, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

Group index is incremented on every new group parsed. Since the
field is part of struct imx_pinctrl_soc_info, which is typically
a global variable passed by the individual pinctrl-imx.c based
driver, it does not get cleared automatically when re-probing the
driver. This lead imx_pinctrl_parse_functions passing a group
pointer which is outside of the allocated group space on second
probe and onwards. Typically this ended up in a NULL pointer
dereference when accessing the name field like this:
Unable to handle kernel NULL pointer dereference at virtual address 00000000
...
PC is at strcmp+0x18/0x44
LR is at imx_dt_node_to_map+0xc4/0x290

Avoid this by setting group_index to 0 on probe.

This has been observed when using DEBUG_TEST_DRIVER_REMOVE.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 4761320..79c4e14 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -687,6 +687,7 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!info->functions)
 		return -ENOMEM;
 
+	info->group_index = 0;
 	if (flat_funcs) {
 		info->ngroups = of_get_child_count(np);
 	} else {
-- 
2.10.0


From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] pinctrl: mxs: warn if functions are not grouped by name
Date: Tue, 21 Oct 2014 11:40:45 +0200
Message-ID: <1413884445-28347-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:47059 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbaJUJkz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 05:40:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de

The mxs pinctrl driver cannot handle when functions are not grouped by
name (which IMO is a bug). This happens for example if a
imx28-somemachine.dts provides a function that has the same name as a
function defined in imx28.dtsi.

The proper way to fix that would be to check for duplicates in the loop=
s
(which increases parsing time) or parse the groups first and sort the
resulting array.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
I tried to fix that, but it made my machine fail to boot without any
output and I currently don't have access to an i.MX28 with a working
debug UART, so I cannot use earlyprintk without effort.

I wrote this patch because I debugged this issue the second time now.

I admit that a fix would be better, but a warning is better as the
status quo. If someone is interested in a proper fix I can provide my
broken patch, maybe someone spots my error.

The current issue was with mac0 on an i.MX28 and I expected the fec
driver to fail to bind, but ethernet works just fine (relying on the
pinmuxing done by the bootloader).

Also something not catched is if for two functions with the same name,
the reg property is identical. This somehow breaks, too. Didn't debug
this one.

Best regards
Uwe
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/=
freescale/pinctrl-mxs.c
index f98c6bb0f769..646d5c244af1 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -445,6 +445,31 @@ static int mxs_pinctrl_probe_dt(struct platform_de=
vice *pdev,
 		if (of_property_read_u32(child, "reg", &val))
 			continue;
 		if (strcmp(fn, child->name)) {
+			struct device_node *child2;
+
+			/*
+			 * This reference is dropped by
+			 * of_get_next_child(np, * child)
+			 */
+			of_node_get(child);
+
+			/*
+			 * The logic parsing the functions from dt currently
+			 * doesn't handle if functions with the same name are
+			 * not grouped together. Only the first contiguous
+			 * cluster is usable for each function name. This is a
+			 * bug that is not trivial to fix, but at least warn
+			 * about it.
+			 */
+			for (child2 =3D of_get_next_child(np, child);
+			     child2 !=3D NULL;
+			     child2 =3D of_get_next_child(np, child2)) {
+				if (!strcmp(child2->name, fn))
+					dev_warn(&pdev->dev,
+						 "function nodes must be grouped by name (failed for: %s)",
+						 fn);
+			}
+
 			f =3D &soc->functions[idxf++];
 			f->name =3D fn =3D child->name;
 		}
--=20
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

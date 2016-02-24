From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 50/50] pinctrl: zynq: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:15 +0530
Message-ID: <1456319775-3216-51-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13907 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757997AbcBXNdW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 08:33:22 -0500
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>

Use devm_pinctrl_register() for pin control registration and
remove the need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/pinctrl-zynq.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-z=
ynq.c
index 76f1abd..5bbf94c0 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1195,7 +1195,7 @@ static int zynq_pinctrl_probe(struct platform_dev=
ice *pdev)
 	pctrl->funcs =3D zynq_pmux_functions;
 	pctrl->nfuncs =3D ARRAY_SIZE(zynq_pmux_functions);
=20
-	pctrl->pctrl =3D pinctrl_register(&zynq_desc, &pdev->dev, pctrl);
+	pctrl->pctrl =3D devm_pinctrl_register(&pdev->dev, &zynq_desc, pctrl)=
;
 	if (IS_ERR(pctrl->pctrl))
 		return PTR_ERR(pctrl->pctrl);
=20
@@ -1206,15 +1206,6 @@ static int zynq_pinctrl_probe(struct platform_de=
vice *pdev)
 	return 0;
 }
=20
-static int zynq_pinctrl_remove(struct platform_device *pdev)
-{
-	struct zynq_pinctrl *pctrl =3D platform_get_drvdata(pdev);
-
-	pinctrl_unregister(pctrl->pctrl);
-
-	return 0;
-}
-
 static const struct of_device_id zynq_pinctrl_of_match[] =3D {
 	{ .compatible =3D "xlnx,pinctrl-zynq" },
 	{ }
@@ -1227,7 +1218,6 @@ static struct platform_driver zynq_pinctrl_driver=
 =3D {
 		.of_match_table =3D zynq_pinctrl_of_match,
 	},
 	.probe =3D zynq_pinctrl_probe,
-	.remove =3D zynq_pinctrl_remove,
 };
=20
 static int __init zynq_pinctrl_init(void)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

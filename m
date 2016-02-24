From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 09/50] pinctrl: imx: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:45:34 +0530
Message-ID: <1456319775-3216-10-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Adrian Alonso <aalonso@freescale.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and remove
need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Adrian Alonso <aalonso@freescale.com>
Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/freescale/pinctrl-imx.c    | 11 +----------
 drivers/pinctrl/freescale/pinctrl-imx.h    |  1 -
 drivers/pinctrl/freescale/pinctrl-imx25.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx35.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx50.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx51.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx53.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx6dl.c |  1 -
 drivers/pinctrl/freescale/pinctrl-imx6q.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-imx6sl.c |  1 -
 drivers/pinctrl/freescale/pinctrl-imx6sx.c |  1 -
 drivers/pinctrl/freescale/pinctrl-imx6ul.c |  1 -
 drivers/pinctrl/freescale/pinctrl-imx7d.c  |  1 -
 drivers/pinctrl/freescale/pinctrl-vf610.c  |  1 -
 14 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/=
freescale/pinctrl-imx.c
index 4c435cf..c231874 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -780,7 +780,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	ipctl->info =3D info;
 	ipctl->dev =3D info->dev;
 	platform_set_drvdata(pdev, ipctl);
-	ipctl->pctl =3D pinctrl_register(&imx_pinctrl_desc, &pdev->dev, ipctl=
);
+	ipctl->pctl =3D devm_pinctrl_register(&pdev->dev, &imx_pinctrl_desc, =
ipctl);
 	if (IS_ERR(ipctl->pctl)) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
 		return PTR_ERR(ipctl->pctl);
@@ -790,12 +790,3 @@ int imx_pinctrl_probe(struct platform_device *pdev=
,
=20
 	return 0;
 }
-
-int imx_pinctrl_remove(struct platform_device *pdev)
-{
-	struct imx_pinctrl *ipctl =3D platform_get_drvdata(pdev);
-
-	pinctrl_unregister(ipctl->pctl);
-
-	return 0;
-}
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/=
freescale/pinctrl-imx.h
index 2a592f6..7bbb6ed 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -98,5 +98,4 @@ struct imx_pinctrl_soc_info {
=20
 int imx_pinctrl_probe(struct platform_device *pdev,
 			struct imx_pinctrl_soc_info *info);
-int imx_pinctrl_remove(struct platform_device *pdev);
 #endif /* __DRIVERS_PINCTRL_IMX_H */
diff --git a/drivers/pinctrl/freescale/pinctrl-imx25.c b/drivers/pinctr=
l/freescale/pinctrl-imx25.c
index 293ed43..81ad546 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx25.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx25.c
@@ -331,7 +331,6 @@ static struct platform_driver imx25_pinctrl_driver =
=3D {
 		.of_match_table =3D of_match_ptr(imx25_pinctrl_of_match),
 	},
 	.probe =3D imx25_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx25_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx35.c b/drivers/pinctr=
l/freescale/pinctrl-imx35.c
index 9109c10..13eb224 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx35.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx35.c
@@ -1021,7 +1021,6 @@ static struct platform_driver imx35_pinctrl_drive=
r =3D {
 		.of_match_table =3D imx35_pinctrl_of_match,
 	},
 	.probe =3D imx35_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx35_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx50.c b/drivers/pinctr=
l/freescale/pinctrl-imx50.c
index 51b31df..742c378 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx50.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx50.c
@@ -407,7 +407,6 @@ static struct platform_driver imx50_pinctrl_driver =
=3D {
 		.of_match_table =3D of_match_ptr(imx50_pinctrl_of_match),
 	},
 	.probe =3D imx50_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx50_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx51.c b/drivers/pinctr=
l/freescale/pinctrl-imx51.c
index 8dec494..0863e527 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx51.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx51.c
@@ -784,7 +784,6 @@ static struct platform_driver imx51_pinctrl_driver =
=3D {
 		.of_match_table =3D imx51_pinctrl_of_match,
 	},
 	.probe =3D imx51_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx51_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx53.c b/drivers/pinctr=
l/freescale/pinctrl-imx53.c
index 7344d34..898e387 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx53.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx53.c
@@ -470,7 +470,6 @@ static struct platform_driver imx53_pinctrl_driver =
=3D {
 		.of_match_table =3D imx53_pinctrl_of_match,
 	},
 	.probe =3D imx53_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx53_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6dl.c b/drivers/pinct=
rl/freescale/pinctrl-imx6dl.c
index 6805c67..d1bc3d9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6dl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6dl.c
@@ -476,7 +476,6 @@ static struct platform_driver imx6dl_pinctrl_driver=
 =3D {
 		.of_match_table =3D imx6dl_pinctrl_of_match,
 	},
 	.probe =3D imx6dl_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx6dl_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6q.c b/drivers/pinctr=
l/freescale/pinctrl-imx6q.c
index 4d1fcb8..b6d19fb 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6q.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6q.c
@@ -482,7 +482,6 @@ static struct platform_driver imx6q_pinctrl_driver =
=3D {
 		.of_match_table =3D imx6q_pinctrl_of_match,
 	},
 	.probe =3D imx6q_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx6q_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sl.c b/drivers/pinct=
rl/freescale/pinctrl-imx6sl.c
index 83fa5f1..b165a82 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
@@ -383,7 +383,6 @@ static struct platform_driver imx6sl_pinctrl_driver=
 =3D {
 		.of_match_table =3D imx6sl_pinctrl_of_match,
 	},
 	.probe =3D imx6sl_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx6sl_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sx.c b/drivers/pinct=
rl/freescale/pinctrl-imx6sx.c
index 0d78fe6..c66d37d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
@@ -386,7 +386,6 @@ static struct platform_driver imx6sx_pinctrl_driver=
 =3D {
 		.of_match_table =3D of_match_ptr(imx6sx_pinctrl_of_match),
 	},
 	.probe =3D imx6sx_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx6sx_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinct=
rl/freescale/pinctrl-imx6ul.c
index 08e7576..2bfd7e8 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -302,7 +302,6 @@ static struct platform_driver imx6ul_pinctrl_driver=
 =3D {
 		.of_match_table =3D of_match_ptr(imx6ul_pinctrl_of_match),
 	},
 	.probe =3D imx6ul_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx6ul_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctr=
l/freescale/pinctrl-imx7d.c
index 16dc925..ebb39a0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -394,7 +394,6 @@ static struct platform_driver imx7d_pinctrl_driver =
=3D {
 		.of_match_table =3D of_match_ptr(imx7d_pinctrl_of_match),
 	},
 	.probe =3D imx7d_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init imx7d_pinctrl_init(void)
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctr=
l/freescale/pinctrl-vf610.c
index 587d1ff..6d81be0 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -318,7 +318,6 @@ static struct platform_driver vf610_pinctrl_driver =
=3D {
 		.of_match_table =3D vf610_pinctrl_of_match,
 	},
 	.probe =3D vf610_pinctrl_probe,
-	.remove =3D imx_pinctrl_remove,
 };
=20
 static int __init vf610_pinctrl_init(void)
--=20
2.1.4

From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/6] pinctrl: mxs: Remove unneded semicolon
Date: Wed, 16 Sep 2015 10:28:28 +0200
Message-ID: <1442392111-8448-4-git-send-email-javier@osg.samsung.com>
References: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Wei Chen <Wei.Chen@csr.com>
List-Id: linux-gpio@vger.kernel.org

It's not needed an is just creating a null statement, so remove it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/pinctrl/freescale/pinctrl-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index f64eecb24755..6bbda6b4ab50 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -474,7 +474,7 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 			f->name = fn = child->name;
 		}
 		f->ngroups++;
-	};
+	}
 
 	/* Get groups for each function */
 	idxf = 0;
-- 
2.4.3

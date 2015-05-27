From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH 2/2] pinctrl: mediatek: Fix pinctrl register irq fail bug.
Date: Wed, 27 May 2015 02:43:55 -0700
Message-ID: <1432719835-18939-3-git-send-email-hongzhou.yang@mediatek.com>
References: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, eddie.huang@mediatek.com, dandan.he@mediatek.com
List-Id: linux-gpio@vger.kernel.org

Since mt6397 is no need to support interrupt controller,
I judged "interrupt-controller" property to skip it last patch.
But the if judgement should on the contrary, this is a bug.

And find of_property_read_bool is better for this case.
So using of_property_read_bool instead of of_find_property.

Also fix bug of misuse pointer.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index cd22729..f206a54 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1280,7 +1280,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto pctrl_error;
 	}
 
-	pctl->chip = &mtk_gpio_chip;
+	*pctl->chip = mtk_gpio_chip;
 	pctl->chip->ngpio = pctl->devdata->npins;
 	pctl->chip->label = dev_name(&pdev->dev);
 	pctl->chip->dev = &pdev->dev;
@@ -1300,7 +1300,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto chip_error;
 	}
 
-	if (of_find_property(np, "interrupt-controller", NULL))
+	if (!of_property_read_bool(np, "interrupt-controller"))
 		return 0;
 
 	/* Get EINT register base from dts. */
-- 
1.7.9.5

From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Add get_direction support.
Date: Fri, 13 Nov 2015 16:49:24 -0800
Message-ID: <1447462164-34639-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:35260 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752302AbbKNAtc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2015 19:49:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com

Since Linux gpio framework return 0 for output, 1 for input.
But HW use 0 stands for input, and 1 stands for output.
So use negative to correct it.

And gpio_chip.get is used to get input value, no need to get
output value, so removing it.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 Add get direction support.
 Remove gpio_chip.get value for output direction.

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 7726c6c..bbf0230 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -757,7 +757,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	reg_addr =  mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
 	bit = BIT(offset & 0xf);
 	regmap_read(pctl->regmap1, reg_addr, &read_val);
-	return !!(read_val & bit);
+	return !(read_val & bit);
 }
 
 static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -767,12 +767,8 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
 	unsigned int read_val = 0;
 	struct mtk_pinctrl *pctl = dev_get_drvdata(chip->dev);
 
-	if (mtk_gpio_get_direction(chip, offset))
-		reg_addr = mtk_get_port(pctl, offset) +
-			pctl->devdata->dout_offset;
-	else
-		reg_addr = mtk_get_port(pctl, offset) +
-			pctl->devdata->din_offset;
+	reg_addr = mtk_get_port(pctl, offset) +
+		pctl->devdata->din_offset;
 
 	bit = BIT(offset & 0xf);
 	regmap_read(pctl->regmap1, reg_addr, &read_val);
@@ -1007,6 +1003,7 @@ static struct gpio_chip mtk_gpio_chip = {
 	.owner			= THIS_MODULE,
 	.request		= mtk_gpio_request,
 	.free			= mtk_gpio_free,
+	.get_direction		= mtk_gpio_get_direction,
 	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
-- 
1.7.9.5


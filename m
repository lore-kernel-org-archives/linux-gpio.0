From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: fix a memleak when do dt maps.
Date: Mon, 16 Nov 2015 18:34:50 -0800
Message-ID: <1447727690-15251-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:60403 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751421AbbKQCfD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 21:35:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com

configs will kmemdup to dup_configs in pictrl util function.
So configs need to be freed.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 Fix a memleak issue.

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index bbf0230..0000b5a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -568,9 +568,10 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	return 0;
+	err = 0;
 
 fail:
+	kfree(configs);
 	return err;
 }
 
-- 
1.7.9.5


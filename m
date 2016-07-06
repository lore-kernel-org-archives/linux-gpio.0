From: weiyj_lk@163.com
Subject: [PATCH -next] sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
Date: Wed,  6 Jul 2016 12:03:32 +0000
Message-ID: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index d4e65bc..e208ee0 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -814,8 +814,5 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 	pmx->pctl_desc.npins = pfc->info->nr_pins;
 
 	pmx->pctl = devm_pinctrl_register(pfc->dev, &pmx->pctl_desc, pmx);
-	if (IS_ERR(pmx->pctl))
-		return PTR_ERR(pmx->pctl);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pmx->pctl);
 }

From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] pinctrl: mediatek: use builtin_platform_driver
Date: Fri, 18 Nov 2016 22:12:29 +0800
Message-ID: <70fcc58b7e9219a9fbe3695df927041b8234dd08.1479457060.git.geliangtang@gmail.com>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Use builtin_platform_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 6eccb85..afcede7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -64,8 +64,4 @@ static struct platform_driver mtk_pinctrl_driver = {
 	},
 };
 
-static int __init mtk_pinctrl_init(void)
-{
-	return platform_driver_register(&mtk_pinctrl_driver);
-}
-device_initcall(mtk_pinctrl_init);
+builtin_platform_driver(mtk_pinctrl_driver);
-- 
2.9.3

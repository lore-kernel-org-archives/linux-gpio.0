From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: gemini: Fix usage of 3512 groups
Date: Wed, 22 Nov 2017 21:04:14 +0100
Message-ID: <20171122200414.24874-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

The pin config lookup function was still hardcoding the
3516 pin set, which is obviously wrong. Use the pointer
in the state container.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index e9b83e291edf..c11b8f14d841 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -2322,7 +2322,7 @@ static const struct gemini_pin_conf *gemini_get_pin_conf(struct gemini_pmx *pmx,
 	int i;
 
 	for (i = 0; i < pmx->nconfs; i++) {
-		retconf = &gemini_confs_3516[i];
+		retconf = &pmx->confs[i];
 		if (retconf->pin == pin)
 			return retconf;
 	}
-- 
2.14.3

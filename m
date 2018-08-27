From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 05/16] pinctrl: mediatek: extend struct mtk_pin_soc to
 pinctrl-mtk-common-v2.c
Date: Mon, 27 Aug 2018 18:10:04 +0800
Message-ID: <d303a55d5962a38a97db0182521107d384cc98df.1535363951.git.sean.wang@mediatek.com>
References: <cover.1535363951.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1535363951.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Ryder.Lee" <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add two parameters gpio_m and eint_m for configuring GPIO mode and EINT
mode, they might be varying depend on SoC.

Signed-off-by: Ryder.Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index ba7511d..b412b65 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -63,7 +63,7 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 
-	return mtk_hw_set_value(hw, pin, PINCTRL_PIN_REG_MODE, MTK_GPIO_MODE);
+	return mtk_hw_set_value(hw, pin, PINCTRL_PIN_REG_MODE, hw->soc->gpio_m);
 }
 
 static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -580,7 +580,7 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
 		return err;
 
 	err = mtk_hw_set_value(hw, gpio_n, PINCTRL_PIN_REG_MODE,
-			       MTK_GPIO_MODE);
+			       hw->soc->eint_m);
 	if (err)
 		return err;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index a0045bb..2fe1f27e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -765,6 +765,8 @@ static const struct mtk_pin_soc mt7622_data = {
 	.funcs = mt7622_functions,
 	.nfuncs = ARRAY_SIZE(mt7622_functions),
 	.eint_hw = &mt7622_eint_hw,
+	.gpio_m	= 1,
+	.eint_m = 1,
 };
 
 static const struct of_device_id mt7622_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 174e75b..91b84b5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -9,7 +9,6 @@
 #ifndef __PINCTRL_MTK_COMMON_V2_H
 #define __PINCTRL_MTK_COMMON_V2_H
 
-#define MTK_GPIO_MODE  1
 #define MTK_INPUT      0
 #define MTK_OUTPUT     1
 #define MTK_DISABLE    0
@@ -142,6 +141,10 @@ struct mtk_pin_soc {
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;
+
+	/* Specific parameters per SoC */
+	u8				gpio_m;
+	u8				eint_m;
 };
 
 struct mtk_pinctrl {
-- 
2.7.4

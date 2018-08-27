From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 07/16] pinctrl: mediatek: add drv register support to
 pinctrl-mtk-common-v2.c
Date: Mon, 27 Aug 2018 18:10:06 +0800
Message-ID: <d8f028d29de497b2a51c24c2392b5a057d9f3ae9.1535363951.git.sean.wang@mediatek.com>
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

Certain SoCs have to program DRV register to configure driving
strength so that we add it in the existing path as an option.

Signed-off-by: Ryder.Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 38 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 ++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 886b40e..3f09179 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -242,3 +242,41 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+
+/* Revision 1 */
+int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg)
+{
+	const struct mtk_drive_desc *tb;
+	int err = -ENOTSUPP;
+
+	tb = &mtk_drive[desc->drv_n];
+
+	if ((arg >= tb->min && arg <= tb->max) && !(arg % tb->step)) {
+		arg = (arg / tb->step - 1) * tb->scal;
+
+		err = mtk_hw_set_value(hw, desc->number, PINCTRL_PIN_REG_DRV,
+				       arg);
+		if (err)
+			return err;
+	}
+
+	return err;
+}
+
+int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val)
+{
+	const struct mtk_drive_desc *tb;
+	int err, val1;
+
+	tb = &mtk_drive[desc->drv_n];
+
+	err = mtk_hw_get_value(hw, desc->number, PINCTRL_PIN_REG_DRV, &val1);
+	if (err)
+		return err;
+
+	*val = ((val1 & 0x7) / tb->scal + 1) * tb->step;
+
+	return 0;
+}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 9c37f97..c031818 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -175,4 +175,9 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 			  const struct mtk_pin_desc *desc, int *val);
 
+int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val);
+
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
-- 
2.7.4

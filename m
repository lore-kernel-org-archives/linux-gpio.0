From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 1/2] pinctrl: mediatek: Add pm_ops to pinctrl-paris
Date: Wed,  8 May 2019 15:33:30 +0800
Message-ID: <20190508073331.27475-2-drinkcat@chromium.org>
References: <20190508073331.27475-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

pinctrl variants that include pinctrl-paris.h (and not
pinctrl-mtk-common.h) also need to use pm_ops to setup
wake mask properly, so copy over the pm_ops from common
to paris variant.

It is not easy to merge the 2 copies (or move
mtk_eint_suspend/resume to mtk-eint.c), as we need to
dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
different structure definition for v1 and v2 (which is
what paris variant uses).

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 +++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d3b34e9a7507ec6..923264d0e9ef2c5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -926,3 +926,22 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+static int mtk_paris_pinctrl_suspend(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_suspend(pctl->eint);
+}
+
+static int mtk_paris_pinctrl_resume(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_resume(pctl->eint);
+}
+
+const struct dev_pm_ops mtk_paris_pinctrl_pm_ops = {
+	.suspend_noirq = mtk_paris_pinctrl_suspend,
+	.resume_noirq = mtk_paris_pinctrl_resume,
+};
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 37146caa667d8c8..3d43771074e6de0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -60,4 +60,6 @@
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
+extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
+
 #endif /* __PINCTRL_PARIS_H */
-- 
2.21.0.1020.gf2820cf01a-goog

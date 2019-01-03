From: <chuanjia.liu@mediatek.com>
Subject: [PATCH v5] pinctrl: mediatek: add EINT support to virtual GPIOs
Date: Thu, 3 Jan 2019 11:37:15 +0800
Message-ID: <1546486635-16829-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: youlin.pei@mediatek.com, zhiyong.tao@mediatek.com, eddie.huang@mediatek.com, hailong.fan@mediatek.com, "chuanjia.liu" <Chuanjia.Liu@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

From: "chuanjia.liu" <Chuanjia.Liu@mediatek.com>

Virtual gpio only used inside SOC and not being exported to outside SOC.
Some modules use virtual gpio as eint and doesn't need SMT.
So this patch add EINT support to virtual GPIOs.

Signed-off-by: chuanjia.liu <Chuanjia.Liu@mediatek.com>
---
change note:
v5: This patch is the same as v4,re-upload due to
      mail permissions issues	 
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4a9e0d4c2bbc..b1c368455d30 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -290,7 +290,13 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
 		return err;
 
 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
-	if (err)
+	/* SMT is supposed to be supported by every real GPIO and doesn't
+	 * support virtual GPIOs, so the extra condition err != -ENOTSUPP
+	 * is just for adding EINT support to these virtual GPIOs. It should
+	 * add an extra flag in the pin descriptor when more pins with
+	 * distinctive characteristic come out.
+	 */
+	if (err && err != -ENOTSUPP)
 		return err;
 
 	return 0;
-- 
2.19.1

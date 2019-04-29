From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 1/2] pinctrl: mediatek: Ignore interrupts that are wake only during resume
Date: Mon, 29 Apr 2019 11:55:14 +0800
Message-ID: <20190429035515.73611-2-drinkcat@chromium.org>
References: <20190429035515.73611-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429035515.73611-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

Before suspending, mtk-eint would set the interrupt mask to the
one in wake_mask. However, some of these interrupts may not have a
corresponding interrupt handler, or the interrupt may be disabled.

On resume, the eint irq handler would trigger nevertheless,
and irq/pm.c:irq_pm_check_wakeup would be called, which would
try to call irq_disable. However, if the interrupt is not enabled
(irqd_irq_disabled(&desc->irq_data) is true), the call does nothing,
and the interrupt is left enabled in the eint driver.

Especially for level-sensitive interrupts, this will lead to an
interrupt storm on resume.

If we detect that an interrupt is only in wake_mask, but not in
cur_mask, we can just mask it out immediately (as mtk_eint_resume
would do anyway at a later stage in the resume sequence, when
restoring cur_mask).

Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index f464f8cd274b75c..737385e86beb807 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -318,7 +318,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
 	unsigned int status, eint_num;
-	int offset, index, virq;
+	int offset, mask_offset, index, virq;
 	void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
 	int dual_edge, start_level, curr_level;
 
@@ -328,10 +328,24 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 		status = readl(reg);
 		while (status) {
 			offset = __ffs(status);
+			mask_offset = eint_num >> 5;
 			index = eint_num + offset;
 			virq = irq_find_mapping(eint->domain, index);
 			status &= ~BIT(offset);
 
+			/*
+			 * If we get an interrupt on pin that was only required
+			 * for wake (but no real interrupt requested), mask the
+			 * interrupt (as would mtk_eint_resume do anyway later
+			 * in the resume sequence).
+			 */
+			if (eint->wake_mask[mask_offset] & BIT(offset) &&
+			    !(eint->cur_mask[mask_offset] & BIT(offset))) {
+				writel_relaxed(BIT(offset), reg -
+					eint->regs->stat +
+					eint->regs->mask_set);
+			}
+
 			dual_edge = eint->dual_edge[index];
 			if (dual_edge) {
 				/*
-- 
2.21.0.593.g511ec345e18-goog

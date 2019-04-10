From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] gpio: eic: sprd: Fix incorrect irq type setting for the sync EIC
Date: Wed, 10 Apr 2019 15:47:54 +0800
Message-ID: <e7ca1df3b3159d6e1c65c6a2a9f01a7ecabcc821.1554882235.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When setting sync EIC as IRQ_TYPE_EDGE_BOTH type, we missed to set the
SPRD_EIC_SYNC_INTMODE register to 0, which means detecting edge signals.

Thus this patch fixes the issue.

Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index f0223ce..7709226 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -414,6 +414,7 @@ static int sprd_eic_irq_set_type(struct irq_data *data, unsigned int flow_type)
 			irq_set_handler_locked(data, handle_edge_irq);
 			break;
 		case IRQ_TYPE_EDGE_BOTH:
+			sprd_eic_update(chip, offset, SPRD_EIC_SYNC_INTMODE, 0);
 			sprd_eic_update(chip, offset, SPRD_EIC_SYNC_INTBOTH, 1);
 			irq_set_handler_locked(data, handle_edge_irq);
 			break;
-- 
1.7.9.5

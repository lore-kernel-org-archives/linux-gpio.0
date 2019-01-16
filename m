From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 2/2] gpio: sprd: Fix incorrect irq type setting for the async EIC
Date: Wed, 16 Jan 2019 13:06:14 +0800
Message-ID: <46524f86b327de62753be9046ef217a66d674b33.1547615070.git.baolin.wang@linaro.org>
References: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
In-Reply-To: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
References: <24594f8799f6aabdeaad3935fe36d832fb465148.1547615070.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, neo.hou@unisoc.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Neo Hou <neo.hou@unisoc.com>

When setting async EIC as IRQ_TYPE_EDGE_BOTH type, we missed to set the
SPRD_EIC_ASYNC_INTMODE register to 0, which means detecting edge signals.

Thus this patch fixes the issue.

Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Neo Hou <neo.hou@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - Add fix tag and CC stable.
---
 drivers/gpio/gpio-eic-sprd.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index 257df59..e41223c 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -379,6 +379,7 @@ static int sprd_eic_irq_set_type(struct irq_data *data, unsigned int flow_type)
 			irq_set_handler_locked(data, handle_edge_irq);
 			break;
 		case IRQ_TYPE_EDGE_BOTH:
+			sprd_eic_update(chip, offset, SPRD_EIC_ASYNC_INTMODE, 0);
 			sprd_eic_update(chip, offset, SPRD_EIC_ASYNC_INTBOTH, 1);
 			irq_set_handler_locked(data, handle_edge_irq);
 			break;
-- 
1.7.9.5

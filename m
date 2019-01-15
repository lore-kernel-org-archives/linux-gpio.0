From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/2] gpio: sprd: Fix incorrect irq type setting for the async EIC
Date: Tue, 15 Jan 2019 15:52:59 +0800
Message-ID: <3dd0a29b2f42d41ddfa5b30b68926eb58ebfc3a9.1547538574.git.baolin.wang@linaro.org>
References: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
In-Reply-To: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
References: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc: baolin.wang@linaro.org, neo.hou@unisoc.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Neo Hou <neo.hou@unisoc.com>

When setting async EIC as IRQ_TYPE_EDGE_BOTH type, we missed to set the
SPRD_EIC_ASYNC_INTMODE register to 0, which means detecting edge signals.

Thus this patch fixes the issue.

Signed-off-by: Neo Hou <neo.hou@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
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

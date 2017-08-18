From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 1/7] genirq: Export more irq_chip_*_parent() functions.
Date: Thu, 17 Aug 2017 17:53:30 -0700
Message-ID: <1503017616-3252-2-git-send-email-david.daney@cavium.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: linux-gpio@vger.kernel.org

Many of the family of functions including irq_chip_mask_parent(),
irq_chip_unmask_parent() are exported, but not all.

Add EXPORT_SYMBOL_GPL to irq_chip_enable_parent,
irq_chip_disable_parent and irq_chip_set_affinity_parent, so they
likewise are usable from modules.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 kernel/irq/chip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a3cc37c..6514f07 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1105,6 +1105,7 @@ void irq_chip_enable_parent(struct irq_data *data)
 	else
 		data->chip->irq_unmask(data);
 }
+EXPORT_SYMBOL_GPL(irq_chip_enable_parent);
 
 /**
  * irq_chip_disable_parent - Disable the parent interrupt (defaults to mask if
@@ -1119,6 +1120,7 @@ void irq_chip_disable_parent(struct irq_data *data)
 	else
 		data->chip->irq_mask(data);
 }
+EXPORT_SYMBOL_GPL(irq_chip_disable_parent);
 
 /**
  * irq_chip_ack_parent - Acknowledge the parent interrupt
@@ -1181,6 +1183,7 @@ int irq_chip_set_affinity_parent(struct irq_data *data,
 
 	return -ENOSYS;
 }
+EXPORT_SYMBOL_GPL(irq_chip_set_affinity_parent);
 
 /**
  * irq_chip_set_type_parent - Set IRQ type on the parent interrupt
-- 
1.8.3.1

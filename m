From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next 1/2] genirq: export irq_chip_set_wake_parent symbol
Date: Sun,  3 Feb 2019 07:31:30 -0500
Message-ID: <20190203123131.28323-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, tglx@linutronix.de, marc.zyngier@arm.com
Cc: andy.gross@linaro.org, sboyd@kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Export the irq_chip_set_wake_parent symbol so that drivers with
hierarchical IRQ chips can be built as a module.

This fixes a build failure in linux-next's spmi-gpio when using
allmodconfig.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reported-by: Mark Brown <broonie@kernel.org>
---
See https://www.spinics.net/lists/linux-next/msg46362.html for Mark's
message.

 kernel/irq/chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 34e969069488..086d5a34b5a0 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1381,6 +1381,7 @@ int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
 
 	return -ENOSYS;
 }
+EXPORT_SYMBOL_GPL(irq_chip_set_wake_parent);
 #endif
 
 /**
-- 
2.17.2

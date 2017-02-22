From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH v2] gpio: pl061: use all specified IRQs for chained handler
Date: Wed, 22 Feb 2017 13:30:49 +0100
Message-ID: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr00110.outbound.protection.outlook.com ([40.107.0.110]:28177
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932358AbdBVMbt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Feb 2017 07:31:49 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, =?UTF-8?q?S=C5=82awomir=20St=C4=99pie=C5=84?= <slawomir.stepien@nokia.com>

There are several implementations of PL061 which lack GPIOINTR signal in
hardware and only have individual GPIOMIS[7:0] interrupts. It's possible
to support these variants with minimal changes to the driver just
requesting all these IRQs for the same chained handler. While the solution
seems to be suboptimal, this is just a quirk for some particular IPs.

Power Management (wakeup) is not expected to work with these IPs. Only the
basic GPIO functionality.

One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, pl061 instances have
8 IRQs defined, but current driver supports only the first one, so only one
pin would work as IRQ trigger.

Reported-by: Sławomir Stępień <slawomir.stepien@nokia.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: Sławomir Stępień <slawomir.stepien@nokia.com>
---
Changes since v1:
- Added AMBA_NR_IRQS loop limit

 drivers/gpio/gpio-pl061.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 0a6bfd2b06e5..0e5205a9a924 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -343,8 +343,15 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		dev_info(&adev->dev, "could not add irqchip\n");
 		return ret;
 	}
-	gpiochip_set_chained_irqchip(&pl061->gc, &pl061_irqchip,
-				     irq, pl061_irq_handler);
+
+	/*
+	 * There are some PL061 implementations which lack GPIOINTR in hardware
+	 * and only have individual GPIOMIS[7:0] signals. The loop below will
+	 * work for both cases, depending on the device tree.
+	 */
+	for (i = 0; adev->irq[i] && (i < AMBA_NR_IRQS); i++)
+		gpiochip_set_chained_irqchip(&pl061->gc, &pl061_irqchip,
+					     adev->irq[i], pl061_irq_handler);
 
 	amba_set_drvdata(adev, pl061);
 	dev_info(&adev->dev, "PL061 GPIO chip @%pa registered\n",
-- 
2.11.0


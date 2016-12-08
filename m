From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] gpio: rcar: set IRQ chip parent_device
Date: Thu,  8 Dec 2016 18:32:27 +0100
Message-ID: <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:36149 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751088AbcLHRdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2016 12:33:20 -0500
In-Reply-To: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

This enables Runtime PM handling for interrupts.

By setting the parent_device in struct irq_chip genirq will call the
pm_runtime_get/put APIs when an IRQ is requested/freed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/gpio/gpio-rcar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 2be48f5..3b77c10 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -460,6 +460,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 
 	irq_chip = &p->irq_chip;
 	irq_chip->name = name;
+	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = gpio_rcar_irq_disable;
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
 	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
-- 
2.10.2


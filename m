From: Aaron Lu <aaron.lu@intel.com>
Subject: [PATCH] gpio/crystalcove: set IRQCHIP_SKIP_SET_WAKE for the irqchip
Date: Thu, 28 May 2015 10:58:49 +0800
Message-ID: <20150528025848.GA11051@aaronlu.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:31141 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbbE1C5l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 27 May 2015 22:57:41 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhu, Lejun" <lejun.zhu@linux.intel.com>, "Yang, Bin" <bin.yang@intel.com>

The CrystalCove GPIO irqchip doesn't have irq_set_wake callback defined
so we should set IRQCHIP_SKIP_SET_WAKE for it or it would cause an irq
desc's wake_depth unbalanced warning during system resume phase from the
gpio_keys driver, which is the driver for the power button of the ASUS
T100 laptop.

Signed-off-by: Aaron Lu <aaron.lu@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpio/gpio-crystalcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 91a7ffe83135..ab457fc00e75 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -255,6 +255,7 @@ static struct irq_chip crystalcove_irqchip = {
 	.irq_set_type		= crystalcove_irq_type,
 	.irq_bus_lock		= crystalcove_bus_lock,
 	.irq_bus_sync_unlock	= crystalcove_bus_sync_unlock,
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
 };
 
 static irqreturn_t crystalcove_gpio_irq_handler(int irq, void *data)
-- 
2.4.1


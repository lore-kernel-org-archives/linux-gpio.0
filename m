From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 20/22] pinctrl/qcom/msm: Prepare msm_gpio_irq_handler for irq
 argument removal
Date: Mon, 13 Jul 2015 20:48:04 -0000
Message-ID: <20150713072815.982052550@linutronix.de>
References: <20150713072703.919712512@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56174 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754159AbbGMUsM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:48:12 -0400
Content-Disposition: inline;
 filename=pinctrl-qcom-msm-prepare-msm_gpio_irq_handler-for-irq-argument-removal.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Julia Lawall <Julia.Lawall@lip6.fr>

The irq argument of most interrupt flow handlers is unused or merily
used instead of a local variable. The handlers which need the irq
argument can retrieve the irq number from the irq descriptor.

Search and update was done with coccinelle and the invaluable help of
Julia Lawall.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/qcom/pinctrl-msm.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: tip/drivers/pinctrl/qcom/pinctrl-msm.c
===================================================================
--- tip.orig/drivers/pinctrl/qcom/pinctrl-msm.c
+++ tip/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -764,8 +764,9 @@ static struct irq_chip msm_gpio_irq_chip
 	.irq_set_wake   = msm_gpio_irq_set_wake,
 };
 
-static void msm_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+static void msm_gpio_irq_handler(unsigned int __irq, struct irq_desc *desc)
 {
+	unsigned int irq = irq_desc_get_irq(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	const struct msm_pingroup *g;
 	struct msm_pinctrl *pctrl = to_msm_pinctrl(gc);



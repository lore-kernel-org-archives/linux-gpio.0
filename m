From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl-adi2: Use a signed return type for
 adi_gpio_irq_startup()
Date: Sat, 19 Dec 2015 18:00:36 +0100
Message-ID: <56758D34.2070806@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:65186 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933273AbbLSRAl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 19 Dec 2015 12:00:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 17:55:39 +0100

The return type "unsigned int" was used by the adi_gpio_irq_startup()
function despite of the aspect that it will eventually return a negative
error code.
Improve this implementation detail by deletion of the type modifier then.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-adi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index fd342df..4032004 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -329,7 +329,7 @@ static void adi_gpio_unmask_irq(struct irq_data *d)
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
-static unsigned int adi_gpio_irq_startup(struct irq_data *d)
+static int adi_gpio_irq_startup(struct irq_data *d)
 {
 	unsigned long flags;
 	struct gpio_port *port = irq_data_get_irq_chip_data(d);
-- 
2.6.3


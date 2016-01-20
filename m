From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idi-48: Allow IRQ sharing
Date: Wed, 20 Jan 2016 13:57:31 -0500
Message-ID: <20160120185731.GA10340@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:34948 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754772AbcATS5i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 13:57:38 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The ACCES 104-IDI-48 can differentiate between its own and other
devices' interrupt requests. Therefore, IRQ sharing is possible and
should be permitted.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idi-48.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 52eed32..285a075 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -267,7 +267,8 @@ static int __init idi_48_probe(struct platform_device *pdev)
 		goto err_gpiochip_irqchip_add;
 	}
 
-	err = request_irq(irq, idi_48_irq_handler, 0, name, idi48gpio);
+	err = request_irq(irq, idi_48_irq_handler, IRQF_SHARED, name,
+		idi48gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
 		goto err_request_irq;
-- 
2.4.10


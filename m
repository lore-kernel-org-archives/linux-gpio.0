From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: grgpio: Avoid potential NULL pointer dereference
Date: Sat, 20 Dec 2014 22:47:07 +0800
Message-ID: <1419086827.20365.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:37107 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752463AbaLTOrM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Dec 2014 09:47:12 -0500
Received: by mail-pd0-f171.google.com with SMTP id y13so3037558pdi.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Dec 2014 06:47:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andreas Larsson <andreas@gaisler.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

irqmap is optional property, so priv->domain can be NULL if !irqmap.
Thus add NULL test for priv->domain before calling irq_domain_remove()
to prevent NULL pointer dereference.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-grgpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 09daaf2..3a5a710 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -441,7 +441,8 @@ static int grgpio_probe(struct platform_device *ofdev)
 	err = gpiochip_add(gc);
 	if (err) {
 		dev_err(&ofdev->dev, "Could not add gpiochip\n");
-		irq_domain_remove(priv->domain);
+		if (priv->domain)
+			irq_domain_remove(priv->domain);
 		return err;
 	}
 
-- 
1.9.1




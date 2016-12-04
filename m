From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH] pinctrl: pinctrl-sx150x.c: Fix typo in a previous patch
Date: Sun,  4 Dec 2016 23:01:08 +0100
Message-ID: <1480888868-23331-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:39849 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750979AbcLDWBi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 4 Dec 2016 17:01:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>

Fix typo of chip-irq to chip->irq.

Fixes: abbb5af1166f ("pinctrl: sx150x: use new nested IRQ infrastructure")
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
y# Please enter the commit message for your changes. Lines starting
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index b81275dbb4a8..29fb7403d24e 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1239,7 +1239,7 @@ static int sx150x_probe(struct i2c_client *client,
 
 		gpiochip_set_nested_irqchip(&pctl->gpio,
 					    &pctl->irq_chip,
-					    client-irq);
+					    client->irq);
 	}
 
 	/* Pinctrl_desc */
-- 
2.10.2


From: George Cherian <george.cherian@ti.com>
Subject: [PATCH 2/2] gpio: pcf857x: Add IRQF_SHARED when request irq
Date: Fri, 23 May 2014 11:27:27 +0530
Message-ID: <1400824647-2525-2-git-send-email-george.cherian@ti.com>
References: <1400824647-2525-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400824647-2525-1-git-send-email-george.cherian@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, kuninori.morimoto.gx@renesas.com, George Cherian <george.cherian@ti.com>
List-Id: linux-gpio@vger.kernel.org

It's quite possible that multiple pcf857x can be hooked up
to the same interrupt line with the processor. So add IRQF_SHARED
in request irq..

Signed-off-by: George Cherian <george.cherian@ti.com>
---
 drivers/gpio/gpio-pcf857x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 5acffed..27b4675 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -262,7 +262,7 @@ static int pcf857x_irq_domain_init(struct pcf857x *gpio,
 	/* enable real irq */
 	status = devm_request_threaded_irq(&client->dev, client->irq,
 				NULL, pcf857x_irq, IRQF_ONESHOT |
-				IRQF_TRIGGER_FALLING,
+				IRQF_TRIGGER_FALLING | IRQF_SHARED,
 				dev_name(&client->dev), gpio);
 
 	if (status)
-- 
1.8.3.1

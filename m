From: Semen Protsenko <semen.protsenko@globallogic.com>
Subject: [PATCH] gpio: max732x: Add IRQF_SHARED to irq flags
Date: Tue, 21 Apr 2015 16:19:04 +0300
Message-ID: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It's possible that multiple MAX732X can be hooked up to the same
interrupt line with the processor. So add IRQF_SHARED in requesting irq.

Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>
---
 drivers/gpio/gpio-max732x.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 0fa4543..55b13d4 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -507,12 +507,10 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		chip->irq_features = has_irq;
 		mutex_init(&chip->irq_lock);
 
-		ret = devm_request_threaded_irq(&client->dev,
-					client->irq,
-					NULL,
-					max732x_irq_handler,
-					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					dev_name(&client->dev), chip);
+		ret = devm_request_threaded_irq(&client->dev, client->irq,
+				NULL, max732x_irq_handler, IRQF_ONESHOT |
+				IRQF_TRIGGER_FALLING | IRQF_SHARED,
+				dev_name(&client->dev), chip);
 		if (ret) {
 			dev_err(&client->dev, "failed to request irq %d\n",
 				client->irq);
-- 
1.7.9.5

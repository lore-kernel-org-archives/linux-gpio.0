From: Semen Protsenko <semen.protsenko@globallogic.com>
Subject: [PATCH 1/2] gpio: max732x: Propagate wake-up setting to parent irq controller
Date: Tue, 21 Apr 2015 20:27:37 +0300
Message-ID: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og123.obsmtp.com ([64.18.0.198]:40865 "EHLO
	exprod5og123.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755264AbbDUR2Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 13:28:25 -0400
Received: by lbbqq2 with SMTP id qq2so161101427lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2015 10:28:23 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Set .irq_set_wake callback to prevent possible issues on wake-up.

This patch was inspired by this commit:
b80eef95beb04760629822fa130aeed54cdfafca

Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>
---
 drivers/gpio/gpio-max732x.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 0fa4543..1885e5c 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -429,6 +429,14 @@ static int max732x_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static int max732x_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct max732x_chip *chip = irq_data_get_irq_chip_data(data);
+
+	irq_set_irq_wake(chip->client->irq, on);
+	return 0;
+}
+
 static struct irq_chip max732x_irq_chip = {
 	.name			= "max732x",
 	.irq_mask		= max732x_irq_mask,
@@ -436,6 +444,7 @@ static struct irq_chip max732x_irq_chip = {
 	.irq_bus_lock		= max732x_irq_bus_lock,
 	.irq_bus_sync_unlock	= max732x_irq_bus_sync_unlock,
 	.irq_set_type		= max732x_irq_set_type,
+	.irq_set_wake		= max732x_irq_set_wake,
 };
 
 static uint8_t max732x_irq_pending(struct max732x_chip *chip)
-- 
1.7.9.5


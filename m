From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 4/7] gpio: brcmstb: correct the configuration of level interrupts
Date: Fri, 29 Sep 2017 20:40:54 -0700
Message-ID: <20170930034057.15166-5-opendmb@gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:52734 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752792AbdI3Dlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2017 23:41:50 -0400
In-Reply-To: <20170930034057.15166-1-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This commit corrects a bug when configuring the GPIO hardware for
IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH interrupt types. The
hardware is now correctly configured to support those types.

Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index c186141927bb..0418cb266586 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -137,13 +137,13 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	switch (type) {
 	case IRQ_TYPE_LEVEL_LOW:
-		level = 0;
+		level = mask;
 		edge_config = 0;
 		edge_insensitive = 0;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		level = mask;
-		edge_config = 0;
+		edge_config = mask;
 		edge_insensitive = 0;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-- 
2.14.1


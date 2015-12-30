From: Geliang Tang <geliangtang@163.com>
Subject: [PATCH 2/2] gpio: davinci: use irq_data_get_chip_type
Date: Wed, 30 Dec 2015 22:16:38 +0800
Message-ID: <ca4c79f0383786097cf59da27432eb619325002b.1451484758.git.geliangtang@163.com>
References: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m50-133.163.com ([123.125.50.133]:41305 "EHLO m50-133.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbbL3ORe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Dec 2015 09:17:34 -0500
In-Reply-To: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
In-Reply-To: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
References: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Geliang Tang <geliangtang@163.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Use irq_data_get_chip_type() instead of container_of().

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 drivers/gpio/gpio-davinci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 65ebaef..aaa1a249 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -435,8 +435,7 @@ static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
 {
 	static struct irq_chip_type gpio_unbanked;
 
-	gpio_unbanked = *container_of(irq_get_chip(irq),
-				      struct irq_chip_type, chip);
+	gpio_unbanked = *irq_data_get_chip_type(irq_get_irq_data(irq));
 
 	return &gpio_unbanked.chip;
 };
-- 
2.5.0



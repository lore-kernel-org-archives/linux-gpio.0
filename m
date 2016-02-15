From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: tps65218: Make tps65218_gpio_output set proper
 output level
Date: Mon, 15 Feb 2016 20:10:40 +0800
Message-ID: <1455538240.9793.4.camel@ingics.com>
References: <1455538154.9793.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:33555 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbcBOMKo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 07:10:44 -0500
Received: by mail-pf0-f178.google.com with SMTP id q63so86744146pfb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 04:10:44 -0800 (PST)
In-Reply-To: <1455538154.9793.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The .direction_output callback should set proper output level.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tps65218.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 7b02f7b..a308a0b 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -59,6 +59,7 @@ static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
 	/* Only drives GPOs */
+	tps65218_gpio_set(gc, offset, value);
 	return 0;
 }
 
-- 
2.1.4




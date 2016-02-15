From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: tpic2810: Make tpic2810_direction_output set
 proper output level
Date: Mon, 15 Feb 2016 20:09:14 +0800
Message-ID: <1455538154.9793.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:36628 "EHLO
	mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086AbcBOMJT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 07:09:19 -0500
Received: by mail-pf0-f170.google.com with SMTP id e127so86841738pfe.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 04:09:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The .direction_output callback should set proper output level.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tpic2810.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 032d058..9f020aa 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -33,6 +33,8 @@ struct tpic2810 {
 	struct mutex lock;
 };
 
+static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value);
+
 static int tpic2810_get_direction(struct gpio_chip *chip,
 				  unsigned offset)
 {
@@ -51,6 +53,7 @@ static int tpic2810_direction_output(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	/* This device always output */
+	tpic2810_set(chip, offset, value);
 	return 0;
 }
 
-- 
2.1.4




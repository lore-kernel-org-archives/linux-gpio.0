From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] [NEXT] gpiolib: make lineevent_irq_thread static
Date: Fri, 17 Jun 2016 16:03:13 +0100
Message-ID: <1466175793-19006-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:38226 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751103AbcFQPDa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jun 2016 11:03:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The lineevent_irq_thread is not exported, so make it static
to fix the following warning:

drivers/gpio/gpiolib.c:654:13: warning: symbol 'lineevent_irq_thread' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8b3db59..7f32fc8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -651,7 +651,7 @@ static const struct file_operations lineevent_fileops = {
 #endif
 };
 
-irqreturn_t lineevent_irq_thread(int irq, void *p)
+static irqreturn_t lineevent_irq_thread(int irq, void *p)
 {
 	struct lineevent_state *le = p;
 	struct gpioevent_data ge;
-- 
2.8.1


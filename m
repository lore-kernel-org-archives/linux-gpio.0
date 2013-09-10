From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/7] ptp: switch to use gpiolib
Date: Tue, 10 Sep 2013 14:31:00 +0200
Message-ID: <1378816260-8091-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:58470 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab3IJMbH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 08:31:07 -0400
Received: by mail-la0-f47.google.com with SMTP id eo20so6037679lab.20
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2013 05:31:06 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Richard Cochran <richardcochran@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, netdev@vger.kernel.org

This platform supports gpiolib, so remove the custom API use
and replace with calls to gpiolib. Also request the GPIO before
starting to use it.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi Richard, I'm seeking an ACK on this patch to take it throug
the GPIO tree as part of a clean-out of custom GPIO implementations.
---
 drivers/ptp/ptp_ixp46x.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ixp46x.c b/drivers/ptp/ptp_ixp46x.c
index d49b851..4a08727 100644
--- a/drivers/ptp/ptp_ixp46x.c
+++ b/drivers/ptp/ptp_ixp46x.c
@@ -259,8 +259,15 @@ static struct ixp_clock ixp_clock;
 static int setup_interrupt(int gpio)
 {
 	int irq;
+	int err;
 
-	gpio_line_config(gpio, IXP4XX_GPIO_IN);
+	err = gpio_request(gpio, "ixp4-ptp");
+	if (err)
+		return err;
+
+	err = gpio_direction_input(gpio);
+	if (err)
+		return err;
 
 	irq = gpio_to_irq(gpio);
 
-- 
1.8.3.1


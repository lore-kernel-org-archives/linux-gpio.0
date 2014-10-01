From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: [PATCH] gpio: amd8111: unmap ioport on failure case
Date: Wed,  1 Oct 2014 15:33:00 +0530
Message-ID: <1412157780-32219-1-git-send-email-pramod.gurav@smartplayin.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp74.ord1c.emailsrvr.com ([108.166.43.74]:53366 "EHLO
	smtp74.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751053AbaJAJ73 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Oct 2014 05:59:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This change unmaps ioport when gpiochip_add fails

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
---
 drivers/gpio/gpio-amd8111.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 3c09f1a6..d3d2d10 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -223,6 +223,7 @@ found:
 	if (err) {
 		printk(KERN_ERR "GPIO registering failed (%d)\n",
 		       err);
+		ioport_unmap(gp.pm);
 		release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 		goto out;
 	}
-- 
1.7.9.5


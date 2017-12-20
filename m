From: venkat.prashanth2498@gmail.com
Subject: [PATCH] Drivers: GPIO: Fix printk() warning style
Date: Wed, 20 Dec 2017 17:46:53 +0530
Message-ID: <1513772213-30026-1-git-send-email-venkat.prashanth2498@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35726 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754785AbdLTMRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 07:17:06 -0500
Received: by mail-pf0-f194.google.com with SMTP id j124so12494018pfc.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 04:17:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, Venkat Prashanth B U <venkat.prashanth2498@gmail.com>

From: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>

Replace printk(KERN_INFO...) by pr_info for more uniform reporting
of debug information. Issue found by checkpatch.

Signed-off-by: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>
---
 drivers/gpio/gpio-amd8111.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index d00d819..4d72300 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -224,10 +224,10 @@ found:

 	spin_lock_init(&gp.lock);

-	printk(KERN_INFO "AMD-8111 GPIO detected\n");
+	pr_info("AMD-8111 GPIO detected\n");
 	err = gpiochip_add(&gp.chip);
 	if (err) {
-		printk(KERN_ERR "GPIO registering failed (%d)\n",
+		pr_info("GPIO registering failed (%d)\n",
 		       err);
 		ioport_unmap(gp.pm);
 		release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
--
1.9.1


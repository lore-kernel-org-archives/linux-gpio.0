From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] gpio: bt8xx: Remove redundant pci_set_drvdata
Date: Fri, 20 Sep 2013 14:52:29 +0530
Message-ID: <1379668949-2986-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:41782 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754148Ab3ITJWU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 05:22:20 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl13so486738pab.20
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 02:22:19 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: m@bues.ch, linus.walleij@linaro.org, sachin.kamat@linaro.org

Driver core sets driver data to NULL upon failure or remove.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 8369e71..9dfe36f 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -228,7 +228,6 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 err_release_mem:
 	release_mem_region(pci_resource_start(dev, 0),
 			   pci_resource_len(dev, 0));
-	pci_set_drvdata(dev, NULL);
 err_disable:
 	pci_disable_device(dev);
 err_freebg:
@@ -252,7 +251,6 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 			   pci_resource_len(pdev, 0));
 	pci_disable_device(pdev);
 
-	pci_set_drvdata(pdev, NULL);
 	kfree(bg);
 }
 
-- 
1.7.9.5


From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] gpio: bt8xx: remove unnecessary pci_set_drvdata()
Date: Thu, 12 Sep 2013 15:48:28 +0900
Message-ID: <001901ceaf84$1627bd10$42773730$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27207 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346Ab3ILGs3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2013 02:48:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MT0002VA2WQY6M0@mailout1.samsung.com> for
 linux-gpio@vger.kernel.org; Thu, 12 Sep 2013 15:48:27 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Michael Buesch' <m@bues.ch>

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
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
1.7.10.4



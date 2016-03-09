From: mrpace2@gmail.com
Subject: [PATCH] gpio: gpio-pca953x: no interrupts with 4-bit devices
Date: Wed, 09 Mar 2016 12:37:09 +0000
Message-ID: <emac54c752-04e5-4445-a05e-e6d24a098066@t410-5a>
Reply-To: mrpace2@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p05-ob.smtp.rzone.de ([81.169.146.183]:11462 "EHLO
	mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753554AbcCIMnY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:43:24 -0500
Received: from mail.q5net.de (p4FF1C5C9.dip0.t-ipconnect.de [79.241.197.201])
	by smtp.strato.de (RZmta 37.21 DYNA|AUTH)
	with ESMTPSA id j04242s29Cb7sBs
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate)
	for <linux-gpio@vger.kernel.org>;
	Wed, 9 Mar 2016 13:37:07 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

I/O expanders with less than 8 I/O (PCA9536 and PCA9537, currently) fail 
to invoke interrupt handlers because the NBANK macro

     #define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
incorrectly calculates no banks for these devices. As a result, 
pca953x_irq_pending() never sets the trigger_seen flag.

The patch below fixed the issue by changing the NBANK() macro.

Signed-off-by: Frank Edelhaeuser <mrpace2 <at> gmail.com>
---
diff -Nur a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
--- a/drivers/gpio/gpio-pca953x.c 2016-03-08 00:00:00.000000000 +0000
+++ b/drivers/gpio/gpio-pca953x.c 2016-03-08 00:00:00.000000000 +0000
@@ -86,7 +86,7 @@
  #define MAX_BANK 5
  #define BANK_SZ 8

-#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
+#define NBANK(chip) (((chip->gpio_chip.ngpio - 1) / BANK_SZ) + 1)

  struct pca953x_chip {
   unsigned gpio_start;


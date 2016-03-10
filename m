From: mrpace2@gmail.com
Subject: [PATCH v3] gpio: gpio-pca953x: no interrupts with 4-bit devices
Date: Thu, 10 Mar 2016 21:17:49 +0000
Message-ID: <em477b04cd-60b3-47e8-ba4c-4e1b20ea3e6a@t410-5a>
Reply-To: mrpace2@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p05-ob.smtp.rzone.de ([81.169.146.180]:34295 "EHLO
	mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932288AbcCJVRu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2016 16:17:50 -0500
Received: from mail.q5net.de (p4FF1C47E.dip0.t-ipconnect.de [79.241.196.126])
	by smtp.strato.de (RZmta 37.21 DYNA|AUTH)
	with ESMTPSA id C04bc0s2ALHloOu
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate)
	for <linux-gpio@vger.kernel.org>;
	Thu, 10 Mar 2016 22:17:47 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Ah, I didn't know about DIV_ROUND_UP(). I also didn't read Alexander's 
response correctly. Sorry about that. DIV_ROUND_UP() is essentially what 
he proposed, and it's also correct for ngpio==0.

So here's the third version of my trivial patch.

Signed-off-by: Frank Edelhaeuser <mrpace2 <at> gmail.com>
---
diff -Nur a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
--- a/drivers/gpio/gpio-pca953x.c 2016-03-10 19:11:37.799908602 +0000
+++ b/drivers/gpio/gpio-pca953x.c 2016-03-10 19:11:09.635412539 +0000
@@ -86,7 +86,7 @@
  #define MAX_BANK 5
  #define BANK_SZ 8

-#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
+#define NBANK(chip) (DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ))

  struct pca953x_chip {
   unsigned gpio_start;



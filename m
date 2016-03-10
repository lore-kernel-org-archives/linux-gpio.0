From: mrpace2@gmail.com
Subject: [PATCH v2] gpio: gpio-pca953x: no interrupts with 4-bit devices
Date: Thu, 10 Mar 2016 10:15:05 +0000
Message-ID: <emabcbfc80-7a10-4494-be09-92de321c5d0e@t410-5a>
References: <2550700.ucYhgAiWGF@ws-stein>
Reply-To: mrpace2@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p05-ob.smtp.rzone.de ([81.169.146.180]:39171 "EHLO
	mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753612AbcCJKPJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2016 05:15:09 -0500
Received: from mail.q5net.de (p4FF1C47E.dip0.t-ipconnect.de [79.241.196.126])
	by smtp.strato.de (RZmta 37.21 DYNA|AUTH)
	with ESMTPSA id k02e5ds2AAF6zPM
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate)
	for <linux-gpio@vger.kernel.org>;
	Thu, 10 Mar 2016 11:15:06 +0100 (CET)
In-Reply-To: <2550700.ucYhgAiWGF@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

The NBANK macro can be extended in order to avoid the underflow:

#define NBANK(chip) (chip->gpio_chip.ngpio == 0 ? 0 : \
     ((chip->gpio_chip.ngpio + (BANK_SZ - 1)) / BANK_SZ))
Resending a modified patch.

Signed-off-by: Frank Edelhaeuser <mrpace2 <at> gmail.com>
---
diff -Nur a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
--- a/drivers/gpio/gpio-pca953x.c 2016-03-10 02:34:56.012345678 +0000
+++ b/drivers/gpio/gpio-pca953x.c 2016-03-10 02:34:56.012345678 +0000
@@ -86,7 +86,8 @@
  #define MAX_BANK 5
  #define BANK_SZ 8

-#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
+#define NBANK(chip) (chip->gpio_chip.ngpio == 0 ? 0 : \
+    ((chip->gpio_chip.ngpio + (BANK_SZ - 1)) / BANK_SZ))

  struct pca953x_chip {
   unsigned gpio_start;


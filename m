From: Aaron Sierra <asierra@xes-inc.com>
Subject: [PATCH 1/3] gpio: pca953x: Add devices to Kconfig help
Date: Fri, 7 Feb 2014 16:35:48 -0600 (CST)
Message-ID: <1550736903.119527.1391812548072.JavaMail.zimbra@xes-inc.com>
References: <972232456.119003.1391812066467.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:14942 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751872AbaBGWfv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 7 Feb 2014 17:35:51 -0500
In-Reply-To: <972232456.119003.1391812066467.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The pca953x driver supports tca6424 (24-bit) and pca9505 (40-bit)
devices. They were the only supported devices not mentioned in the
Kconfig help.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/gpio/Kconfig        |    4 ++++
 drivers/gpio/gpio-pca953x.c |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6973387..fd7ad66 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -476,6 +476,10 @@ config GPIO_PCA953X
 	  16 bits:	max7312, max7313, pca9535, pca9539, pca9555, pca9575,
 			tca6416
 
+	  24 bits:	tca6424
+
+	  40 bits:	pca9505
+
 config GPIO_PCA953X_IRQ
 	bool "Interrupt controller support for PCA953x"
 	depends on GPIO_PCA953X=y
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 019b23b..cede6f6 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1,5 +1,5 @@
 /*
- *  PCA953x 4/8/16 bit I/O ports
+ *  PCA953x 4/8/16/24/40 bit I/O ports
  *
  *  Copyright (C) 2005 Ben Gardner <bgardner@wabtec.com>
  *  Copyright (C) 2007 Marvell International Ltd.
-- 
1.7.9.5

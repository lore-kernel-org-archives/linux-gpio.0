From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] DEBUG: BT
Date: Wed,  3 Jan 2018 19:30:55 +0200
Message-ID: <20180103173055.45679-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:35880 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750927AbeACRa6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 12:30:58 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/bluetooth/Makefile  | 2 ++
 drivers/bluetooth/btbcm.c   | 2 ++
 drivers/bluetooth/hci_bcm.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index 4e4e44d09796..2b4d3ab1972e 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -44,3 +44,5 @@ hci_uart-$(CONFIG_BT_HCIUART_QCA)	+= hci_qca.o
 hci_uart-$(CONFIG_BT_HCIUART_AG6XX)	+= hci_ag6xx.o
 hci_uart-$(CONFIG_BT_HCIUART_MRVL)	+= hci_mrvl.o
 hci_uart-objs				:= $(hci_uart-y)
+
+ccflags-y	+= -DDEBUG
diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index afa4cb3b16e3..fb0371a935b1 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -21,6 +21,8 @@
  *
  */
 
+#define DEBUG
+
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <asm/unaligned.h>
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 1fc604a0d870..dedbafb4e38f 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -21,6 +21,8 @@
  *
  */
 
+#define DEBUG
+
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/skbuff.h>
-- 
2.15.1


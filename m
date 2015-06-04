From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 4/4] sh-pfc: r8a7791 remove non-existing GPIO pins
Date: Fri, 05 Jun 2015 02:31:49 +0300
Message-ID: <38751183.VIdH0V180E@wasted.cogentembedded.com>
References: <4326653.qPvIJDU6F2@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:35835 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbbFDXbx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2015 19:31:53 -0400
Received: by labko7 with SMTP id ko7so42736078lab.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2015 16:31:51 -0700 (PDT)
In-Reply-To: <4326653.qPvIJDU6F2@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

GPIO banks 1 and 7 are missing pins 26 to 31. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- renamed the patch.

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -14,15 +14,30 @@
 #include "core.h"
 #include "sh_pfc.h"
 
+#define PORT_GP_26(bank, fn, sfx)					\
+	PORT_GP_1(bank, 0,  fn, sfx), PORT_GP_1(bank, 1,  fn, sfx),	\
+	PORT_GP_1(bank, 2,  fn, sfx), PORT_GP_1(bank, 3,  fn, sfx),	\
+	PORT_GP_1(bank, 4,  fn, sfx), PORT_GP_1(bank, 5,  fn, sfx),	\
+	PORT_GP_1(bank, 6,  fn, sfx), PORT_GP_1(bank, 7,  fn, sfx),	\
+	PORT_GP_1(bank, 8,  fn, sfx), PORT_GP_1(bank, 9,  fn, sfx),	\
+	PORT_GP_1(bank, 10, fn, sfx), PORT_GP_1(bank, 11, fn, sfx),	\
+	PORT_GP_1(bank, 12, fn, sfx), PORT_GP_1(bank, 13, fn, sfx),	\
+	PORT_GP_1(bank, 14, fn, sfx), PORT_GP_1(bank, 15, fn, sfx),	\
+	PORT_GP_1(bank, 16, fn, sfx), PORT_GP_1(bank, 17, fn, sfx),	\
+	PORT_GP_1(bank, 18, fn, sfx), PORT_GP_1(bank, 19, fn, sfx),	\
+	PORT_GP_1(bank, 20, fn, sfx), PORT_GP_1(bank, 21, fn, sfx),	\
+	PORT_GP_1(bank, 22, fn, sfx), PORT_GP_1(bank, 23, fn, sfx),	\
+	PORT_GP_1(bank, 24, fn, sfx), PORT_GP_1(bank, 25, fn, sfx)
+
 #define CPU_ALL_PORT(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
-	PORT_GP_32(1, fn, sfx),						\
+	PORT_GP_26(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
 	PORT_GP_32(3, fn, sfx),						\
 	PORT_GP_32(4, fn, sfx),						\
 	PORT_GP_32(5, fn, sfx),						\
 	PORT_GP_32(6, fn, sfx),						\
-	PORT_GP_32(7, fn, sfx)
+	PORT_GP_26(7, fn, sfx)
 
 enum {
 	PINMUX_RESERVED = 0,


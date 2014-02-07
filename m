From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 1/6] mfd: lpc_ich: Convert ICH GPIOs IDs to enum
Date: Fri,  7 Feb 2014 14:21:02 +0100
Message-ID: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:38228 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932137AbaBGNVY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2014 08:21:24 -0500
Received: by mail-wg0-f42.google.com with SMTP id l18so745599wgh.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2014 05:21:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, Vincent Donnefort <vdonnefort@gmail.com>

From: Vincent Donnefort <vdonnefort@gmail.com>

All those IDs are arbitrary and so can be encapsulated into an enumeration.

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 3e1df64..293b062 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -31,13 +31,15 @@
 #define ICH_RES_GPE0	1
 
 /* GPIO compatibility */
-#define ICH_I3100_GPIO		0x401
-#define ICH_V5_GPIO		0x501
-#define ICH_V6_GPIO		0x601
-#define ICH_V7_GPIO		0x701
-#define ICH_V9_GPIO		0x801
-#define ICH_V10CORP_GPIO	0xa01
-#define ICH_V10CONS_GPIO	0xa11
+enum {
+	ICH_I3100_GPIO,
+	ICH_V5_GPIO,
+	ICH_V6_GPIO,
+	ICH_V7_GPIO,
+	ICH_V9_GPIO,
+	ICH_V10CORP_GPIO,
+	ICH_V10CONS_GPIO,
+};
 
 struct lpc_ich_info {
 	char name[32];
-- 
1.8.3.2


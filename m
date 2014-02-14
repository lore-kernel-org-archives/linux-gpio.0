From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [RESEND 2/6] mfd: lpc_ich: Add support for Intel Avoton GPIOs
Date: Fri, 14 Feb 2014 15:01:54 +0100
Message-ID: <1392386518-11025-3-git-send-email-vdonnefort@gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:48841 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529AbaBNOCD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 09:02:03 -0500
Received: by mail-wg0-f54.google.com with SMTP id l18so427283wgh.9
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 06:02:02 -0800 (PST)
In-Reply-To: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, asierra@xes-inc.com, lee.jones@linaro.org, Vincent Donnefort <vdonnefort@gmail.com>

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
---
 drivers/mfd/lpc_ich.c       | 1 +
 include/linux/mfd/lpc_ich.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index be93fa2..f0e1b75 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -500,6 +500,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_AVN] = {
 		.name = "Avoton SoC",
 		.iTCO_version = 1,
+		.gpio_version = AVOTON_GPIO,
 	},
 	[LPC_COLETO] = {
 		.name = "Coleto Creek",
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 293b062..b2364dd 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -39,6 +39,7 @@ enum {
 	ICH_V9_GPIO,
 	ICH_V10CORP_GPIO,
 	ICH_V10CONS_GPIO,
+	AVOTON_GPIO,
 };
 
 struct lpc_ich_info {
-- 
1.8.3.2


From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 2/6] mfd: lpc_ich: Add support for Intel Avoton GPIOs
Date: Fri,  7 Feb 2014 14:21:03 +0100
Message-ID: <1391779267-27084-2-git-send-email-vdonnefort@lacie.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:46043 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752799AbaBGNVc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2014 08:21:32 -0500
Received: by mail-wi0-f178.google.com with SMTP id cc10so827609wib.17
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2014 05:21:30 -0800 (PST)
In-Reply-To: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, Vincent Donnefort <vdonnefort@gmail.com>

From: Vincent Donnefort <vdonnefort@gmail.com>

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

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


From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH 1/3] gpio: gpio-ich: add support for Intel Baytrail
Date: Sat, 23 Jan 2016 17:32:07 +0100
Message-ID: <1453566729-30220-2-git-send-email-antoine.tenart@free-electrons.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:34699 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753554AbcAWQcM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2016 11:32:12 -0500
In-Reply-To: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ptyser@xes-inc.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds support for the Braytrail series, with the hardware
blink capability.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/gpio/gpio-ich.c     | 12 ++++++++++++
 include/linux/mfd/lpc_ich.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 4ba7ed502131..6f5fcae32855 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -384,6 +384,15 @@ static struct ichx_desc avoton_desc = {
 	.use_outlvl_cache = true,
 };
 
+/* Baytrail */
+static struct ichx_desc baytrail_desc = {
+	.ngpio = 96,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
+	.have_blink = true,
+	.use_outlvl_cache = true,
+};
+
 static int ichx_gpio_request_regions(struct resource *res_base,
 						const char *name, u8 use_gpio)
 {
@@ -461,6 +470,9 @@ static int ichx_gpio_probe(struct platform_device *pdev)
 	case AVOTON_GPIO:
 		ichx_priv.desc = &avoton_desc;
 		break;
+	case ICH_BAYTRAIL_GPIO:
+		ichx_priv.desc = &baytrail_desc;
+		break;
 	default:
 		return -ENODEV;
 	}
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 2b300b44f994..659a1cd875d8 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -34,6 +34,7 @@ enum {
 	ICH_V10CORP_GPIO,
 	ICH_V10CONS_GPIO,
 	AVOTON_GPIO,
+	ICH_BAYTRAIL_GPIO,
 };
 
 struct lpc_ich_info {
-- 
2.7.0


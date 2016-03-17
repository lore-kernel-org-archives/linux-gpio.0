From: YD Tseng <ltyu101@gmail.com>
Subject: [PATCH] gpio: amdpt: Add a new ACPI HID
Date: Thu, 17 Mar 2016 11:35:57 +0800
Message-ID: <1458185757-10537-1-git-send-email-yd_tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36299 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751476AbcCQDiI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 23:38:08 -0400
Received: by mail-pf0-f181.google.com with SMTP id u190so101465249pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 20:38:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

From: YD Tseng <Yd_Tseng@asmedia.com.tw>

Dear all:

This patch adds a new ACPI HID, AMDIF030, in the pt_gpio_acpi_match.

Signed-off-by: YD Tseng<Yd_Tseng@asmedia.com.tw> 

---

A file is modified.
drivers/gpio/gpio-amdpt.c		Modified file

diff -uprN -X linux-4.5.vanilla/Documentation/dontdiff linux-4.5.vanilla/drivers/gpio/gpio-amdpt.c linux-4.5/drivers/gpio/gpio-amdpt.c
--- linux-4.5.vanilla/drivers/gpio/gpio-amdpt.c	2016-03-14 12:28:54.000000000 +0800
+++ linux-4.5/drivers/gpio/gpio-amdpt.c	2016-03-16 18:46:14.920306901 +0800
@@ -239,6 +239,7 @@ static int pt_gpio_remove(struct platfor
 
 static const struct acpi_device_id pt_gpio_acpi_match[] = {
 	{ "AMDF030", 0 },
+	{ "AMDIF030", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);

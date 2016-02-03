From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH v2 3/3] gpio: MAINTAINERS: Add an entry for GPIO mockup driver
Date: Wed,  3 Feb 2016 20:14:36 +0800
Message-ID: <1454501676-19900-4-git-send-email-bamvor.zhangjian@linaro.org>
References: <1454501676-19900-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36058 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090AbcBCMPO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 07:15:14 -0500
Received: by mail-pf0-f181.google.com with SMTP id n128so13016282pfn.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2016 04:15:13 -0800 (PST)
In-Reply-To: <1454501676-19900-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Add an entry for the GPIO mockup driver with myself as maintainer.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d7d83c..d286005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4750,6 +4750,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/goodix.c
 
+GPIO MOCKUP DRIVER
+M:	Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-mockup.c
+F:	tools/testing/selftests/gpio/
+
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Alexandre Courbot <gnurou@gmail.com>
-- 
2.1.4


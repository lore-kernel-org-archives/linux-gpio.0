From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH RFD 3/3] gpio: MAINTAINERS: Add an entry for GPIO mockup driver
Date: Sat, 14 Nov 2015 16:51:37 +0800
Message-ID: <1447491097-14799-4-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:36626 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbbKNIwH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:52:07 -0500
Received: by pacdm15 with SMTP id dm15so123508811pac.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:52:06 -0800 (PST)
In-Reply-To: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Add an entry for the GPIO mockup driver with myself as maintainer.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ad9d5c..ac648f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4649,6 +4649,15 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/goodix.c
 
+GPIO MOCKUP DRIVER
+M:	Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
+L:	linux-gpio@vger.kernel.org
+W:	https://github.com/bjzhang/linux
+T:	git git://github.com/bjzhang/linux
+S:	Maintained
+F:	drivers/gpio/gpio-mockup.c
+F:	tools/testing/selftests/gpio/
+
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Alexandre Courbot <gnurou@gmail.com>
-- 
2.1.4


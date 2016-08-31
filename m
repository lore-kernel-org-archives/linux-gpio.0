From: bamvor.zhangjian@linaro.org
Subject: [PATCH v3 5/5] gpio: MAINTAINERS: Add an entry for GPIO mockup driver
Date: Wed, 31 Aug 2016 11:45:48 +0200
Message-ID: <20160831094548.12574-6-bamvor.zhangjian@linaro.org>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34543 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932818AbcHaJqT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 05:46:19 -0400
Received: by mail-pf0-f180.google.com with SMTP id p64so17937810pfb.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 02:46:18 -0700 (PDT)
In-Reply-To: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Add an entry for the GPIO mockup driver with myself as maintainer.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9ffa78..2dc4f52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5241,6 +5241,13 @@ L:	linux-input@vger.kernel.org
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
1.8.4.5


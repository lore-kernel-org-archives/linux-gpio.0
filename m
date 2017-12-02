From: Daniel Axtens <dja@axtens.net>
Subject: [PATCH] pinctrl: pxa2xx: add MODULE_LICENSE
Date: Sat,  2 Dec 2017 20:40:15 +1100
Message-ID: <20171202094015.11696-1-dja@axtens.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:38524 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751271AbdLBJkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 04:40:35 -0500
Received: by mail-pf0-f195.google.com with SMTP id u25so5727787pfg.5
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 01:40:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: trivial@kernel.org, Daniel Axtens <dja@axtens.net>

This fixes the following warning on an allmodconfig build:
WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pxa/pinctrl-pxa2xx.o

This matches the license in the header.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index 866aa3ce1ac9..3d67fca5ae21 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -436,3 +436,5 @@ int pxa2xx_pinctrl_exit(struct platform_device *pdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pxa2xx_pinctrl_exit);
+
+MODULE_LICENSE("GPL v2");
-- 
2.11.0


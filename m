From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: zynq: fix UTF-8 errors
Date: Fri, 30 Oct 2015 15:06:13 +0100
Message-ID: <1446213973-4999-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33033 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964769AbbJ3OG1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:06:27 -0400
Received: by lbbec13 with SMTP id ec13so51918737lbb.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 07:06:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>

=46ix up S=C3=B6ren's name in the Zynq driver. I caused this. I fix it.

Cc: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-zynq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-z=
ynq.c
index 9aefc608ba79..d57b5eca7b98 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (C) 2014 Xilinx
  *
- *  S=C3=83=C2=B6ren Brinkmann <soren.brinkmann@xilinx.com>
+ *  S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
  *
  * This program is free software: you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License as published b=
y
@@ -1242,6 +1242,6 @@ static void __exit zynq_pinctrl_exit(void)
 }
 module_exit(zynq_pinctrl_exit);
=20
-MODULE_AUTHOR("S=C3=83=C2=B6ren Brinkmann <soren.brinkmann@xilinx.com>=
");
+MODULE_AUTHOR("S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>");
 MODULE_DESCRIPTION("Xilinx Zynq pinctrl driver");
 MODULE_LICENSE("GPL");
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

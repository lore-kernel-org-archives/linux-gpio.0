From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: board.txt: Fix the gpio name example
Date: Mon, 26 Jan 2015 22:30:39 -0200
Message-ID: <1422318639-20995-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:50806 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbbA0Aa6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jan 2015 19:30:58 -0500
Received: by mail-qc0-f181.google.com with SMTP id l6so9805990qcy.12
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2015 16:30:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, corbet@lwn.net, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

As explained in this file:

"GPIOs mappings are defined in the consumer device's node, in a property named
<function>-gpios"

So fix the example to match the convention.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 Documentation/gpio/board.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index 4452786..8b35f51 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -31,7 +31,7 @@ through gpiod_get(). For example:
 			    <&gpio 16 GPIO_ACTIVE_HIGH>, /* green */
 			    <&gpio 17 GPIO_ACTIVE_HIGH>; /* blue */
 
-		power-gpio = <&gpio 1 GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 	};
 
 This property will make GPIOs 15, 16 and 17 available to the driver under the
-- 
1.9.1


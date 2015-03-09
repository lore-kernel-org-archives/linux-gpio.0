From: Andreas Bofjall <andreas@gazonk.org>
Subject: [PATCH RESEND 1/3] gpio: f7188x: correct spelling of "Fintek"
Date: Mon,  9 Mar 2015 21:55:12 +0100
Message-ID: <1425934514-1023-2-git-send-email-andreas@gazonk.org>
References: <1425934514-1023-1-git-send-email-andreas@gazonk.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxf4.bahnhof.se ([213.80.101.28]:61610 "EHLO mxf4.bahnhof.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920AbbCIVb3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 17:31:29 -0400
In-Reply-To: <1425934514-1023-1-git-send-email-andreas@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Les Schaffer <schaffer@optonline.net>, Andreas Bofjall <andreas@gazonk.org>

The company is called "Fintek", not "Fintech". Fix it.

Signed-off-by: Andreas Bofjall <andreas@gazonk.org>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-f7188x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 1be291a..fbd954e 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -410,7 +410,7 @@ err:
 }
 
 /*
- * Try to match a supported Fintech device by reading the (hard-wired)
+ * Try to match a supported Fintek device by reading the (hard-wired)
  * configuration I/O ports. If available, then register both the platform
  * device and driver to support the GPIOs.
  */
-- 
2.1.4


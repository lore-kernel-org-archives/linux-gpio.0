From: Andreas Bofjall <andreas@gazonk.org>
Subject: [PATCH 1/3] gpio: f7188x: correct spelling of "Fintek"
Date: Sun, 25 Jan 2015 18:16:17 +0100
Message-ID: <1422206179-11464-2-git-send-email-andreas@gazonk.org>
References: <1422206179-11464-1-git-send-email-andreas@gazonk.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxf5.bahnhof.se ([213.80.101.29]:65409 "EHLO mxf5.bahnhof.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752918AbbAYRQs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 25 Jan 2015 12:16:48 -0500
In-Reply-To: <1422206179-11464-1-git-send-email-andreas@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andreas Bofjall <andreas@gazonk.org>

The company is called "Fintek", not "Fintech". Fix it.

Signed-off-by: Andreas Bofjall <andreas@gazonk.org>
---
 drivers/gpio/gpio-f7188x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index fd3202f..53be51d 100644
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


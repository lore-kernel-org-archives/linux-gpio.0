From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] gpio-hammer: fix make consumer_label suitable to work on gpio-nails
Date: Wed, 25 Jan 2017 22:01:44 +0100
Message-ID: <20170125210144.26831-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:56211 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751515AbdAYVBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 16:01:50 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mason <slash.tmp@free.fr>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

There are no gpio-nalils, so fix label accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 tools/gpio/gpio-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index f1eab587dfea..4bcb234c0fca 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -38,7 +38,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	memset(&data.values, 0, sizeof(data.values));
 	ret = gpiotools_request_linehandle(device_name, lines, nlines,
 					   GPIOHANDLE_REQUEST_OUTPUT, &data,
-					   "gpio-hammler");
+					   "gpio-hammer");
 	if (ret < 0)
 		goto exit_error;
 	else
-- 
2.11.0


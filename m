From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH] Documentation: gpio: consumer: describe the con_id parameter
Date: Sat, 11 Jul 2015 07:46:02 +0200
Message-ID: <1436593562-5119-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:36072 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751649AbbGKGQ5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2015 02:16:57 -0400
Received: by wgxm20 with SMTP id m20so80015124wgx.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2015 23:16:56 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Dirk Behme <dirk.behme@gmail.com>

The con_id parameter has to match the GPIO description and is automatically
extended by the GPIO suffix if not NULL. I had to look into the code to
understand this and properly find the GPIO I've been looking for, so document
this.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 Documentation/gpio/consumer.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 75542b9..d0d1e47 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -39,6 +39,18 @@ device that displays digits), an additional index argument can be specified:
 					  const char *con_id, unsigned int idx,
 					  enum gpiod_flags flags)
 
+The con_id string parameter has to be either NULL or the prefix of the GPIO
+suffixes ("gpios" or "gpio"):
+
+* If the GPIO description is just named with one of the GPIO suffixes
+  ("gpios" or "gpio") use NULL.
+* If the GPIO description is prefixed with anything, e.g. "reset-gpios", use the
+  prefix without the "-" as con_id parameter (in this example "reset").
+
+In case con_id is not NULL, the gpiod subsystem prefixes the GPIO suffix
+("gpios" or "gpio") with the string passed in con_id to get the resulting string
+(snprintf(... "%s-%s", con_id, gpio_suffixes[]).
+
 The flags parameter is used to optionally specify a direction and initial value
 for the GPIO. Values can be:
 
-- 
2.4.5


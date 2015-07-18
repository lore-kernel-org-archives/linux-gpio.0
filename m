From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2] Documentation: gpio: consumer: describe the con_id parameter
Date: Sat, 18 Jul 2015 08:24:07 +0200
Message-ID: <1437200647-5138-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:35661 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750848AbbGRGYM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2015 02:24:12 -0400
Received: by wibxm9 with SMTP id xm9so53293556wib.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 23:24:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Dirk Behme <dirk.behme@gmail.com>

The con_id parameter has to match the GPIO description and is automatically
extended by the GPIO suffix if not NULL. I had to look into the code to
understand this and properly find the GPIO I've been looking for, so document
this.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2: Incorporate the review comments from Alexandre.

 Documentation/gpio/consumer.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 75542b9..5f7437b 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -39,6 +39,19 @@ device that displays digits), an additional index argument can be specified:
 					  const char *con_id, unsigned int idx,
 					  enum gpiod_flags flags)
 
+The con_id string parameter has to be either NULL or the prefix of the GPIO
+suffixes ("gpios" or "gpio", automatically looked up by the gpiod functions
+internally):
+
+* If the GPIO description is just named with one of the GPIO suffixes
+  ("gpios" or "gpio"), use NULL.
+* If the GPIO description is prefixed with anything, e.g. "reset-gpios", use the
+  prefix without the "-" as con_id parameter (in this example "reset").
+
+In case con_id is not NULL, the GPIO subsystem prefixes the GPIO suffix
+("gpios" or "gpio") with the string passed in con_id to get the resulting string
+(snprintf(... "%s-%s", con_id, gpio_suffixes[]).
+
 The flags parameter is used to optionally specify a direction and initial value
 for the GPIO. Values can be:
 
-- 
2.4.6


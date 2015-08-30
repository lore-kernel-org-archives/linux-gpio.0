From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 2/2 v2] Documentation: gpio: board: describe the con_id parameter
Date: Sun, 30 Aug 2015 11:15:55 +0200
Message-ID: <1440926155-7183-2-git-send-email-dirk.behme@gmail.com>
References: <1440926155-7183-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38799 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbbH3JQB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2015 05:16:01 -0400
Received: by wicpl12 with SMTP id pl12so3181154wic.1
        for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2015 02:16:00 -0700 (PDT)
In-Reply-To: <1440926155-7183-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Dirk Behme <dirk.behme@gmail.com>

The con_id parameter has to match the GPIO description and is automatically
extended by the GPIO suffix if not NULL. I had to look into the code to
understand this and properly find the GPIO I've been looking for, so document
this.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
Changes in v2: Using the "gpios" property without prefix is considered deprecated,
               therefore don't describe it.

 Documentation/gpio/board.txt    | 9 +++++++++
 Documentation/gpio/consumer.txt | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index 7605773..0bfc455 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -48,6 +48,15 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
 The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
 gpiod_is_active_low(power) will be true).
 
+The second parameter of the gpiod_get() functions, the con_id string, has to be
+the <function>-prefix of the GPIO suffixes ("gpios" or "gpio", automatically
+looked up by the gpiod functions internally) used in the device tree. With above
+"led-gpios" example, use the prefix without the "-" as con_id parameter: "led".
+
+Internally, the GPIO subsystem prefixes the GPIO suffix ("gpios" or "gpio")
+with the string passed in con_id to get the resulting string
+(snprintf(... "%s-%s", con_id, gpio_suffixes[]).
+
 ACPI
 ----
 ACPI also supports function names for GPIOs in a similar fashion to DT.
diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 75542b9..47ce4fd 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -39,6 +39,9 @@ device that displays digits), an additional index argument can be specified:
 					  const char *con_id, unsigned int idx,
 					  enum gpiod_flags flags)
 
+For a more detailed description of the con_id parameter in the DeviceTree case
+see Documentation/gpio/board.txt
+
 The flags parameter is used to optionally specify a direction and initial value
 for the GPIO. Values can be:
 
-- 
2.5.1


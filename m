From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 10/10] hwmon: i2cs-fan: Add hwmon dts binding documentation
Date: Fri,  7 Oct 2016 18:21:09 +0300
Message-ID: <1475853669-22480-11-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38459 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938914AbcJGPXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2016 11:23:52 -0400
Received: by mail-wm0-f52.google.com with SMTP id i130so46062881wmg.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2016 08:23:51 -0700 (PDT)
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

Adds the I2CS Fan Tray hwmon device tree node documentation.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 Documentation/devicetree/bindings/hwmon/i2cs-fan.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/i2cs-fan.txt

diff --git a/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
new file mode 100644
index 0000000..4ef880c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
@@ -0,0 +1,19 @@
+Hwmon driver for Juniper fan trays on I2CS Slave FPGA
+
+Required properties:
+
+- compatible: "i2cs-fan-hwmon"
+
+Optional properties:
+
+- num-fans: fans per tray (default 14)
+
+- tach-factor: TACH count scaling factor (default 120)
+
+Example:
+
+fan-hwmon {
+	compatible = "jnx,i2cs-fan-hwmon";
+	num-fans = <6>;
+	tach-factor = <33>;
+};
-- 
1.9.1


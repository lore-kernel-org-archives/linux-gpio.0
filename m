From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/4] drivers-on-gpio.txt: Fix paths to GPIO driver source files
Date: Fri, 10 Jun 2016 16:46:33 +0930
Message-ID: <1465542996-12534-2-git-send-email-andrew@aj.id.au>
References: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:57985 "EHLO
	homiemail-a22.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750888AbcFJHRx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 03:17:53 -0400
In-Reply-To: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/gpio/drivers-on-gpio.txt | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpio/drivers-on-gpio.txt b/Documentation/gpio/drivers-on-gpio.txt
index 14bf95a13bae..306513251713 100644
--- a/Documentation/gpio/drivers-on-gpio.txt
+++ b/Documentation/gpio/drivers-on-gpio.txt
@@ -37,15 +37,16 @@ hardware descriptions such as device tree or ACPI:
   external connector status, such as a headset line for an audio driver or an
   HDMI connector. It will provide a better userspace sysfs interface than GPIO.
 
-- restart-gpio: drivers/power/gpio-restart.c is used to restart/reboot the
-  system by pulling a GPIO line and will register a restart handler so
+- restart-gpio: drivers/power/reset/gpio-restart.c is used to restart/reboot
+  the system by pulling a GPIO line and will register a restart handler so
   userspace can issue the right system call to restart the system.
 
-- poweroff-gpio: drivers/power/gpio-poweroff.c is used to power the system down
-  by pulling a GPIO line and will register a pm_power_off() callback so that
-  userspace can issue the right system call to power down the system.
+- poweroff-gpio: drivers/power/reset/gpio-poweroff.c is used to power the
+  system down by pulling a GPIO line and will register a pm_power_off()
+  callback so that userspace can issue the right system call to power down the
+  system.
 
-- gpio-gate-clock: drivers/clk/clk-gpio-gate.c is used to control a gated clock
+- gpio-gate-clock: drivers/clk/clk-gpio.c is used to control a gated clock
   (off/on) that uses a GPIO, and integrated with the clock subsystem.
 
 - i2c-gpio: drivers/i2c/busses/i2c-gpio.c is used to drive an I2C bus
-- 
2.7.4


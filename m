From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 06/11] staging: android: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun,  2 Aug 2015 11:09:51 +0200
Message-ID: <1438506591-31716-1-git-send-email-geert@linux-m68k.org>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42143 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021AbbHBJJw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:09:52 -0400
In-Reply-To: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by.
---
 drivers/staging/android/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/android/Kconfig b/drivers/staging/android/Kconfig
index 24d657b3ab9946d0..68307121c9c18830 100644
--- a/drivers/staging/android/Kconfig
+++ b/drivers/staging/android/Kconfig
@@ -20,7 +20,8 @@ config ANDROID_TIMED_OUTPUT
 
 config ANDROID_TIMED_GPIO
 	tristate "Android timed gpio driver"
-	depends on GPIOLIB && ANDROID_TIMED_OUTPUT
+	depends on GPIOLIB || COMPILE_TEST
+	depends on ANDROID_TIMED_OUTPUT
 	default n
         ---help---
 	  Unlike generic gpio is to allow programs to access and manipulate gpio
-- 
1.9.1


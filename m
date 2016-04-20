From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 23/23] gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:21 +0200
Message-ID: <1461142701-21096-24-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:36226 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932976AbcDTI7V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:21 -0400
Received: by mail-lb0-f180.google.com with SMTP id ys16so5552472lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:20 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>

The GPIOLIB is now selectable explicitly, and always available
for all archs. All archs that require GPIOLIB are switched to
select GPIOLIB directly. Delete the hairy ARCH_REQUIRE_GPIOLIB
and ARCH_WANTS_OPTIONAL_GPIOLIB Kconfig symbols.

Cc: Michael B=C3=BCsch <m@bues.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/board.txt       |  6 +++---
 Documentation/gpio/gpio-legacy.txt | 16 ++++------------
 drivers/gpio/Kconfig               | 21 ---------------------
 3 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.tx=
t
index 86d3fa95fd12..40884c4fe40c 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -8,9 +8,9 @@ gpio-legacy.txt (actually, there is no real mapping pos=
sible with the old
 interface; you just fetch an integer from somewhere and request the
 corresponding GPIO.
=20
-Platforms that make use of GPIOs must select ARCH_REQUIRE_GPIOLIB (if =
GPIO usage
-is mandatory) or ARCH_WANT_OPTIONAL_GPIOLIB (if GPIO support can be om=
itted) in
-their Kconfig. Then, how GPIOs are mapped depends on what the platform=
 uses to
+All platforms can enable the GPIO library, but if the platform strictl=
y
+requires GPIO functionality to be present, it needs to select GPIOLIB =
from its
+Kconfig. Then, how GPIOs are mapped depends on what the platform uses =
to
 describe its hardware layout. Currently, mappings can be defined throu=
gh device
 tree, ACPI, and platform data.
=20
diff --git a/Documentation/gpio/gpio-legacy.txt b/Documentation/gpio/gp=
io-legacy.txt
index 79ab5648d69b..b34fd94f7089 100644
--- a/Documentation/gpio/gpio-legacy.txt
+++ b/Documentation/gpio/gpio-legacy.txt
@@ -72,8 +72,8 @@ in this document, but drivers acting as clients to th=
e GPIO interface must
 not care how it's implemented.)
=20
 That said, if the convention is supported on their platform, drivers s=
hould
-use it when possible.  Platforms must select ARCH_REQUIRE_GPIOLIB or
-ARCH_WANT_OPTIONAL_GPIOLIB in their Kconfig.  Drivers that can't work =
without
+use it when possible.  Platforms must select GPIOLIB if GPIO functiona=
lity
+is strictly required.  Drivers that can't work without
 standard GPIO calls should have Kconfig entries which depend on GPIOLI=
B.  The
 GPIO calls are available, either as "real code" or as optimized-away s=
tubs,
 when drivers use the include file:
@@ -553,22 +553,14 @@ either NULL or the label associated with that GPI=
O when it was requested.
=20
 Platform Support
 ----------------
-To support this framework, a platform's Kconfig will "select" either
-ARCH_REQUIRE_GPIOLIB or ARCH_WANT_OPTIONAL_GPIOLIB
-and arrange that its <asm/gpio.h> includes <asm-generic/gpio.h> and de=
fines
-three functions: gpio_get_value(), gpio_set_value(), and gpio_cansleep=
().
+To force-enable this framework, a platform's Kconfig will "select" GPI=
OLIB,
+else it is up to the user to configure support for GPIO.
=20
 It may also provide a custom value for ARCH_NR_GPIOS, so that it bette=
r
 reflects the number of GPIOs in actual use on that platform, without
 wasting static table space.  (It should count both built-in/SoC GPIOs =
and
 also ones on GPIO expanders.
=20
-ARCH_REQUIRE_GPIOLIB means that the gpiolib code will always get compi=
led
-into the kernel on that architecture.
-
-ARCH_WANT_OPTIONAL_GPIOLIB means the gpiolib code defaults to off and =
the user
-can enable it and build it into the kernel optionally.
-
 If neither of these options are selected, the platform does not suppor=
t
 GPIOs through GPIO-lib and the code cannot be enabled by the user.
=20
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a68d83808f37..711995e39cf9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -10,27 +10,6 @@ config ARCH_HAVE_CUSTOM_GPIO_H
 	  overriding the default implementations.  New uses of this are
 	  strongly discouraged.
=20
-config ARCH_WANT_OPTIONAL_GPIOLIB
-	bool
-	help
-	  Select this config option from the architecture Kconfig, if
-	  it is possible to use gpiolib on the architecture, but let the
-	  user decide whether to actually build it or not.
-	  Select this instead of ARCH_REQUIRE_GPIOLIB, if your architecture d=
oes
-	  not depend on GPIOs being available, but rather let the user
-	  decide whether he needs it or not.
-
-config ARCH_REQUIRE_GPIOLIB
-	bool
-	select GPIOLIB
-	help
-	  Platforms select gpiolib if they use this infrastructure
-	  for all their GPIOs, usually starting with ones integrated
-	  into SOC processors.
-	  Selecting this from the architecture code will cause the gpiolib
-	  code to always get built in.
-
-
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

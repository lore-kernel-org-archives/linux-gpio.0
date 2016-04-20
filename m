From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/23] gpio: remove deps on ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
Date: Wed, 20 Apr 2016 10:57:59 +0200
Message-ID: <1461142701-21096-2-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36495 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932881AbcDTI6e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:34 -0400
Received: by mail-lf0-f50.google.com with SMTP id g184so36655352lfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:33 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>

The GPIOLIB symbol currently require that
ARCH_WANT_OPTIONAL_GPIOLIB or ARCH_REQUIRE_GPIOLIB is selected
to be selectable.

The ARCH_REQUIRE_GPIOLIB does only one thing: select GPIOLIB.

This is just confusing: architectures that want GPIOLIB should
be able to configure it in no matter what, and those who
require it should just select GPIOLIB.

It also creates problems for drivers that need to state
"select GPIOLIB" to get dependencies: those depend on the
selected architecture to select
ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB first, and will cause
compile errors for the few archs that state neither.

These intermediary symbols need to go.

As a first step, remove the dependencies so that:

- ARCH_WANT_OPTIONAL_GPIOLIB becomes a noop (GPIOLIB will be
  available for everyone) and

- "select ARCH_REQUIRE_GPIOLIB" can be replaced by just
  "select GPIOLIB"

After this patch we can follow up with patches cleaning up the
architectures one-by one and eventually remove the
ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB symbols altogether.

Reported-by: Michael Hennerich <michael.hennerich@analog.com>
Cc: Michael B=C3=BCsch <m@bues.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f73f26b43532..a68d83808f37 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -33,7 +33,6 @@ config ARCH_REQUIRE_GPIOLIB
=20
 menuconfig GPIOLIB
 	bool "GPIO Support"
-	depends on ARCH_WANT_OPTIONAL_GPIOLIB || ARCH_REQUIRE_GPIOLIB
 	help
 	  This enables GPIO support through the generic GPIO library.
 	  You only need to enable this, if you also want to enable
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

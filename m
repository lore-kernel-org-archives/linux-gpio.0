From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/23] blackfin: do away with ARCH_REQUIRE_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:04 +0200
Message-ID: <1461142701-21096-7-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:36061 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932753AbcDTI6q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:46 -0400
Received: by mail-lb0-f177.google.com with SMTP id ys16so5545255lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:45 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net

Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
as this can now be selected directly.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Various arch maintainers:

either ACK this and I will merge it into the GPIO tree for v4.7
anticipating no clashes, or you wait until I have the enabling patch
upstream (patch 1 in this series, removing deps on
ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
merge it to your arch trees yourselves for late v4.7
(post GPIO tree merge) or for v4.8.

You can also ask me for an immutable branch if you prefer that, I
will put the enabling patch on a branch and the patch for your arch
on top and ask you to pull it.

Select your option from the menu, silence probably means I will
merge it to the GPIO tree. Unless you are X86 or ARM in which case
I will be cautious.
---
 arch/blackfin/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index a63c12259e77..a1b3aa5471d1 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -26,7 +26,7 @@ config BLACKFIN
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select ARCH_HAVE_CUSTOM_GPIO_H
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	select HAVE_UID16
 	select HAVE_UNDERSCORE_SYMBOL_PREFIX
 	select VIRT_TO_BUS
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

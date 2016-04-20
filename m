From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 21/23] sparc: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:19 +0200
Message-ID: <1461142701-21096-22-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34030 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933000AbcDTI7Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:16 -0400
Received: by mail-lb0-f174.google.com with SMTP id b1so4860980lbi.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:15 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org

This symbols is not needed to get access to selecting the
GPIOLIB anymore: any arch can select GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: David S. Miller <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
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
 arch/sparc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 57ffaf285c2f..6bd1b1c3f5cc 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -21,7 +21,6 @@ config SPARC
 	select HAVE_ARCH_KGDB if !SMP || SPARC64
 	select HAVE_ARCH_TRACEHOOK
 	select SYSCTL_EXCEPTION_TRACE
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 	select RTC_CLASS
 	select RTC_DRV_M48T59
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

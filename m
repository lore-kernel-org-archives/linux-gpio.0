From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 16/23] alpha: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:14 +0200
Message-ID: <1461142701-21096-17-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33986 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754966AbcDTI7G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:06 -0400
Received: by mail-lb0-f175.google.com with SMTP id b1so4859129lbi.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:05 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

This symbols is not needed to get access to selecting the
GPIOLIB anymore: any arch can select GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
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
 arch/alpha/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 9d8a85801ed1..fe99f894e57d 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -13,7 +13,6 @@ config ALPHA
 	select GENERIC_IRQ_PROBE
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

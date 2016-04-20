From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 08/23] hexagon: update TODO list
Date: Wed, 20 Apr 2016 10:58:06 +0200
Message-ID: <1461142701-21096-9-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34967 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932744AbcDTI6u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:50 -0400
Received: by mail-lb0-f173.google.com with SMTP id os9so5553079lbb.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:49 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Richard Kuo <rkuo@codeaurora.org>, linux-hexagon@vger.kernel.org

The symbol that will be selected when GPIO is implemented
for Hexagon will be GPIOLIB, we have removed
ARCH_REQUIRE_GPIOLIB and ARCH_WANT_OPTIONAL_GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Richard Kuo <rkuo@codeaurora.org>
Cc: linux-hexagon@vger.kernel.org
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
 arch/hexagon/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 57298e7b4867..1941e4baaee6 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -8,8 +8,7 @@ config HEXAGON
 	# select HAVE_REGS_AND_STACK_ACCESS_API
 	# select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	# select ARCH_HAS_CPU_IDLE_WAIT
-	# select ARCH_WANT_OPTIONAL_GPIOLIB
-	# select ARCH_REQUIRE_GPIOLIB
+	# select GPIOLIB
 	# select HAVE_CLK
 	# select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_ATOMIC64
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 19/23] microblaze: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:17 +0200
Message-ID: <1461142701-21096-20-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34481 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932761AbcDTI7M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:12 -0400
Received: by mail-lf0-f49.google.com with SMTP id j11so36744973lfb.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:11 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Michal Simek <monstr@monstr.eu>

This symbols is not needed to get access to selecting the
GPIOLIB anymore: any arch can select GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Michal Simek <monstr@monstr.eu>
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
 arch/microblaze/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 3d793b55f60c..91a2ade46ff2 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -3,7 +3,6 @@ config MICROBLAZE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select BUILDTIME_EXTABLE_SORT
 	select CLKSRC_OF
 	select CLONE_BACKWARDS3
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

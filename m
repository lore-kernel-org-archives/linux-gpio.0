From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 15/23] x86: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:13 +0200
Message-ID: <1461142701-21096-16-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36148 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754972AbcDTI7E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:04 -0400
Received: by mail-lb0-f171.google.com with SMTP id ys16so5549143lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:03 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

This replaces:

- "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB" as this can
  now be selected directly.

- "select ARCH_WANT_OPTIONAL_GPIOLIB" with no dependency: GPIOLIB
  is now selectable by everyone, so we need not declare our
  intent to select it.

When ordering the symbols the following rationale was used:
if the selects were in alphabetical order, I moved select GPIOLIB
to be in alphabetical order, but if the selects were not
maintained in alphabetical order, I just replaced
"select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB".

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
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
 arch/x86/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2dc18605831f..1f9740fcbe13 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -49,7 +49,6 @@ config X86
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION	if X86_32
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select BUILDTIME_EXTABLE_SORT
 	select CLKEVT_I8253
 	select CLKSRC_I8253			if X86_32
@@ -645,7 +644,7 @@ config STA2X11
 	select X86_DMA_REMAP
 	select SWIOTLB
 	select MFD_STA2X11
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	default n
 	---help---
 	  This adds support for boards based on the STA2X11 IO-Hub,
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

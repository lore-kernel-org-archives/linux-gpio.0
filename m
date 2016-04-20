From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 18/23] metag: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:16 +0200
Message-ID: <1461142701-21096-19-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:36178 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754985AbcDTI7K (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:10 -0400
Received: by mail-lb0-f169.google.com with SMTP id ys16so5550416lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:09 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, James Hogan <james.hogan@imgtec.com>, linux-metag@vger.kernel.org

This symbols is not needed to get access to selecting the
GPIOLIB anymore: any arch can select GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: linux-metag@vger.kernel.org
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
 arch/metag/Kconfig.soc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/metag/Kconfig.soc b/arch/metag/Kconfig.soc
index 973640f46752..50f979c2b02d 100644
--- a/arch/metag/Kconfig.soc
+++ b/arch/metag/Kconfig.soc
@@ -16,7 +16,6 @@ config META21_FPGA
=20
 config SOC_TZ1090
 	bool "Toumaz Xenif TZ1090 SoC (Comet)"
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select IMGPDC_IRQ
 	select METAG_LNKGET_AROUND_CACHE
 	select METAG_META21
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

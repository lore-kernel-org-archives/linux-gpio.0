From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 14/23] unicore: do away with ARCH_REQUIRE_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:12 +0200
Message-ID: <1461142701-21096-15-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33969 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754638AbcDTI7D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:59:03 -0400
Received: by mail-lb0-f181.google.com with SMTP id b1so4858421lbi.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:59:01 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Guan Xuetao <gxt@mprc.pku.edu.cn>

Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
as this can now be selected directly.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
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
 arch/unicore32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index e5602ee9c610..0769066929c6 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -80,7 +80,7 @@ config ARCH_PUV3
 	select CPU_UCV2
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CLK
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
=20
 # CONFIGs for ARCH_PUV3
=20
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

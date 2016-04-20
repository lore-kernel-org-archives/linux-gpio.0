From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 02/23] arc: select GPIOLIB directly
Date: Wed, 20 Apr 2016 10:58:00 +0200
Message-ID: <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:36016 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932753AbcDTI6h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:37 -0400
Received: by mail-lb0-f176.google.com with SMTP id ys16so5543350lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:36 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org

Instead of indirectly selecting GPIOLIB via the
ARCH_REQUIRE_GPIOLIB symbol, just select GPIOLIB.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
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
 arch/arc/plat-axs10x/Kconfig | 2 +-
 arch/arc/plat-tb10x/Kconfig  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfi=
g
index 426ac4b8bb39..c54d1ae57fe0 100644
--- a/arch/arc/plat-axs10x/Kconfig
+++ b/arch/arc/plat-axs10x/Kconfig
@@ -13,7 +13,7 @@ menuconfig ARC_PLAT_AXS10X
 	select OF_GPIO
 	select MIGHT_HAVE_PCI
 	select GENERIC_IRQ_CHIP
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	help
 	  Support for the ARC AXS10x Software Development Platforms.
=20
diff --git a/arch/arc/plat-tb10x/Kconfig b/arch/arc/plat-tb10x/Kconfig
index d14b3d3c5dfd..149e0917645d 100644
--- a/arch/arc/plat-tb10x/Kconfig
+++ b/arch/arc/plat-tb10x/Kconfig
@@ -21,7 +21,7 @@ menuconfig ARC_PLAT_TB10X
 	select PINCTRL
 	select PINCTRL_TB10X
 	select PINMUX
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	select GPIO_TB10X
 	select TB10X_IRQC
 	help
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

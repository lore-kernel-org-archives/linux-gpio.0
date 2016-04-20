From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 04/23] arm64: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:02 +0200
Message-ID: <1461142701-21096-5-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33248 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932391AbcDTI6m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:42 -0400
Received: by mail-lf0-f52.google.com with SMTP id e190so36779304lfe.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:41 -0700 (PDT)
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>

This replaces:

- "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB" as this can
  now be selected directly.

- "select ARCH_WANT_OPTIONAL_GPIOLIB" with no dependency: GPIOLIB
  is now selectable by everyone, so we need not declare our
  intent to select it.

Cc: Michael B=C3=BCsch <m@bues.ch>
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
 arch/arm64/Kconfig           |  1 -
 arch/arm64/Kconfig.platforms | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 4f436220384f..e2286808ad30 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -11,7 +11,6 @@ config ARM64
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
index efa77c146415..639539d2a811 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -15,15 +15,15 @@ config ARCH_ALPINE
 config ARCH_BCM_IPROC
 	bool "Broadcom iProc SoC Family"
 	select COMMON_CLK_IPROC
+	select GPIOLIB
 	select PINCTRL
-	select ARCH_REQUIRE_GPIOLIB
 	help
 	  This enables support for Broadcom iProc based SoCs
=20
 config ARCH_BERLIN
 	bool "Marvell Berlin SoC Family"
-	select ARCH_REQUIRE_GPIOLIB
 	select DW_APB_ICTL
+	select GPIOLIB
 	select PINCTRL
 	help
 	  This enables support for Marvell Berlin SoC Family
@@ -82,7 +82,7 @@ config ARCH_QCOM
 config ARCH_ROCKCHIP
 	bool "Rockchip Platforms"
 	select ARCH_HAS_RESET_CONTROLLER
-	select ARCH_REQUIRE_GPIOLIB
+	select GPIOLIB
 	select PINCTRL
 	select PINCTRL_ROCKCHIP
 	select ROCKCHIP_TIMER
@@ -122,11 +122,11 @@ config ARCH_STRATIX10
 config ARCH_TEGRA
 	bool "NVIDIA Tegra SoC Family"
 	select ARCH_HAS_RESET_CONTROLLER
-	select ARCH_REQUIRE_GPIOLIB
 	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select CLKSRC_OF
 	select GENERIC_CLOCKEVENTS
+	select GPIOLIB
 	select HAVE_CLK
 	select PINCTRL
 	select RESET_CONTROLLER
@@ -151,8 +151,8 @@ config ARCH_UNIPHIER
=20
 config ARCH_VEXPRESS
 	bool "ARMv8 software model (Versatile Express)"
-	select ARCH_REQUIRE_GPIOLIB
 	select COMMON_CLK_VERSATILE
+	select GPIOLIB
 	select POWER_RESET_VEXPRESS
 	select VEXPRESS_CONFIG
 	help
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

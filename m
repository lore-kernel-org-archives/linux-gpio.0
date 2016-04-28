From: kamlakant.patel@broadcom.com
Subject: [PATCH] arm64: vulcan: enable GPIOLIB in Kconfig
Date: Thu, 28 Apr 2016 10:32:47 +0530
Message-ID: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:38515 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792AbcD1FNR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 01:13:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, "Jayachandran C ." <jchandra@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

Add select GPIOLIB in Kconfig for Broadcom Vulcan ARM64 GPIO driver.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
 arch/arm64/Kconfig.platforms |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index efa77c1..b52a5c3 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -161,6 +161,7 @@ config ARCH_VEXPRESS
 
 config ARCH_VULCAN
 	bool "Broadcom Vulcan SOC Family"
+	select GPIOLIB
 	help
 	  This enables support for Broadcom Vulcan SoC Family
 
-- 
1.7.1


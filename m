From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v5 1/2] ARM: hip04: add GPIO configure in hisi_defconfig
Date: Wed, 24 Dec 2014 17:23:35 +0800
Message-ID: <1419413016-31932-2-git-send-email-wangzhou.bry@gmail.com>
References: <1419413016-31932-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:38785 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751479AbaLXJZT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Dec 2014 04:25:19 -0500
Received: by mail-pa0-f52.google.com with SMTP id eu11so9733095pac.11
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2014 01:25:18 -0800 (PST)
In-Reply-To: <1419413016-31932-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>

The GPIO controller of Hisilicon hip04 Soc uses the IP from Sysnopsis,
gpio-dwapb.c can be reused to support this GPIO controller. This patch
adds related configure item in hisi_defconfig.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 arch/arm/configs/hisi_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 1125436..4a50862 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -50,6 +50,7 @@ CONFIG_GPIO_SYSFS=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_GPIO_DWAPB=y
 CONFIG_MFD_SYSCON=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_DRM=y
-- 
1.7.9.5


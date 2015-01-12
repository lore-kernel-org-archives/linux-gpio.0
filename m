From: Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH v6 1/2] ARM: hip04: add GPIO configure in hisi_defconfig
Date: Mon, 12 Jan 2015 15:05:11 +0800
Message-ID: <1421046312-22170-2-git-send-email-wangzhou1@hisilicon.com>
References: <1421046312-22170-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([119.145.14.64]:7458 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331AbbALHFS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jan 2015 02:05:18 -0500
In-Reply-To: <1421046312-22170-1-git-send-email-wangzhou1@hisilicon.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, liguozhu@hisilicon.com, Zhou Wang <wangzhou1@hisilicon.com>

The GPIO controller of Hisilicon hip04 Soc uses the IP from Sysnopsis,
gpio-dwapb.c can be reused to support this GPIO controller. This patch
adds related configure item in hisi_defconfig.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 arch/arm/configs/hisi_defconfig | 1 +
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
1.9.1


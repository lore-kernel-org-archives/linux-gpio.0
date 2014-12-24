From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v5 0/2] ARM: hip04: add GPIO support
Date: Wed, 24 Dec 2014 17:23:34 +0800
Message-ID: <1419413016-31932-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:41044 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751479AbaLXJZJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Dec 2014 04:25:09 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so9752030pab.32
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2014 01:25:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>

This series add the support for the GPIOs of Hisilicon Soc hip04. Hip04 uses
synopsis' GPIO IP, and we use the dwapb GPIO driver here. This series add the
corresponding dts. The default value of ARCH_NR_GPIOS is used to find gpio
base here.

Change in v5:
- Base on v3.19-rc1
- Just use default value of ARCH_NR_GPIOS to find gpio base. Remove the new
  added patch(3/4) in v4.
Change in v4:
- Delete "default 128 if ARCH_HIP04" in arch/arm/Kconfig
- add a new patch to support find GPIO base number in increasing order
- add gpio-number-forward property in snps gpio binding doc
Change in v3:
- Move CONFIG_GPIO_DWAPB to hisi_defconfig
- Add CONFIG_GPIOLIB, CONFIG_GPIO_SYSFS in hisi_defconfig
Change in v2:
- Add select GPIO_DWAPB in arch/arm/mach-hisi/Kconfig

Link for v4:
- http://www.spinics.net/lists/arm-kernel/msg383883.html
Link for v3:
- http://www.spinics.net/lists/devicetree/msg60324.html

Zhou Wang (2):
  ARM: hip04: add GPIO configure in hisi_defconfig
  ARM: dts: hip04: add GPIO pieces

 arch/arm/boot/dts/hip04.dtsi    |   77 +++++++++++++++++++++++++++++++++++++++
 arch/arm/configs/hisi_defconfig |    1 +
 2 files changed, 78 insertions(+)

-- 
1.7.9.5


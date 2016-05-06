From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Fri,  6 May 2016 07:21:19 -0700
Message-ID: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33546 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757430AbcEFOV2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2016 10:21:28 -0400
Received: by mail-pa0-f48.google.com with SMTP id xk12so48437067pac.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 May 2016 07:21:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-meson@googlegroups.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Add support for several more devices, both in the EE domain and in the
AO domain.  Also, add the pins to the corresponding DTS files.

Tested on odroid-c2 and Amlogic P200 boards, and verified with working
ethernet.

Depends on the initial GXBB pinctrl support from Carlo[1].  Also
available in my git tree[2] with all the dependencies included.

Kevin

[1] [PATCH v2 0/4] Amlogic: GXBB: Add pin controller
    http://lists.infradead.org/pipermail/linux-arm-kernel/2016-May/426718.html
[2] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux.git/log/?h=amlogic/wip/pinctrl

Kevin Hilman (7):
  pinctrl: amlogic: gxbb: add UART_AO_B, I2C
  pinctrl: amlogic: gxbb: add EMMC and SD pins
  pinctrl: amlogic: gxbb: add more UART pins
  pinctrl amlogic: gxbb: add ethernet pins
  ARM64: dts: amlogic: add pins for EMMC, SD
  ARM64: dts: amlogic: gxbb: pinctrl: add/update UART
  ARM64: dts: amlogic: gxbb: add ethernet

 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  97 +++++++++++-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         | 167 ++++++++++++++++++++-
 4 files changed, 273 insertions(+), 5 deletions(-)

-- 
2.7.4


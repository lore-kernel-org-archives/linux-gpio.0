From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFT PATCH 0/6] pinctrl: meson: Fix gpio-ranged for GPIO Hog
Date: Thu, 23 Mar 2017 17:27:23 +0100
Message-ID: <1490286449-19448-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:32853 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932939AbdCWQ1j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 12:27:39 -0400
Received: by mail-wr0-f172.google.com with SMTP id y90so33438553wrb.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 09:27:38 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Whem trying to add a gpio hog to enable the USB Hub on the Odroid-C2, I
encountered a strange bug where when calling gpiochip_add_data() the gpiolib
code was trying to add the Hog but failed because the gpio ranges were missing.

In the meson-pinctrl driver, the gpio ranges are added manually /after/ the
call to gpiochip_add_data().
The arch/arm meson8 and meson8b patches has not been tested, this is why this
patchset is an RFT.

So this patchset uses the DT gpio-ranges attribute instead and solves the issue.

The final patch is the actual GPIO Hog for the Odroid-C2 board, which is an ugly
hack but is necessary to have USB Ports working on the board until the generic
power sequence framework is merged.

Neil Armstrong (6):
  ARM64: dts: meson-gxbb: Add gpio-ranges properties
  ARM64: dts: meson-gxl: Add gpio-ranges properties
  ARM: dts: meson8: Add gpio-ranges properties
  ARM: dts: meson8b: Add gpio-ranges properties
  pinctrl: meson: use gpio-ranges from DT
  ARM64: dts: meson-gxbb: Add USB Hub GPIO hog

 arch/arm/boot/dts/meson8.dtsi                       |  2 ++
 arch/arm/boot/dts/meson8b.dtsi                      |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi         |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi          |  2 ++
 drivers/pinctrl/meson/pinctrl-meson.c               | 14 +-------------
 6 files changed, 24 insertions(+), 13 deletions(-)

-- 
1.9.1


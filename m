From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] add support for the SDIO pins on GXBB
Date: Sun, 28 Aug 2016 18:47:23 +0200
Message-ID: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33909 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755394AbcH1Qre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Aug 2016 12:47:34 -0400
Received: by mail-wm0-f68.google.com with SMTP id q128so6486310wma.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2016 09:47:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This series adds the pins for the SDIO controller (sd_emmc_a) found on
Meson GXBB SoCs.


Martin Blumenstingl (2):
  pinctrl: meson-gxbb: add the pins for the SDIO/sd_emmc_a controller
  ARM64: dts: meson-gxbb: add the SDIO pins

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 12 ++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.9.3


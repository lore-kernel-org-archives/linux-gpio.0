From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: meson: Add SPICC pins
Date: Mon, 22 May 2017 14:59:24 +0200
Message-ID: <1495457966-2359-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:34304 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933497AbdEVM7w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 08:59:52 -0400
Received: by mail-wr0-f169.google.com with SMTP id l9so38093791wre.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 05:59:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

This serie adds the SPICC controller pin for GXBB and GXL pinctrl drivers.

Neil Armstrong (2):
  pinctrl: meson-gxl: Add SPI pins for the SPICC controller
  pinctrl: meson-gxbb: Add SPI pins for SPICC controller

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 14 ++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

-- 
1.9.1


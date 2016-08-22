From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH 0/2] pinctrl: meson-gxbb: Export pins for PWMs
Date: Mon, 22 Aug 2016 16:40:58 +0200
Message-ID: <1471876860-5620-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:35396 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754903AbcHVOlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 10:41:12 -0400
Received: by mail-wm0-f41.google.com with SMTP id f65so123764777wmi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 07:41:06 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Add PWM pins in the meson-gxbb pinctrl driver and export then in the GXBB dtsi.

Resent rebased on git.linaro.org/people/linus.walleij/linux-pinctrl.git branch devel.

Neil Armstrong (2):
  pinctrl: meson-gxbb: add pins for PWM
  ARM64: dts: meson-gxbb: Add PWM pinctrl nodes

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 77 ++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 78 +++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+)

-- 
1.9.1


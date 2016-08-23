From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/2] pinctrl: meson-gxbb: Export pins for PWMs
Date: Tue, 23 Aug 2016 13:25:06 +0200
Message-ID: <1471951508-29620-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38416 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753622AbcHWLZP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2016 07:25:15 -0400
Received: by mail-wm0-f41.google.com with SMTP id o80so189917313wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Aug 2016 04:25:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Add PWM pins in the meson-gxbb pinctrl driver and export then in the GXBB dtsi.

Changes since v1 at http://lkml.kernel.org/r/1471870450-11109-1-git-send-email-narmstrong@baylibre.com :
 - Rebased on git.linaro.org/people/linus.walleij/linux-pinctrl.git branch devel
 - Fixed previous rebase send on resend

Neil Armstrong (2):
  pinctrl: meson-gxbb: add pins for PWM
  ARM64: dts: meson-gxbb: Add PWM pinctrl nodes

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 77 ++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 79 +++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

-- 
1.9.1


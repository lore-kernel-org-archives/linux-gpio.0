From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: meson: Add missing GPIODV_18 pin for GXBB and GXL
Date: Tue, 23 May 2017 16:09:17 +0200
Message-ID: <1495548559-22261-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38193 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936266AbdEWOJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 10:09:32 -0400
Received: by mail-wm0-f50.google.com with SMTP id e127so30088444wmg.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 07:09:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

For unknown reasons, GPIODV_18 pin was missing in the GXBB driver and then
was copied into the GXL driver.
This patchset fixes the pin list for GXBB and GXL.

Neil Armstrong (2):
  pinctrl: meson-gxl: Add missing GPIODV_18 pin entry
  pinctrl: meson-gxbb: Add missing GPIODV_18 pin entry

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1


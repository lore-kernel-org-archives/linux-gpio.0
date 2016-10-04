From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] pinctrl: oxnas: Add Support for OX820
Date: Tue,  4 Oct 2016 15:41:45 +0200
Message-ID: <20161004134148.23028-1-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35515 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750839AbcJDNmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 09:42:04 -0400
Received: by mail-wm0-f43.google.com with SMTP id f193so168760233wmg.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 06:42:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-oxnas@lists.tuxfamily.org

This patchset adds support for the Oxford Semiconductor OX820 SoC Pinctrl
registers along he OX810 Pinctrl support.
The GPIO control registers are common enough to leave the code untouched.

Neil Armstrong (3):
  pinctrl: oxnas: Move OX810SE specific function and structure as
    separate
  pinctrl: oxnas: Add support for OX820
  dt-bindings: oxnas: Update Pinctrl and GPIO for OX820 Support

 .../devicetree/bindings/gpio/gpio_oxnas.txt        |   2 +-
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |   2 +-
 drivers/pinctrl/pinctrl-oxnas.c                    | 605 ++++++++++++++++++---
 3 files changed, 534 insertions(+), 75 deletions(-)

-- 
2.7.0


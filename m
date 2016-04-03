From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: Oxford Semiconductor OXNAS pinctrl and gpio support
Date: Sun,  3 Apr 2016 15:26:07 +0200
Message-ID: <1459689969-5326-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:34367 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566AbcDCN0e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Apr 2016 09:26:34 -0400
Received: by mail-qk0-f181.google.com with SMTP id r184so19272027qkc.1
        for <linux-gpio@vger.kernel.org>; Sun, 03 Apr 2016 06:26:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>

This patchset includes support for the pinctrl and gpio controller of the
Oxford Semiconductor OXNAS SoC Family.

It was originally posted part of a platform patchset available here :
http://lkml.kernel.org/r/1458838215-23314-1-git-send-email-narmstrong@baylibre.com

Changes this v3 patchset :
- Get rid of PLX Technology, replace by Oxford Semiconductor
- Get rid of gpio-bank and ngpios properties, now using gpio-ranges

Neil Armstrong (2):
  pinctrl: Add Oxford Semiconductor OXNAS pinctrl and gpio driver
  dt-bindings: Add Oxford Semiconductor OXNAS pinctrl and gpio bindings

 .../devicetree/bindings/gpio/gpio_oxnas.txt        |  43 ++
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |  57 ++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-oxnas.c                    | 837 +++++++++++++++++++++
 5 files changed, 949 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-oxnas.c

-- 
1.9.1


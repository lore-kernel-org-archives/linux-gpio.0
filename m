From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/2] pinctrl: meson: use one uniform 'function' name
Date: Mon, 8 Jan 2018 15:33:26 +0800
Message-ID: <20180108073328.205769-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:22807 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755778AbeAHHdH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 02:33:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

These two patches are general improvement for meson pinctrl driver.
It make the two pinctrl trees (ee/ao) to share one uniform 'function' name for
one hardware block even its pin groups live inside two differet hardware domains,
which for example EE vs AO domain here.

This idea is motivated by Martin's question at [1]

[1]
 http://lkml.kernel.org/r/CAFBinCCuQ-NK747+GHDkhZty_UMMgzCYOYFcNTrRDJgU8OM=Gw@mail.gmail.com


Yixun Lan (2):
  pinctrl: meson: introduce a macro to have name/groups seperated
  pinctrl: meson-axg: correct the pin expansion of UART_AO_B

 drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson.h     | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.15.1


From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] pinctrl: meson: prepare for new SoC
Date: Mon,  9 Oct 2017 12:17:45 +0200
Message-ID: <20171009101747.16940-1-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:52944 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdJIKRw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 06:17:52 -0400
Received: by mail-wm0-f52.google.com with SMTP id k4so21965190wmc.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2017 03:17:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

The goal of this patchset is to prepare meson pinctrl driver to
add a new meson SoC support. This new SoC will share the same pinconf/gpio
registers but the pinmux part will be slightly different.

First patch allows to compile and ship only the necessary pinctrl drivers,
depending on the architecture and configuration needs. This should save
a bit of memory.

Second patch provide a way to deal with a different pinmux scheme, while
reusing most of the meson pinctrl driver.

Linus, this series depends on
* The offset clean-up series you've already merged [0]
* the fixup regarding pin_base [1]

[0]: https://lkml.kernel.org/r/20170920133927.17390-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20171006085407.27905-1-jbrunet@baylibre.com

Jerome Brunet (2):
  pinctrl: meson: separate soc drivers
  pinctrl: meson: rework pinmux ops

 drivers/pinctrl/Kconfig                    |  11 +--
 drivers/pinctrl/meson/Kconfig              |  43 +++++++++
 drivers/pinctrl/meson/Makefile             |   9 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson-pmx.c  | 107 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-pmx.h  |  48 ++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c      | 147 ++---------------------------
 drivers/pinctrl/meson/pinctrl-meson.h      |  42 +++------
 drivers/pinctrl/meson/pinctrl-meson8.c     |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson8b.c    |  28 +++++-
 11 files changed, 333 insertions(+), 186 deletions(-)
 create mode 100644 drivers/pinctrl/meson/Kconfig
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-pmx.h

-- 
2.13.6


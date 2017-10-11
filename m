From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] pinctrl: meson: prepare for new SoC
Date: Wed, 11 Oct 2017 14:02:28 +0200
Message-ID: <20171011120230.30483-1-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:45627 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751945AbdJKMCh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 08:02:37 -0400
Received: by mail-wm0-f48.google.com with SMTP id q124so4069370wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 05:02:37 -0700 (PDT)
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

Linus, FYI, this series depends on the meson changes you have already
merged in this cycle.

Change since v1: [0]
* Use of_device_get_match_data() in patch
* Change pmx naming scheme for the SoC parts

[0]: https://lkml.kernel.org/r/20171009101747.16940-1-jbrunet@baylibre.com

Jerome Brunet (2):
  pinctrl: meson: separate soc drivers
  pinctrl: meson: rework pinmux ops

 drivers/pinctrl/Kconfig                    |  11 +--
 drivers/pinctrl/meson/Kconfig              |  43 +++++++++
 drivers/pinctrl/meson/Makefile             |   9 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson.c      | 150 +++--------------------------
 drivers/pinctrl/meson/pinctrl-meson.h      |  42 +++-----
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 108 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h |  48 +++++++++
 drivers/pinctrl/meson/pinctrl-meson8.c     |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson8b.c    |  28 +++++-
 11 files changed, 335 insertions(+), 188 deletions(-)
 create mode 100644 drivers/pinctrl/meson/Kconfig
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.h

-- 
2.13.6


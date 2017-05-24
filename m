From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] pinctrl: meson: new pins and fixes round 2
Date: Wed, 24 May 2017 10:20:37 +0200
Message-ID: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patchset follow [1] ("pinctrl: meson: Add SPICC pins") and [2]
("pinctrl: meson: Add missing GPIODV_18 pin for GXBB and GXL") to :
 - Add the CEC pins for GXL and GXBB
 - Add the GXL PHY link/activity leds pins
 - Fix typo for the GXL I2S/SPDIF pins

[1] http://lkml.kernel.org/r/1495457966-2359-1-git-send-email-narmstrong@baylibre.com
[2] http://lkml.kernel.org/r/1495548559-22261-1-git-send-email-narmstrong@baylibre.com

Neil Armstrong (5):
  pinctrl: meson-gxl: Fix typo in AO I2S pins
  pinctrl: meson-gxl: Fix typo in AO SPDIF pins
  pinctrl: meson-gxbb: Add CEC pins
  pinctrl: meson-gxl: Add CEC pins
  pinctrl: meson-gxl: Add Ethernet PHY LEDS pins

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 10 ++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 28 ++++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 4 deletions(-)

-- 
1.9.1

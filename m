From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: meson-gxbb: Export pins for PWMs
Date: Mon, 22 Aug 2016 14:54:08 +0200
Message-ID: <1471870450-11109-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add PWM pins in the meson-gxbb pinctrl driver and export then in the GXBB dtsi.

Neil Armstrong (2):
  ARM64: dts: amlogic: gxbb: pinctrl: add pins for PWM
  ARM64: dts: meson-gxbb: Add PWM pinctrl nodes

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 77 ++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 79 +++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

-- 
1.9.1

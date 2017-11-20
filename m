From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 0/2] add pinctrl driver for Meson-AXG SoC
Date: Mon, 20 Nov 2017 18:08:23 +0800
Message-ID: <20171120100825.16613-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patchset adds pinctrl support for the Amlogic's Meson-AXG SoC.
  
While the gpio and pin configuration part is the same the as previous
meson SoCs, the pinmux part is different. This requires slightly
different pinmux operations along with the actual pinctrl driver description.

Changes since v1 at [1]:
  -- Rename i2c_m0 to i2c0 style (no logic changed)
  -- Rename uart_tx_ao_XX to uart_ao_tx, etc .. (no logic changed)
  -- Separate DT part patches
  -- Add Neil Armstrong's Ack

[1] 
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005270.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005271.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005272.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005273.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005274.html


Xingyu Chen (2):
  pinctrl: meson-axg: Introduce a pinctrl pinmux ops for Meson-AXG SoC
  pinctrl: meson-axg: Add new pinctrl driver for Meson AXG  SoC

 drivers/pinctrl/meson/Kconfig                 |   9 +
 drivers/pinctrl/meson/Makefile                |   2 +
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 118 ++++
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h |  62 ++
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 975 ++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.h         |   1 +
 include/dt-bindings/gpio/meson-axg-gpio.h     | 116 +++
 7 files changed, 1283 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg.c
 create mode 100644 include/dt-bindings/gpio/meson-axg-gpio.h

-- 
2.15.0

From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] pinctrl: meson: gpio: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:41:03 +0200
Message-ID: <20190520144108.3787-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Update the SPDX Licence identifier for the Amlogic Pinctrl drivers and
the corresponding GPIO dt-bindings headers.

Neil Armstrong (5):
  pinctrl: meson: update with SPDX Licence identifier
  dt-bindings: gpio: meson-gxbb-gpio: update with SPDX Licence
    identifier
  dt-bindings: gpio: meson-gxl-gpio: update with SPDX Licence identifier
  dt-bindings: gpio: meson8-gpio: update with SPDX Licence identifier
  dt-bindings: gpio: meson8b-gpio: update with SPDX Licence identifier

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.c      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.h      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8.c     | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 8 +-------
 include/dt-bindings/gpio/meson-gxbb-gpio.h | 8 +-------
 include/dt-bindings/gpio/meson-gxl-gpio.h  | 8 +-------
 include/dt-bindings/gpio/meson8-gpio.h     | 8 +-------
 include/dt-bindings/gpio/meson8b-gpio.h    | 8 +-------
 12 files changed, 12 insertions(+), 84 deletions(-)

-- 
2.21.0

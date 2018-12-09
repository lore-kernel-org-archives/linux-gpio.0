From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/6] pinctrl: various fixes for Meson8 and Meson8b SoCs
Date: Sun,  9 Dec 2018 20:50:49 +0100
Message-ID: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

While debugging an USB issue on my Odroid-C1 I found a few issues with
the pinctrl driver for the Meson8 and Meson8b SoCs:
- GPIOAO pins cannot be specified as GPIO group in device-tree
- (not a bugfix bug an improvement) make the gpio_periphs group naming
  consistent with drivers for newer SoCs
- add missing GPIO_GROUP definitions for the pins in the BOOT and CARD
  banks

I added the correct "Fixes" tag to all commits where applicable. These
fixes don't affect any existing boards or functionality. Thus I suggest
to apply them for next (v4.21) instead of sending them to mainline.


Martin Blumenstingl (6):
  pinctrl: meson: meson8: fix the GPIO function for the GPIOAO pins
  pinctrl: meson: meson8b: fix the GPIO function for the GPIOAO pins
  pinctrl: meson: meson8: rename the "gpio" function to "gpio_periphs"
  pinctrl: meson: meson8: rename the "gpio" function to "gpio_periphs"
  pinctrl: meson: meson8: add the missing GPIO_GROUPs for BOOT and CARD
  pinctrl: meson: meson8b: add the missing GPIO_GROUPs for BOOT and CARD

 drivers/pinctrl/meson/pinctrl-meson8.c  | 33 ++++++++++++++++--
 drivers/pinctrl/meson/pinctrl-meson8b.c | 45 +++++++++++++++++++++----
 2 files changed, 69 insertions(+), 9 deletions(-)

-- 
2.19.2

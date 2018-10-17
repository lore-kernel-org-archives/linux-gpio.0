From: Kun Yi <kunyi@google.com>
Subject: [PATCH 0/2] Allow gpio-mmio to co-exist with pinctrl driver
Date: Wed, 17 Oct 2018 14:30:10 -0700
Message-ID: <20181017213012.233957-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tmaimon77@gmail.com
Cc: linux-kernel@vger.kernel.org, avifishman70@gmail.com, openbmc@lists.ozlabs.org, Kun Yi <kunyi@google.com>
List-Id: linux-gpio@vger.kernel.org

This patchset is to resolve an issue found with Nuvoton pinctrl driver
when it uses a generic GPIO interface. Since the generic GPIO driver
stores the bgpio_data and bgpio_dir shadow register values and later on
modify based on the stored values, any change to the pin states in
between by the pinctrl driver is lost.

Kun Yi (2):
  gpio: gpio-mmio: Allow volatile shadow regs
  pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG

 drivers/gpio/gpio-mmio.c                  | 50 +++++++++++++++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  3 +-
 include/linux/gpio/driver.h               |  2 +
 3 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.19.1.331.ge82ca0e54c-goog

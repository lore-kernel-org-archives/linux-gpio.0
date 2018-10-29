From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] pinctrl: meson: fix pull bits
Date: Mon, 29 Oct 2018 16:13:36 +0100
Message-ID: <20181029151340.9087-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patchset fixes the inversion between pull (up/down) and pull enable
bits on the GPIO AO bank of all amlogic when have, except the axg family.

The problem has been found while testing bias setting on the libretech
aml-s905x-cc on GPIO_AO 5. Unfortunately the bias register of this bank is
not described in the public datasheet of the s905x, but it is in the
one of the A113D, which gave a clue.

This was tested on gxl libretech aml-s905x-cc. Since all Amlogic we have
got so far derive from each other, there is no reason for things to be
any different on the meson8(b).

I would have preferred to make a single patch to fix this but the commit
introducing the mistake the is different for each SoC, so a single patch
could be more difficult/annoying to backport.

Jerome Brunet (4):
  pinctrl: meson: fix gxbb ao pull register bits
  pinctrl: meson: fix gxl ao pull register bits
  pinctrl: meson: fix meson8 ao pull register bits
  pinctrl: meson: fix meson8b ao pull register bits

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 2 +-
 drivers/pinctrl/meson/pinctrl-meson8.c     | 2 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.2

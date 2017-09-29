From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 29 Sep 2017 11:14:59 +0100
Message-ID: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

This series add support for muxing individual pins within
pin mux, rather than just whole groups. Mainly, I had two
motivations here, one to avoid the need to add loads of groups
containing individual pins and hardware that actually has some
internal concept of groups of pins, and disambiguating that from
individual pin muxing.  I have marked it as RFC to just get
peoples opinions at this stage, although it should be pretty well
tested. Sorry about the amount of files touched in patch 2 it
would be possible to drop it from the chain although it leaves
the field rather inaccurately named.

Also I have left all the existing code paths parsing all mux
options as groups from DT, and added a new helper to unlock the
pin based functionality this should ease the transition across.

Thanks,
Charles

Charles Keepax (4):
  pinctrl: Factor out individual pin handling from pinmux_pins_show
  pinctrl: Rename mux group to group_or_pin to prepare for pin support
  pinctrl: Add support for muxing individual pins
  pinctrl: Add support for parsing individual pinmux from DT

 drivers/pinctrl/bcm/pinctrl-bcm2835.c         |   2 +-
 drivers/pinctrl/core.c                        |  26 ++-
 drivers/pinctrl/core.h                        |   3 +-
 drivers/pinctrl/freescale/pinctrl-imx.c       |   5 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |   5 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c       |   4 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   2 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         |   2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |   2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |   2 +-
 drivers/pinctrl/pinconf-generic.c             |  30 ++-
 drivers/pinctrl/pinctrl-at91.c                |   5 +-
 drivers/pinctrl/pinctrl-lantiq.c              |   2 +-
 drivers/pinctrl/pinctrl-rockchip.c            |   5 +-
 drivers/pinctrl/pinctrl-rza1.c                |   2 +-
 drivers/pinctrl/pinctrl-single.c              |   4 +-
 drivers/pinctrl/pinctrl-st.c                  |   2 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c          |   2 +-
 drivers/pinctrl/pinctrl-tz1090.c              |   2 +-
 drivers/pinctrl/pinctrl-utils.c               |  10 +-
 drivers/pinctrl/pinctrl-utils.h               |  14 +-
 drivers/pinctrl/pinmux.c                      | 311 ++++++++++++++++++--------
 drivers/pinctrl/samsung/pinctrl-exynos5440.c  |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c              |   2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c         |   3 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c           |   2 +-
 drivers/pinctrl/spear/pinctrl-spear.c         |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |   2 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c          |   2 +-
 include/linux/pinctrl/machine.h               |   3 +-
 include/linux/pinctrl/pinconf-generic.h       |  24 +-
 include/linux/pinctrl/pinmux.h                |   7 +
 34 files changed, 338 insertions(+), 159 deletions(-)

-- 
2.11.0

From: <patrice.chotard@st.com>
Subject: [PATCH v2 00/10] STMPE fixes/rework and add STMPE1600 support
Date: Thu, 28 Apr 2016 14:12:59 +0200
Message-ID: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, thierry.reding@gmail.com, gnurou@gmail.com, Patrice Chotard <patrice.chotard@st.com>, marcel.ziswiler@toradex.com, stefan@agner.ch, dev@lynxeye.de
List-Id: linux-gpio@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>


This series cleans and fixes some bugs in MFD/GPIO STMPE drivers and prepare
 the ground to add new STMPE1600 support.

STMPE1600 datasheet is available here : 
http://www2.st.com/content/st_com/en/products/interfaces-and-transceivers/
i-o-expanders-and-level-translators/i-o-expanders/stmpe1600.html

Only STMPE1600 has been tested on STM32 platform. As i have no board with
others STMPE variant(STMPE610/STMPE801/STMPE811/STMPE1601/STMPE1801/STMPE2401
and STMPE2403), i put in CC boards's maintainers which are using others STMPE variant.

If they can kindly check that no regression has been introduce by this series
:

For ARM/FREESCALE IMX / MXC ARM ARCHITECTURE:
	_ Shawn Guo <shawnguo@kernel.org>
	_ Sascha Hauer <kernel@pengutronix.de>

For ARM/SOCFPGA ARCHITECTURE
	_ Dinh Nguyen <dinguyen@opensource.altera.com>

For SPEAR PLATFORM SUPPORT
	_ Viresh Kumar <vireshk@kernel.org>
	_ Shiraz Hashim <shiraz.linux.kernel@gmail.com>

For Apalis/Colibri board SUPPORT
	_ marcel.ziswiler@toradex.com
	_ stefan@agner.ch
	_ dev@lynxeye.de
	_ Thierry Reding <thierry.reding@gmail.com>
	_ Alexandre Courbot <gnurou@gmail.com>

For ARM/Ux500 ARM ARCHITECTURE
	_ Linus Walleij <linus.walleij@linaro.org>


v1 => v2:
	_ update Cc list
	_ fix kbuild test robot warnings on original patch 3
	_ split patch 6 to extract usage of generic bitmask name
	_ split patch 6 and 7 and introduce a new way to access registers
	  for both mfd/stmpe and gpio/gpio-stmpe drivers.
	_ remove patch 8

Patrice Chotard (10):
  mfd: stmpe: Add STMPE_IDX_SYS_CTRL/2 enum
  mfd: stmpe: Add reset support for all STMPE variant
  gpio: stmpe: fix edge and rising/falling edge detection
  gpio: stmpe: write int status register only when needed
  mfd: stmpe: use generic bit mask name
  mfd: stmpe: rework registers access
  gpio: stmpe: rework registers access
  Documentation: dt: add stmpe1600 compatible string to stmpe mfd
  mfd: Add STMPE1600 support
  gpio: stmpe: Add STMPE1600 support

 Documentation/devicetree/bindings/mfd/stmpe.txt |   2 +-
 drivers/gpio/gpio-stmpe.c                       | 167 +++++++++++++++++-------
 drivers/mfd/stmpe-i2c.c                         |   2 +
 drivers/mfd/stmpe.c                             | 161 +++++++++++++++++++----
 drivers/mfd/stmpe.h                             |  85 ++++++++++--
 include/linux/mfd/stmpe.h                       |  21 +++
 6 files changed, 352 insertions(+), 86 deletions(-)

-- 
1.9.1

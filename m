From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 0/6] pinctrl: imx: add imx8qxp pinctrl support
Date: Sat, 28 Apr 2018 03:01:47 +0800
Message-ID: <1524855713-15527-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: aisheng.dong@nxp.com, dongas86@gmail.com, linus.walleij@linaro.org, stefan@agner.ch, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This patch series adds i.MX8QXP pinctrl support which is based
on the pad service provided by SCU firmware.
It depends on SCU APIs patch set.

The first three are minor preparation cleanups.

Dong Aisheng (6):
  pinctrl: imx: fix unsigned check if nfuncs with less than or equal
    zero
  pinctrl: pinctrl-imx: improve the code comments of PIN_FUNC_ID
  pinctrl: imx: use seq_puts() instead of seq_printf()
  pinctrl: fsl: add scu based pinctrl support
  dt-bindings: pinctrl: add imx8qxp pinctrl binding doc
  pinctrl: imx: add imx8qxp driver

 .../bindings/pinctrl/fsl,imx8qxp-pinctrl.txt       |  39 ++
 drivers/pinctrl/freescale/Kconfig                  |  11 +
 drivers/pinctrl/freescale/Makefile                 |   2 +
 drivers/pinctrl/freescale/pinctrl-imx.c            | 421 +++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h            |  40 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        | 232 +++++++
 drivers/pinctrl/freescale/pinctrl-scu.c            |  84 +++
 include/dt-bindings/pinctrl/pads-imx8qxp.h         | 751 +++++++++++++++++++++
 8 files changed, 1412 insertions(+), 168 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8qxp-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8qxp.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-scu.c
 create mode 100644 include/dt-bindings/pinctrl/pads-imx8qxp.h

-- 
2.7.4

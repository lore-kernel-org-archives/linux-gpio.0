From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 0/2] pinctrl: imx: add imx8qm pinctrl support
Date: Tue, 18 Dec 2018 15:22:49 +0000
Message-ID: <1545146239-30993-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

This patch series adds i.MX8QM pinctrl support which is based on
the pad service provided by SCU firmware.

Dong Aisheng (2):
  dt-bindings: arm: fsl-scu: add imx8qm pinctrl support
  pinctrl: imx: add imx8qm driver

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |   5 +-
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx8qm.c         | 326 +++++++
 include/dt-bindings/pinctrl/pads-imx8qm.h          | 960 +++++++++++++++++++++
 5 files changed, 1298 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8qm.c
 create mode 100644 include/dt-bindings/pinctrl/pads-imx8qm.h

-- 
2.7.4

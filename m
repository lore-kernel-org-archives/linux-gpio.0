From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 0/2] pinctrl: sunxi: Account for per-bank GPIO regulators
Date: Thu,  6 Dec 2018 15:02:02 +0100
Message-ID: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
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
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

Hi,

Here is a first attempt at getting the regulators properly accounted for
the GPIO banks on the Allwinner SoCs.

The main interogation I have currently is whether we should always try to
get the regulator for the current branch, or if we should restrict it to
the one available on the SoCs.

Let me know what you think,
Maxime

Maxime Ripard (2):
  pinctrl: sunxi: Deal with per-bank regulators
  ARM: dts: sun7i: bananapi: Add GPIO banks regulators

 arch/arm/boot/dts/sun7i-a20-bananapi.dts |  5 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c    | 63 +++++++++++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h    |  6 ++-
 3 files changed, 74 insertions(+)

base-commit: 651022382c7f8da46cb4872a545ee1da6d097d2a
-- 
git-series 0.9.1

From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 00/63] Allow compile testing of most gpio drivers
Date: Tue,  5 Apr 2016 19:35:09 +0200
Message-ID: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:55574 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750946AbcDERgr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Changes in v2:
* Removed patch for OF
  Instead there is an addiditional patch to gpio-sodaville exchanging
  of_property_read_u32 with of_read_number. This was suggested by Rob Herring
  (http://www.spinics.net/lists/devicetree/msg120979.html). As I'm not
  experienced in writing device-tree code for drivers, maybe I can get some
  feedback.
* Add compile test for gpio-tps65086 and gpio-xgene-sb

Now all changes are restricted to GPIO subsystem are available on
https://github.com/AlexanderStein/linux/tree/gpio-compile-test

Alexander Stein (63):
  gpio: gpiolib-of: Allow compile testing
  gpio: tegra: Allow compile test
  gpio: davinci: Allow compile testing
  gpio: em: Allow compile testing
  gpio: ge: Allow compile testing
  gpio: iop: Allow compile testing
  gpio: mvebu: Allow compile testing
  gpio: mxc: Allow compile testing
  gpio: mxs: Allow compile testing
  gpio: omap: Allow compile testing
  gpio: pl061: Allow compile testing
  gpio: pxa: Allow compile testing
  gpio: spear-spics: Allow compile testing
  gpio: sta2x11: Allow compile testing
  gpio: syscon: Allow compile testing
  gpio: tb10x: Allow compile testing
  gpio: vf610: Explicitly include pinctrl consumer header
  gpio: vf610: Allow compile testing
  gpio: xgene: Allow compile testing
  gpio: zynq: Allow compile testing
  gpio: mc9s08dz60: Allow compile testing
  gpio: adp5520: Allow compile testing
  gpio: arizona: Allow compile testing
  gpio: crystalcove: Allow compile testing
  gpio: da9052: Allow compile testing
  gpio: da9055: Allow compile testing
  gpio: dln2: Allow compile testing
  gpio: jantz-ttl: Allow compile testing
  gpio: kempld: Allow compile testing
  gpio: lp3943: Allow compile testing
  gpio: msic: Allow compile testing
  gpio: palmas: Allow compile testing
  gpio: rc5t583: Allow compile testing
  gpio: timberdale: Allow compile testing
  gpio: tps65218: Allow compile testing
  gpio: tps6586x: Allow compile testing
  gpio: tps65910: Allow compile testing
  gpio: tps65912: Allow compile testing
  gpio: twl4030: Allow compile testing
  gpio: twl6040: Allow compile testing
  gpio: ucb1400: Allow compile testing
  gpio: wm831x: Allow compile testing
  gpio: wm8350: Allow compile testing
  gpio: wm8994: Allow compile testing
  gpio: viperboard: Allow compile testing
  gpio: stmpe: Move dependencies to a single line
  gpio: stmpe: Allow compile testing
  gpio: tc3589x: Move dependencies to a single line
  gpio: tc3589x: Allow compile testing
  gpio: ich: Allow compile testing
  gpio: lynxpoint: Allow compile testing
  gpio: vx855: Allow compile testing
  gpio: sch: Allow compile testing
  gpio: bt8xx: Allow compile testing
  gpio: intel-mid: Allow compile testing
  gpio: sodaville: Use of_property_read_u32 instead of of_read_number
  gpio: sodaville: Allow compile testing
  gpio: 74x164: Allow compile testing
  gpio: etraxfs: Allow compile testing
  gpio: grgpio: Allow compile testing
  gpio: mvebu: Allow compile testing
  gpio: tps65086: Allow compile testing
  gpio: xgene-sb: Allow compile testing

 drivers/gpio/Kconfig          | 126 ++++++++++++++++++++++--------------------
 drivers/gpio/Makefile         |   2 +-
 drivers/gpio/gpio-sodaville.c |   7 +--
 drivers/gpio/gpio-vf610.c     |   1 +
 4 files changed, 68 insertions(+), 68 deletions(-)

-- 
2.8.0


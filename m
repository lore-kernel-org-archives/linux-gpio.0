From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH V2 0/5] gpiochip: add and use generic request/free
Date: Sun, 11 Oct 2015 17:34:14 +0200
Message-ID: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54568 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751456AbbJKPii (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:38:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko

A lot of pinctrl aware gpio chip drivers use the following pattern:

int foo_request_gpio(struct gpio_chip *gc, unsigned offset)
{
        return pinctrl_request_gpio(gc->base + offset);
}

void foo_request_gpio(struct gpio_chip *gc, unsigned offset)
{
        pinctrl_free_gpio(gc->base + offset);
}

static struct gpio_chip foo_chip {
        ...
        .request = foo_request_gpio;
        .free = foo_request_gpio;
        ...
};

To prevent this from spreading any further, add and export generic
versions that gpio chip drivers can just use.

* Patch 1 adds the trivial implementations.
* Patch 2 replaces all identical (+/- debug output/comments) versions
  in gpio/
* Patch 3/4 modifies drivers that use a boolean for conditional calling
  request/free by just not populating the callbacks if the boolean is
  false (which is only set at probe)
* Patch 5 replaces all identical version in pinctrl/

Build tested as far as possible (which isn't much when only using
COMPILE_TEST, even when forcing PINCTRL to y).

I don't expect this to break anything, and I triple checked that I did
not introduce any typos, but I can't actually test most of the changed
drivers lacking hardware.

Patches apply cleanly to HEAD of linux-gpio/for-next.

Changes RFT -> V2:
 * rebased onto current HEAD
 * renamed gpio argument of callbacks to offset and reworded the
   description.

Jonas Gorski (5):
  gpiolib: provide generic request/free implementations
  gpio: replace trivial implementations of request/free with generic one
  gpio: gpio-xz: use the generic request/free implementations
  gpio: gpio-pl061: use the generic request/free implementations
  pinctrl: replace trivial implementations of gpio_chip request/free

 drivers/gpio/gpio-lpc18xx.c                   | 14 ++----------
 drivers/gpio/gpio-moxart.c                    | 14 ++----------
 drivers/gpio/gpio-mvebu.c                     | 14 ++----------
 drivers/gpio/gpio-pl061.c                     | 32 ++++-----------------------
 drivers/gpio/gpio-tb10x.c                     | 14 ++----------
 drivers/gpio/gpio-tz1090-pdc.c                | 14 ++----------
 drivers/gpio/gpio-vf610.c                     | 14 ++----------
 drivers/gpio/gpio-zx.c                        | 28 ++++-------------------
 drivers/gpio/gpiolib.c                        | 23 +++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 14 ++----------
 drivers/pinctrl/intel/pinctrl-cherryview.c    | 14 ++----------
 drivers/pinctrl/intel/pinctrl-intel.c         | 14 ++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++----------
 drivers/pinctrl/nomadik/pinctrl-abx500.c      | 18 ++-------------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     | 22 ++----------------
 drivers/pinctrl/pinctrl-adi2.c                | 14 ++----------
 drivers/pinctrl/pinctrl-as3722.c              | 14 ++----------
 drivers/pinctrl/pinctrl-at91.c                | 26 ++--------------------
 drivers/pinctrl/pinctrl-coh901.c              | 22 ++----------------
 drivers/pinctrl/pinctrl-digicolor.c           | 14 ++----------
 drivers/pinctrl/pinctrl-pistachio.c           | 14 ++----------
 drivers/pinctrl/pinctrl-rockchip.c            | 14 ++----------
 drivers/pinctrl/pinctrl-st.c                  | 14 ++----------
 drivers/pinctrl/pinctrl-xway.c                | 18 ++-------------
 drivers/pinctrl/qcom/pinctrl-msm.c            | 16 ++------------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 14 ++----------
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       | 14 ++----------
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 14 ++----------
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 14 ++----------
 drivers/pinctrl/vt8500/pinctrl-wmt.c          | 14 ++----------
 include/linux/gpio/driver.h                   |  3 +++
 31 files changed, 88 insertions(+), 414 deletions(-)

-- 
2.1.4

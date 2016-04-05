From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.6
Date: Tue, 5 Apr 2016 13:52:40 +0200
Message-ID: <CACRpkdahdQ7O8t+gtWo5AV6sg4VKZ_=-aTozxyucK9_SfNBwvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33776 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbcDELwl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 07:52:41 -0400
Received: by mail-oi0-f49.google.com with SMTP id w85so13984447oiw.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 04:52:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is a set of pin control fixes for the v4.6 series. A bit bigger than
what I hoped for, but all fixes are confined to drivers, a few of them also
targeted to stable.

Please pull it in, details in the signed tag!

Yours,
Linus Walleij

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.6-2

for you to fetch changes up to e1641c9d174ee21b4a75a64ab6df9063cf60ac4a:

  Revert "Revert "pinctrl: lantiq: Implement gpio_chip.to_irq""
(2016-04-01 15:21:27 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.6 series:
- On Super-H PFC (Renesas) controllers: only use dummies on
  legacy systems. This fixes a serious ethernet regression on
  a Renesas board.
- Pistachio: Fix errors in the pin table.
- Allwinner SunXi: fix the external interrupts to work.
- Intel: fix so the high level interrupts start working, and
  fix a spurious interrupt issue.
- Qualcomm ipq4019: fix the number of GPIOs provided (bump
  to 100), correct register offsets and handle GPIO mode
  properly.
- Revert the revert on the revert so that Xway has a .to_irq()
  callback again.
- Minor fixes to errorpaths and debug info.
- A MAINTAINERS update.

----------------------------------------------------------------
Govindraj Raja (1):
      pinctrl: pistachio: fix mfio84-89 function description and pinmux.

Hans de Goede (1):
      pinctrl: sunxi: Fix A33 external interrupts not working

Krzysztof Kozlowski (1):
      MAINTAINERS: pinctrl: samsung: Add two new maintainers

Linus Walleij (2):
      pinctrl: nomadik: fix pull debug print inversion
      Revert "Revert "pinctrl: lantiq: Implement gpio_chip.to_irq""

Matthew McClintock (3):
      pinctrl: qcom: ipq4019: set ngpios to correct value
      pinctrl: qcom: ipq4019: fix the function enum for gpio mode
      pinctrl: qcom: ipq4019: fix register offsets

Qi Zheng (1):
      pinctrl: intel: implement gpio_irq_enable

Qipeng Zha (1):
      pinctrl: intel: make the high level interrupt working

Vladimir Zapolskiy (1):
      pinctrl: freescale: imx: fix bogus check of of_iomap() return value

Wolfram Sang (1):
      pinctrl: sh-pfc: only use dummy states for non-DT platforms

 .../bindings/pinctrl/img,pistachio-pinctrl.txt     | 12 ++++----
 MAINTAINERS                                        |  2 ++
 drivers/pinctrl/freescale/pinctrl-imx.c            | 17 +++++------
 drivers/pinctrl/intel/pinctrl-intel.c              | 35 ++++++++++++++++++++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  2 +-
 drivers/pinctrl/pinctrl-pistachio.c                | 24 +++++++--------
 drivers/pinctrl/pinctrl-xway.c                     | 17 +++++++++++
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             | 14 ++++-----
 drivers/pinctrl/sh-pfc/core.c                      |  4 ++-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              | 17 ++++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              | 21 ++++++-------
 12 files changed, 111 insertions(+), 55 deletions(-)

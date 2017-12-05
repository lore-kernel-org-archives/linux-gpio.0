From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.15 take one
Date: Tue, 5 Dec 2017 14:17:02 +0100
Message-ID: <CACRpkdavbHUZm6-g9YfNsc7JBX95zpmDai=fom0TqEU=KwjLdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36257 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752126AbdLENRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Dec 2017 08:17:03 -0500
Received: by mail-it0-f66.google.com with SMTP id d16so1400284itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2017 05:17:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi Linus,

as with GPIO not much action in pin control. All is driver fixes.

Please pull them in, details in the signed tag as usual.

Yours,
Linus Walleij

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.15-2

for you to fetch changes up to 07c43a382d7de3db01cc28bf2e17ed151cde2046:

  pinctrl: sunxi: Disable strict mode for H5 driver (2017-11-30 16:50:43 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.15 cycle:

- Fix the UART2 RTS pin mode on Intel Denverton.
- Fix the direction_output() behaviour on the Armada 37xx.
- Fix the groups selection per-SoC on the Gemini.
- Fix the interrupt pin bank on the Sunxi A80.
- Fix the UART mux on the Sunxi A64.
- Disable the strict mode on the Sunxi H5 driver.

----------------------------------------------------------------
Andre Przywara (3):
      pinctrl: sunxi: Fix A80 interrupt pin bank
      pinctrl: sunxi: Fix A64 UART mux value
      pinctrl: sunxi: Disable strict mode for H5 driver

Andy Shevchenko (1):
      pinctrl: denverton: Fix UART2 RTS pin mode

Gregory CLEMENT (1):
      pinctrl: armada-37xx: Fix direction_output() callback behavior

Linus Walleij (1):
      pinctrl: gemini: Fix usage of 3512 groups

 drivers/pinctrl/intel/pinctrl-denverton.c   |  2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++++++++--
 drivers/pinctrl/pinctrl-gemini.c            |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c  |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c   |  6 ++++--
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c   |  6 +++---
 6 files changed, 21 insertions(+), 10 deletions(-)

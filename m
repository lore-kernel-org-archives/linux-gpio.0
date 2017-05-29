From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.12
Date: Mon, 29 May 2017 09:50:55 +0200
Message-ID: <CACRpkdYzsVe4DoGPj-VYmfELc2UCVUxOw_dxcO-KrUkNY4Jivg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:38682 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdE2Hu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 03:50:57 -0400
Received: by mail-it0-f49.google.com with SMTP id r63so23042847itc.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 00:50:57 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Linus,

here is an overdue pull request for pin control fixes, the most
prominent feature is to make Intel Chromebooks (and I suspect any
other Cherryview-based Intel thing) happy again, which we really
want to see.

There is a patch hitting drivers/firmware/* that I was uncertain to
who actually manages, but I got Andy Shevchenko's and Dmitry
Torokov's review tags on it and I trust them both 100% to do the
right thing for Intel platform drivers.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d=
:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.12-2

for you to fetch changes up to 7903d4f5e1dec53963cba9b1bc472a76a3532e07:

  pinctrl: sunxi: Fix SPDIF function name for A83T (2017-05-23 11:31:27 +02=
00)

----------------------------------------------------------------
Pin control fixes for v4.12:

- Make a few Intel Chromebooks with Cherryview DMI firmware
  work smoothly.

- A fix for some bogus allocations in the generic group
  management code.

- Some GPIO descriptor lookup table stubs. Merged through
  the pin control tree for administrative reasons.

- Revert the "bi-directional" and "output-enable" generic
  properties: we need more discussions around this. It seems
  other SoCs are using input/output gate enablement and these
  terms are not correct.

- Fix mux and drive strength atomically in the MXS driver.

- Fix the SPDIF function on sunxi A83T.

- OF table terminators and other small fixes.

----------------------------------------------------------------
Anatolij Gustschin (1):
      gpiolib: Add stubs for gpiod lookup table interface

Chen-Yu Tsai (1):
      pinctrl: sunxi: Fix SPDIF function name for A83T

Linus Walleij (1):
      Revert "pinctrl: generic: Add bi-directional and output-enable"

Mika Westerberg (2):
      firmware: dmi: Add DMI_PRODUCT_FAMILY identification string
      pinctrl: cherryview: Extend the Chromebook DMI quirk to
Intel_Strago systems

Tony Lindgren (1):
      pinctrl: core: Fix warning by removing bogus code

Uwe Kleine-K=C3=B6nig (1):
      pinctrl: mxs: atomically switch mux and drive strength config

Wei Yongjun (1):
      pinctrl: cherryview: Add terminate entry for dmi_system_id tables

 .../bindings/pinctrl/pinctrl-bindings.txt          |  2 --
 drivers/firmware/dmi-id.c                          |  2 ++
 drivers/firmware/dmi_scan.c                        |  1 +
 drivers/pinctrl/core.c                             | 20 +++---------------
 drivers/pinctrl/freescale/pinctrl-mxs.c            | 16 +++++++++++----
 drivers/pinctrl/intel/pinctrl-cherryview.c         | 24 +++++++++++++++++-=
----
 drivers/pinctrl/pinconf-generic.c                  |  3 ---
 drivers/pinctrl/pinmux.c                           | 21 ++++--------------=
-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c         |  2 +-
 include/linux/gpio/machine.h                       |  7 +++++++
 include/linux/mod_devicetable.h                    |  1 +
 include/linux/pinctrl/pinconf-generic.h            |  3 ---
 12 files changed, 50 insertions(+), 52 deletions(-)

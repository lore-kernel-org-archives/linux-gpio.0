From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Late GPIO fixes for the v4.6 cycle
Date: Mon, 2 May 2016 10:02:08 +0200
Message-ID: <CACRpkdas77BJq9mthoBnWhqzjMgzW-3Gv-VOJNuxMDO4Ah2uuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36103 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752317AbcEBICJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 04:02:09 -0400
Received: by mail-oi0-f54.google.com with SMTP id x201so181198952oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 01:02:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here are some late but important fixes for the v4.6 kernel
series. ACPI and RCAR, so two driver fixes (PM related)
and a self-evident string lookup fix for ACPI GPIOs.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit bf16200689118d19de1b8d2a3c314fc21f5d=
c7bb:

  Linux 4.6-rc3 (2016-04-10 17:58:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.6-4

for you to fetch changes up to 7df89e92a56a3d2c8f84aa76c61471e4a7bc24f9=
:

  gpiolib-acpi: Duplicate con_id string when adding it to the crs
lookup list (2016-04-30 13:51:59 +0200)

----------------------------------------------------------------
Late GPIO fixes for the v4.6 series:
- A serious ACPI fix targeted for stable: lookup strings
  were being free:ed.
- Revert two patches from the RCAR driver.

----------------------------------------------------------------
Linus Walleij (2):
      Revert "gpio: rcar: Add Runtime PM handling for interrupts"
      Revert "gpio: rcar: Fine-grained Runtime PM support"

Ville Syrj=C3=A4l=C3=A4 (1):
      gpiolib-acpi: Duplicate con_id string when adding it to the crs
lookup list

 drivers/gpio/gpio-rcar.c    | 65 +++++--------------------------------=
--------
 drivers/gpio/gpiolib-acpi.c |  2 +-
 2 files changed, 7 insertions(+), 60 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

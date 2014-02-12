From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v3.14 series
Date: Wed, 12 Feb 2014 15:58:16 +0100
Message-ID: <CACRpkdZsU_Vdb3C_VLH6CUH830i2iPsPPb=ODw9oe7vFm3iUag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:45392 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484AbaBLO6Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 09:58:16 -0500
Received: by mail-oa0-f52.google.com with SMTP id i4so10847040oah.25
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 06:58:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

here are some accumulated patches with small fixes for this and
that in a few GPIO drivers, and a more important fix to an #ifdef
in the GPIO consumer header.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:

  Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.14-2

for you to fetch changes up to a3485d088516be4c2ae2890e8ad64321481f2857:

  gpio: consumer.h: Move forward declarations outside #ifdef
(2014-02-06 10:22:56 +0100)

----------------------------------------------------------------
A set of GPIO fixes for the v3.14 series:

- Get #ifdef's right in the <linux/gpio/consumer.h> header.

- Minor fixes to tb10x, clps711x, bcm281xx, intel-mid and
  xtensa GPIO drivers.

----------------------------------------------------------------
Axel Lin (2):
      gpio: clps711x: Add module alias to support module auto loading
      gpio: tb10x: GPIO_TB10X needs to select GENERIC_IRQ_CHIP

Baruch Siach (1):
      gpio: xtensa: fix build when XCHAL_HAVE_CP is 0

Lars-Peter Clausen (1):
      gpio: consumer.h: Move forward declarations outside #ifdef

Markus Mayer (1):
      gpio: bcm281xx: Update MODULE_AUTHOR

xinhui.pan (1):
      gpio: intel-mid: fix the incorrect return of idle callback

 drivers/gpio/Kconfig          |  1 +
 drivers/gpio/gpio-bcm-kona.c  |  4 ++--
 drivers/gpio/gpio-clps711x.c  |  1 +
 drivers/gpio/gpio-intel-mid.c |  4 ++--
 drivers/gpio/gpio-xtensa.c    | 16 ++++++++++++++++
 include/linux/gpio/consumer.h |  4 ++--
 6 files changed, 24 insertions(+), 6 deletions(-)

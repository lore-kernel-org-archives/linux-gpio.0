From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.14
Date: Wed, 11 Oct 2017 09:30:08 +0200
Message-ID: <CACRpkdaWF_mQ=oAHk0Mg-WJixMa5rvCdbFrtKyf1pmSySo_6MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:43490 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932617AbdJKHaK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 03:30:10 -0400
Received: by mail-io0-f170.google.com with SMTP id f202so1155742ioe.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 00:30:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here are some smallish GPIO fixes for v4.14. Like with
pin control: some build/Kconfig noise and one serious bug
in a specific driver.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.14-2

for you to fetch changes up to 80ac93c274411a55ae731f259f75e4ca5e499e8b:

  gpio: omap: Fix lost edge interrupts (2017-10-07 13:17:07 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.14 series:

- Three Kconfig/build warning fixes.

- A fix for lost edge IRQs in the OMAP driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      gpio: acpi: work around false-positive -Wstring-overflow warning
      gpio: omap: omap_gpio_show_rev is not __init

Grygorii Strashko (1):
      gpio: omap: Fix lost edge interrupts

Masahiro Yamada (1):
      gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of depends on

 drivers/gpio/Kconfig        |  3 ++-
 drivers/gpio/gpio-omap.c    | 24 ++++++++++++++----------
 drivers/gpio/gpiolib-acpi.c |  2 +-
 3 files changed, 17 insertions(+), 12 deletions(-)

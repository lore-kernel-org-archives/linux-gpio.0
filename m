From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.11
Date: Tue, 21 Mar 2017 09:18:19 +0100
Message-ID: <CACRpkda90xKmfK1T8mSgr_XPeGcHXzOSUnTaFvPYX+bhrvq4-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:35325 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755395AbdCUISW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Mar 2017 04:18:22 -0400
Received: by mail-it0-f45.google.com with SMTP id y18so4961204itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Mar 2017 01:18:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the first set of GPIO fixes. It was delayed a bit beacuse
I was chicken when linux-next was not rotating last week.

This hits the ST serial driver in drivers/tty/serial and that has an
ACK from Greg, he suggested to keep the old GPIO fwnode API
around to smoothen things in the merge Windod and those have
now served their purpose so we take them out and convert the last
driver to the new API.

Apart from that it's fixes as usual.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.11-2

for you to fetch changes up to 2cd29f2387be70de9feb4c9f8dbc7c0bd55748ce:

  gpio:mcp23s08 Fixed missing interrupts (2017-03-17 09:20:28 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.11 series:

- Set the parent on the Altera A10SR driver, also fix
  high level IRQs.

- Fix error path on the mockup driver.

- Compilation noise about unused functions fixed.

- Fix missed interrupts on the MCP23S08 expander, this is also
  tagged for stable.

- Retire the interrim helpers devm_get_gpiod_from_child() used
  to smoothen merging in the merge window.

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: xgene: mark PM functions as __maybe_unused

Dan Carpenter (1):
      gpio: mockup: return -EFAULT if copy_from_user() fails

Lee Jones (1):
      serial: st-asc: Use new GPIOD API to obtain RTS pin

Phil Reid (1):
      gpio: altera: Use handle_level_irq when configured as a level_high

Robert Middleton (1):
      gpio:mcp23s08 Fixed missing interrupts

Thor Thayer (1):
      gpio: altera-a10sr: Set gpio_chip parent property

 drivers/gpio/gpio-altera-a10sr.c |  2 +-
 drivers/gpio/gpio-altera.c       | 26 +++++++---------
 drivers/gpio/gpio-mcp23s08.c     | 65 ++++++++++++++++++++++++++++++++++++----
 drivers/gpio/gpio-mockup.c       |  7 ++---
 drivers/gpio/gpio-xgene.c        | 13 ++------
 drivers/tty/serial/st-asc.c      | 11 +++----
 include/linux/gpio/consumer.h    | 16 ----------
 7 files changed, 84 insertions(+), 56 deletions(-)

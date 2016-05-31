From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.7, take one
Date: Tue, 31 May 2016 09:25:37 +0200
Message-ID: <CACRpkdboaYDjQ66ofEXAsPe4cmm=jpfP=WQoidkt4WUuBazUQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35156 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316AbcEaHZi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 03:25:38 -0400
Received: by mail-oi0-f50.google.com with SMTP id w184so284034334oiw.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 00:25:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a set of GPIO fixes mostly fixing my own mistakes. The
details are in the signed tag. They are mostly about corner cases in
the infrastructure, less used features like getting a pins direction and
handling of optional GPIO lines.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-2

for you to fetch changes up to 545ebd9a9be6bcbcf3e8dc24b874bfd634131946:

  gpio: drop lock before reading GPIO direction (2016-05-30 17:11:59 +0200)

----------------------------------------------------------------
A bunch of GPIO fixes for the v4.7 series:

- Drop the lock before reading out the GPIO direction
  setting in drivers supporting the .get_direction()
  callback: some of them may be slowpath.

- Flush GPIO direction setting before locking a GPIO as an
  IRQ: some electronics or other poking around in the
  registers behind our back may have happened, so flush
  the direction status before trying to lock the line for
  use by IRQs.

- Bail out silently when asked to perform operations on
  NULL GPIO descriptors. That is what all the get_*_optional()
  is about: we get optional GPIO handles, if they are not
  there, we get NULL.

- Handle compatible ioctl() correctly: we need to convert
  the ioctl() pointer using compat_ptr() here like everyone
  else.

- Disable the broken .to_irq() on the LPC32xx platform.
  The whole irqchip infrastructure was replaced in the
  last merge window, and a new implementation will be
  needed.

----------------------------------------------------------------
Linus Walleij (4):
      gpio: flush direction status in gpiochip_lock_as_irq()
      gpio: handle compatible ioctl() pointers
      gpio: bail out silently on NULL descriptors
      gpio: drop lock before reading GPIO direction

Sylvain Lemieux (1):
      gpio: lpc32xx: disable broken to_irq support

 drivers/gpio/gpio-lpc32xx.c | 48 +-----------------------------------------
 drivers/gpio/gpiolib.c      | 51 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 58 deletions(-)

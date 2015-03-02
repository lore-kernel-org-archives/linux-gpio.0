From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.0 series, take one
Date: Mon, 2 Mar 2015 12:57:59 +0100
Message-ID: <CACRpkdbQKcmGAOdqsKN3O9Xh8TXbt2UTYec75t1Rc-B3ZNuMmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:45787 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbbCBL6A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 06:58:00 -0500
Received: by mail-oi0-f50.google.com with SMTP id v1so26524813oia.9
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 03:57:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

here are some two GPIO fixes for the v4.0 kernel series.
I'm lagging behind on mail so more may follow but these
need to get upstream now.

Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.0-2

for you to fetch changes up to 2f97c20e5f7c3582c7310f65a04465bfb0fd0e85:

  gpio: tps65912: fix wrong container_of arguments (2015-02-23 15:40:32 +0100)

----------------------------------------------------------------
Two GPIO fixes for the v4.0 kernel series:

- Fix a translation problem in of_get_named_gpiod_flags()
- Fix a long standing container_of() mistake in the TPS65912
  driver.

----------------------------------------------------------------
Hans Holmberg (1):
      gpiolib: of: allow of_gpiochip_find_and_xlate to find more than
one chip per node

Nicolas Saenz Julienne (1):
      gpio: tps65912: fix wrong container_of arguments

 drivers/gpio/gpio-tps65912.c | 14 ++++++++++----
 drivers/gpio/gpiolib-of.c    |  9 +++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

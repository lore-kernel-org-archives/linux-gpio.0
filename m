From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v3.17 series
Date: Fri, 5 Sep 2014 10:41:24 +0200
Message-ID: <CACRpkdZ0m1D5pnZaH9yJLKHLu_Npd9KDZTUyrp5RHC3SduvAYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35651 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828AbaIEIlY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 04:41:24 -0400
Received: by mail-ob0-f171.google.com with SMTP id wn1so8443691obc.30
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2014 01:41:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

again there are some GPIO fixes for v3.17. The details are in
the tag.

Please pull it in!


The following changes since commit 52addcf9d6669fa439387610bc65c92fa0980cef:

  Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.17-3

for you to fetch changes up to 0dbc8b7afef6e4fddcfebcbacbeb269a0a3b06d5:

  gpio: move varargs hack outside #ifdef GPIOLIB (2014-09-02 10:09:43 +0200)

----------------------------------------------------------------
GPIO fixes for the v3.17 series:

- Some documentation sync
- Resource leak in the bt8xx driver
- Again fix the way varargs are used to handle the
  optional flags on the gpiod_* accessors. Now hopefully
  nailed the entire problem.

----------------------------------------------------------------
Alexandre Courbot (1):
      Documentation: gpio: documentation for optional getters functions

Linus Walleij (1):
      gpio: move varargs hack outside #ifdef GPIOLIB

Michael Auchter (1):
      gpio: bt8xx: fix release of managed resources

 Documentation/gpio/consumer.txt |  24 ++++++++-
 drivers/gpio/gpio-bt8xx.c       |   3 --
 include/linux/gpio/consumer.h   | 105 +++++++++++++++++++++++-----------------
 3 files changed, 83 insertions(+), 49 deletions(-)

From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.6 take one
Date: Thu, 31 Mar 2016 09:50:47 +0200
Message-ID: <CACRpkdYhjNN=RMdCnVHst-kNjiaPFf5Oz9jHL1pnQwFw-B_ndQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33468 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbcCaHus (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 03:50:48 -0400
Received: by mail-ob0-f180.google.com with SMTP id x3so92425031obt.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 00:50:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here are two GPIO fixes for the v4.6 series, both in drivers.
Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.6-2

for you to fetch changes up to 8d8ee18cc707f498b6dad18915576f23b00bcff8:

  gpio: xgene: Prevent NULL pointer dereference (2016-03-30 10:39:39 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.6 series:
- Prevent NULL dereference in the Xgene driver
- Fix an uninitialized spinlock in the menz127 driver

----------------------------------------------------------------
Axel Lin (2):
      gpio: menz127: Drop lock field from struct men_z127_gpio
      gpio: xgene: Prevent NULL pointer dereference

 drivers/gpio/gpio-menz127.c | 9 ++++-----
 drivers/gpio/gpio-xgene.c   | 5 +++++
 2 files changed, 9 insertions(+), 5 deletions(-)

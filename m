From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.8 series
Date: Tue, 16 Aug 2016 10:13:52 +0200
Message-ID: <CACRpkdYuq9UvHFqk+Zkssxvops4Ba+2jgJs4RcjoD+hKVrAWJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33688 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbcHPINx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2016 04:13:53 -0400
Received: by mail-oi0-f51.google.com with SMTP id c15so89862337oig.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2016 01:13:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here are a few pin control fixes for the v4.8 series, nothing
special about them.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.8-2

for you to fetch changes up to e95d0dfb229fffe96dc4c29054f6c7a7302e111e:

  pinctrl: intel: merrifield: Add missed header (2016-08-10 15:46:28 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.8 series:

- Add the missing <linux/io.h> header to the Intel Merrifield
  driver to get rid of build mess.

- Drop two instances of pinctrl_unregister() called for drivers
  using devm_* resource management.

- Remove the default debounce time for the AMD driver.

----------------------------------------------------------------
Agrawal, Nitesh-kumar (1):
      pinctrl/amd: Remove the default de-bounce time

Andy Shevchenko (1):
      pinctrl: intel: merrifield: Add missed header

Wei Yongjun (2):
      pinctrl: meson: Drop pinctrl_unregister for devm_ registered device
      pinctrl: pistachio: Drop pinctrl_unregister for devm_ registered device

 drivers/pinctrl/intel/pinctrl-merrifield.c |  1 +
 drivers/pinctrl/meson/pinctrl-meson.c      |  8 +-------
 drivers/pinctrl/pinctrl-amd.c              | 20 --------------------
 drivers/pinctrl/pinctrl-pistachio.c        |  9 +--------
 4 files changed, 3 insertions(+), 35 deletions(-)

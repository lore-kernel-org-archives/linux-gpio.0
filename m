From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.11
Date: Sat, 11 Mar 2017 00:29:52 +0100
Message-ID: <CACRpkdZHWubdCaED74pPakJpp4GQ9OAqqGg7iWKHm8VG_CZ97Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36294 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbdCJX3y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2017 18:29:54 -0500
Received: by mail-io0-f170.google.com with SMTP id l7so57736565ioe.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2017 15:29:54 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

a first round of pin control fixes for v4.11. I've been busy so there
is likely more in the pipe than these two driver fixes, but no reason
to keep them waiting so, please pull them in!

Yours,
Linus Walleij

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.11-2

for you to fetch changes up to 96e1ce8fcd66d850196758c038bd9d6f7857c518:

  pinctrl: uniphier: change pin names of aio/xirq for LD11 (2017-03-06
14:38:05 +0100)

----------------------------------------------------------------
Two smaller pin control fixes for the v4.11 series:

- Add a get_direction() function to the qcom driver.

- Fix two pin names in the uniphier driver.

----------------------------------------------------------------
Kunihiko Hayashi (1):
      pinctrl: uniphier: change pin names of aio/xirq for LD11

Timur Tabi (1):
      pinctrl: qcom: add get_direction function

 drivers/pinctrl/qcom/pinctrl-msm.c               | 15 +++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 12 ++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

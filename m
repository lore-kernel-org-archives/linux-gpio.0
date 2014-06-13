From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for the v3.16 series
Date: Fri, 13 Jun 2014 23:46:26 +0200
Message-ID: <CACRpkdYYbmGaLYOpMhcOBEO5Z-4f+j8AVrG7odu39MdZqtcJyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:52000 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754033AbaFMVq1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jun 2014 17:46:27 -0400
Received: by mail-ob0-f171.google.com with SMTP id nu7so3454869obb.30
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2014 14:46:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>

Hi Linus,

sending you this vital fix before leaving for a short vacation so it
does not sit collecting dust in my tree for no good reason.

Apart from this, our v3.16 cycle looks like a good start.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 963649d735c8b6eb0f97e82c54f02426ff3f1f45:

  Merge tag 'for-linus-3.16-merge-window' of
git://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs (2014-06-08
14:35:19 -0700)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.16-2

for you to fetch changes up to 06fc3b70f1dc9c53070fa63a528830f54afc3c38:

  gpio: of: Fix handling for deferred probe for -gpio suffix
(2014-06-12 09:57:00 +0200)

----------------------------------------------------------------
A first GPIO fix for the v3.16 series, this was serious since
it blocks the OMAP boot.

----------------------------------------------------------------
Tony Lindgren (1):
      gpio: of: Fix handling for deferred probe for -gpio suffix

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

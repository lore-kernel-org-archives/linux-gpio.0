From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] RTF: pinctrl: sirf: state container refactorings
Date: Wed, 23 Apr 2014 23:16:30 +0200
Message-ID: <1398287792-19831-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:46154 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758069AbaDWVQm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 17:16:42 -0400
Received: by mail-we0-f173.google.com with SMTP id w61so1429352wes.32
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 14:16:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, Barry Song <Baohua.Song@csr.com>, Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

This is a refactoring attempt that may not work as I can't test it
(it compiles), but you sure can see what I want to happen in the SIRF
driver.

By registering the GPIO range from the gpiochip side we can get rid
of the static globals and be a nice kernel citizen. See further
Documentation/driver-model/design-patterns.txt.

Linus Walleij (2):
  RFT: pinctrl: sirf: switch to using allocated state container
  RFT: pinctrl: sirf: move sgpio lock into state container

 drivers/pinctrl/sirf/pinctrl-sirf.c | 240 ++++++++++++++++++++----------------
 1 file changed, 134 insertions(+), 106 deletions(-)

-- 
1.9.0


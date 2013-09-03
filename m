From: Fabio Estevam <festevam@gmail.com>
Subject: Commit "gpio: improve error path in gpiolib" causes hang on mx6
Date: Tue, 3 Sep 2013 17:27:53 -0300
Message-ID: <CAOMZO5DnS--2Cxw+M8S8QcA_2eN+QKTpvWYyCWiH6KkLsRm8HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f47.google.com ([209.85.212.47]:54436 "EHLO
	mail-vb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760808Ab3ICU1y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2013 16:27:54 -0400
Received: by mail-vb0-f47.google.com with SMTP id h10so4315162vbh.34
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2013 13:27:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org

Hi Linus,

I am running linux-next 20130903 and I noticed that:

commit 8fea68f4987e50d31205da8bd88fd41fe3962355
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Fri Aug 30 09:41:45 2013 +0200

    gpio: improve error path in gpiolib

, causes imx6q-sabresd board to hang:

ci_hdrc ci_hdrc.0: doesn't support gadget
ci_hdrc ci_hdrc.0: EHCI Host Controller
ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
ci_hdrc ci_hdrc.1: doesn't support gadget
ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 2
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
gpiod_set_debounce: missing set() or set_debounce() operations

If I revert this commit, then I am able to boot correctly.

Any suggestions?

Thanks,

Fabio Estevam

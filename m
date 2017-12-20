From: Dmitry Mastykin <mastichi@gmail.com>
Subject: pinctrl: mcp23s08: gpio-keys: Unable to get irq number for GPIO
Date: Wed, 20 Dec 2017 17:44:45 +0300
Message-ID: <CALieaeeD6qmZTN6K9nH3C3psXd2r=z+x3k97EDOuAG8ra-AouQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:43703 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754746AbdLTOor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 09:44:47 -0500
Received: by mail-wm0-f51.google.com with SMTP id n138so10314870wmg.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 06:44:46 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>

Hello,

when using gpio-keys with mcp23s08, sometimes it fails to get irq numbers:

[   10.236393] gpiochip_setup_dev: registered GPIOs 504 to 511 on
device: gpiochip4 (mcp23008)
[   10.242995] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/keys/button@1[0]' - status (0)
[   10.243759] gpio-keys keys: Unable to get irq number for GPIO 0, error -6

but more often it succeeds (approx. 1:3):

[   10.702204] gpiochip_setup_dev: registered GPIOs 504 to 511 on
device: gpiochip4 (mcp23008)
[   10.731450] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/keys/button@1[0]' - status (0)
[   10.803577] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/keys/button@2[0]' - status (0)
[   10.869131] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/keys/button@3[0]' - status (0)
[   10.928949] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/keys/button@4[0]' - status (0)

Please suggest where could be the problem.
Thank you!

Dmitry Mastykin

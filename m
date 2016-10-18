From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: [BUG] LPC32xx gpio driver broken by commit 762c2e46 in 4.9-rc1
Date: Tue, 18 Oct 2016 12:23:19 -0400
Message-ID: <1476807799.10214.25.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35497 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934907AbcJRQXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 12:23:22 -0400
Received: by mail-it0-f65.google.com with SMTP id 139so149208itm.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2016 09:23:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, slemieux@tycoint.com

Vladimir, Linus, Alexandre,

the current LPC32xx GPIO driver is broken by commit 762c2e46
(gpio: of: remove of_gpiochip_and_xlate() and struct gg_data).

A call to "of_get_named_gpio" to retrieve the GPIO will
always return -EINVAL, except for the first GPIO bank.

Prior to this commit, the driver was working properly
because of the side-effect of the match function called by
"gpiochip_find" inside "of_get_named_gpiod_flags" function.

I think, the proper long-term solution is to replace the
LPC32xx GPIO driver; an initial version was previously
submitted, by Vladimir Zapolskiy, to the mailing list:
http://www.spinics.net/lists/linux-gpio/msg09746.html

Is there any short-term solution that can be done with
the existing driver to keep the LPC32xx platform working
properly in the 4.9 mainline kernel?


Regards,
Sylvain Lemieux


 




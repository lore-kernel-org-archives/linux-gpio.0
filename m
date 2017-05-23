From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: max732x: move header file out of I2C realm
Date: Tue, 23 May 2017 11:34:19 +0200
Message-ID: <CACRpkdaO3bjg2HfOw7kk-wMd8YdF-13PZOh35PvEnP+wTQ60Wg@mail.gmail.com>
References: <20170521215727.1243-1-wsa@the-dreams.de> <20170521215727.1243-2-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:37661 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967107AbdEWJeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 05:34:21 -0400
Received: by mail-it0-f46.google.com with SMTP id g126so16126576ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 02:34:21 -0700 (PDT)
In-Reply-To: <20170521215727.1243-2-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, May 21, 2017 at 11:57 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> include/linux/i2c is not for client devices. Move the header file to a
> more appropriate location.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Patch applied.

Yours,
Linus Walleij

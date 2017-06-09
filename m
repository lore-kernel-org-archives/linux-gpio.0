From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-gxbb: remove non-existing pin GPIOX_22
Date: Fri, 9 Jun 2017 09:25:54 +0200
Message-ID: <CACRpkdY4beiDkj+EEe5qzSHeNEU03cRqXkEXwKOHf-EKxdh2ug@mail.gmail.com>
References: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36207 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751511AbdFIHZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 03:25:56 -0400
Received: by mail-io0-f175.google.com with SMTP id y77so29757386ioe.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 00:25:56 -0700 (PDT)
In-Reply-To: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jun 7, 2017 at 7:44 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> After commit 34e61801a3b9 "pinctrl: meson-gxbb: Add missing GPIODV_18
> pin entry" I started to get the following warning:
>
> "meson-pinctrl c8834000.periphs:pinctrl@4b0: names 119 do not match
> number of GPIOs 120"
>
> It turned out that not the mentioned commit has a problem, it just
> revealed another problem which had existed before.
>
> There is no PIN GPIOX_22 on Meson GXBB.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Patch applied with Neil's tags.

Yours,
Linus Walleij

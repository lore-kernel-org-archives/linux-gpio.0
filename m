From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: add I2C pin support
Date: Wed, 4 Oct 2017 18:10:37 +0200
Message-ID: <CAMuHMdVcBh2eKN+dRqJQRutdTDDE7EAptujfz0-ONoMD6P88eA@mail.gmail.com>
References: <20171004155252.21080-1-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:47393 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751120AbdJDQKj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2017 12:10:39 -0400
In-Reply-To: <20171004155252.21080-1-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Oct 4, 2017 at 5:52 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Since pinmuxing for I2C is equal on H3 ES1.0 and later versions, copy
> the I2C settings from ES1.0. Fixes this error in upstream for
> Salvator-XS:
>
> sh-pfc e6060000.pin-controller: function 'i2c2' not supported
> sh-pfc e6060000.pin-controller: invalid function i2c2 in map table
> i2c-rcar: probe of e6510000.i2c failed with error -22
>
> Now, the bus works the same as with other Salvator boards.

Thanks for your patch!

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.15.

> This patch is based on top of Geert's sh-pfc branch. I'd think it is a bugfix
> for the above reasons and it would be really great to have it in v4.14. But you
> guys will have the final word, of course.

I tend to disagree: this is just part of the normal process of adding hardware
support incrementally.

While in this particular case hardware got (partially) enabled early due to
.dtsi sharing, the same could have happened without sharing, as DT and PFC
patches go in through different channels, and could arrive upstream in
different released versions.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

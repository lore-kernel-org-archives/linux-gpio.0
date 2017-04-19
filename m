From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: grand I2C rename
Date: Wed, 19 Apr 2017 11:49:20 +0200
Message-ID: <CAMuHMdVfHeeBwohuoJrt_gcB5R=EhHMCaj95oErKbj5BE9LuGg@mail.gmail.com>
References: <20170407200300.584760058@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33743 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754605AbdDSJtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2017 05:49:22 -0400
In-Reply-To: <20170407200300.584760058@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Sergei,

On Fri, Apr 7, 2017 at 10:02 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R8A7791 PFC driver  was apparently based on the preliminary revisions
> of  the  user's manual, which called all the I2C signals {SCL|SDA}<n> and
> MOD_SEL register fields SEL_IIC<n> without making a difference between two
> types of the I2C controllers used. The recent manual calls the signals
> {I2C|IIC}<n>_{SCL|SDA> and the MOD_SEL fields SEL_{I2C|IIC}<n> finally
> making this difference. Follow the suit...

Thanks for your patch!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

No difference in the generated binary, good!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

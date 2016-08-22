From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU support
Date: Mon, 22 Aug 2016 14:23:19 +0200
Message-ID: <CAMuHMdVTtjuiE6eEdD6Rhp2UykOBgjHjdn3=VJc=ROKziOqfWg@mail.gmail.com>
References: <1470993268-11590-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdVJ6fN1ak1zMYXKPe6h1aEmhHjWdCQLPw5EsGZq61w99A@mail.gmail.com> <CACRpkdZjsHCxTQ00Dfe94sHEMeFP3VUUkZfhGFO+oiQVsmkXXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZjsHCxTQ00Dfe94sHEMeFP3VUUkZfhGFO+oiQVsmkXXA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Aug 22, 2016 at 2:10 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Aug 16, 2016 at 10:23 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Fri, Aug 12, 2016 at 11:14 AM, Laurent Pinchart
>> <laurent.pinchart+renesas@ideasonboard.com> wrote:
>>> Only the DU parallel RGB output signals are included, HDMI and TCON pins
>>> will be added in separate groups.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> Geert, I assume you will queue this?

Sure, it's part of the pull request I sent last week ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

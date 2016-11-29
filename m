From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
Date: Tue, 29 Nov 2016 22:39:35 +0100
Message-ID: <CAMuHMdUcxJ6fiahvG+Ydha_Tp5RkppSemb=1qkGRwpb4ACGoZw@mail.gmail.com>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org> <4558124.JutbKSQ7ug@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4558124.JutbKSQ7ug@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Tue, Nov 29, 2016 at 8:30 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday 29 Nov 2016 10:11:56 Jacopo Mondi wrote:
>> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.
>>
>> The Gyro-ADC supports three different configurations:
>> a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
>> channel select signal (adi_chsel1 and adi_chsel1_b groups),
>
> I've only briefly looked up at the datasheet, but is that a supported mode ?
> It seems that mode 1 uses 4 channels and mode 2 and 3 use 8 channels.

I think you can always connect less ADCs than there are channels.
If you connect e.g. only one, you don't need any CHS signals.
If you connect e.g. two, you can use only one CHS signal.

AFAICS, you still have to use an external demux to create individual chip
selects from the single CS signal and (up to 3) CHS signals.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

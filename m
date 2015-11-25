From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2][RFC] pinctrl: sh-pfc: share/reuse same PORT_GP_x() macros
Date: Wed, 25 Nov 2015 10:31:12 +0100
Message-ID: <CAMuHMdWg8foANs5L1tLQMAVJuV0sy8zZ1Ts-ZKKVXu1cUaUPTg@mail.gmail.com>
References: <87io5ajkz9.wl%kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWSiq3Pna3yxRSYFgZeTMeLYgHaxp115qA-zxw=Ri-BXg@mail.gmail.com>
	<877flmjnp5.wl%kuninori.morimoto.gx@renesas.com>
	<11321076.yAsIxzsHHx@avalon>
	<87k2p67fbt.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <87k2p67fbt.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 25, 2015 at 7:45 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > I think your idea was good, but unfortunately we can't use it.
>> > Laurent, what do you think about this patch ?
>>
>> It would be great to have a more powerful C preprocessor to create a single
>> macro that would take the number of pins as a parameter. I think C++ templates
>> could do so ;-)
>>
>> I think your patch is indeed the best that can be done.
>>
>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Thanks
>
>>> LinusW ? Geert ?
>
> Is it possible to pickup this patch ?

Thanks, will queue in sh-pfc-for-v4.5.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

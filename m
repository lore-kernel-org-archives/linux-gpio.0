From: "jacopo@jmondi.org" <jacopo@jmondi.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
Date: Thu, 1 Dec 2016 17:40:35 +0100
Message-ID: <1abd7e30-f70b-1774-f51c-3e08a98f6e78@jmondi.org>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
 <4558124.JutbKSQ7ug@avalon>
 <CAMuHMdUcxJ6fiahvG+Ydha_Tp5RkppSemb=1qkGRwpb4ACGoZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUcxJ6fiahvG+Ydha_Tp5RkppSemb=1qkGRwpb4ACGoZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent, Geert,
    thanks for review

On 29/11/2016 22:39, Geert Uytterhoeven wrote:
> Hi Laurent,
>
> On Tue, Nov 29, 2016 at 8:30 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tuesday 29 Nov 2016 10:11:56 Jacopo Mondi wrote:
>>> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.
>>>
>>> The Gyro-ADC supports three different configurations:
>>> a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
>>> channel select signal (adi_chsel1 and adi_chsel1_b groups),
>>
>> I've only briefly looked up at the datasheet, but is that a supported mode ?
>> It seems that mode 1 uses 4 channels and mode 2 and 3 use 8 channels.
>
> I think you can always connect less ADCs than there are channels.
> If you connect e.g. only one, you don't need any CHS signals.
> If you connect e.g. two, you can use only one CHS signal.
>
> AFAICS, you still have to use an external demux to create individual chip
> selects from the single CS signal and (up to 3) CHS signals.

Actually Laurent's right and I have mis-interpreted the CHS signal purpose.

The CHS signal are not intended to select an external ADC where to 
sample from among the several connected ones, but instead to select 
which line to drive to a single ADC.

Quoting the processor manual, ADI supports three different ADC models 
through 3 different "modes"
- mode1: MB88101A
- mode2: ADCS7476/ADC121 and AD7476
- mode3: MAX1162
and cycles through channels moving the CHS[0:1] lines in mode1, and 
CHS[0:2] lines in mode2 and mode3.

Actually, being the MB88101A a 4-channel ADC, the CHS[0:1] lines could 
be connected to the ADC itself and used to cycle between its 4 input pins.
In mode2 and mode3 an external DEMUX is probably required, as the 
supported ADCs for these modes are single-channel ones.

For pin configuration purposes anyway, it's enough to know that we 
cannot split CHS signals in three separate groups, but in 2 only (one 
for mode1 and one for mode2 and 3).

Will send v2 shortly.
Thanks
    j


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>

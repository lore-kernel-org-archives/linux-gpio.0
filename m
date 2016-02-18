From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: add SSI pin groups
Date: Thu, 18 Feb 2016 08:52:19 +0100
Message-ID: <CAMuHMdVc+VFxiQAfh0jpiLosT7wXSer4mNxgJyqPPYijYwHi_A@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<2575141.vI43ObUTa0@wasted.cogentembedded.com>
	<56C4EF61.4010505@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56C4EF61.4010505@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Wed, Feb 17, 2016 at 11:08 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
>> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
>> @@ -1,9 +1,9 @@
>>   /*
>>    * r8a7794 processor support - PFC hardware block.
>>    *
>> - * Copyright (C) 2014 Renesas Electronics Corporation
>> + * Copyright (C) 2014-2015 Renesas Electronics Corporation
>>    * Copyright (C) 2015 Renesas Solutions Corp.
>> - * Copyright (C) 2015 Cogent  Embedded, Inc., <source@cogentembedded.com>
>> + * Copyright (C) 2015-2016 Cogent  Embedded, Inc.,
>> <source@cogentembedded.com>
>
>
>    Geert, could you turn the double space into single?

Sure, done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

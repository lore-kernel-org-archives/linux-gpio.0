From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Tue, 8 Mar 2016 09:15:18 +0100
Message-ID: <CAMuHMdUjJtEJpRxK=bo15BdJQPVK8X-LKjRa-CVj=GM+jti+iA@mail.gmail.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
	<CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
	<56DDDE6E.6090908@cogentembedded.com>
	<CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
	<56DDE5CB.60204@cogentembedded.com>
	<CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
	<56DDF068.6090408@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56DDF068.6090408@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Mon, Mar 7, 2016 at 10:19 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 03/08/2016 12:00 AM, Geert Uytterhoeven wrote:
>>>>>>> --- a/drivers/pinctrl/sh-pfc/core.c
>>>>>>> +++ b/drivers/pinctrl/sh-pfc/core.c
>>>>>>> @@ -545,7 +545,9 @@ static int sh_pfc_probe(struct platform_device
>>>>>>> *pdev)
>>>>>>>                            return ret;
>>>>>>>            }
>>>>>>>
>>>>>>> -       pinctrl_provide_dummies();
>>>>>>> +       /* Enable dummy states for those platforms without pinctrl
>>>>>>> support */
>>>>>>> +       if (!of_have_populated_dt())
>>>>>
>>>>>
>>>>>
>>>>>      I'd considered this condition -- it won't fly on SH where
>>>>> CONFIG_OF=n,
>>>>> the kernel just won't build IIUC...
>>>>
>>>> I haven't tried to compile it yet, but <linux/of.h> does provide a dummy
>>>> that
>>>> returns false.
>>>
>>>     Oops, indeed. I missed it. :-(
>>>     This approach is better then, won't have to fix again whenever SH
>>> gets DT
>>> support.
>
>> Perhaps the of_have_populated_dt() check should be moved inside
>> pinctrl_provide_dummies()?
>
>    That's probably a good idea...
>
>> Besides omap2, which has its own check, the only other user is imx1.
>
>    i.MX2x/3x as well, no?

Yeah sorry, several i.MX. I accidentally typed a trailing "1".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

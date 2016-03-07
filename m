From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Mon, 7 Mar 2016 23:34:19 +0300
Message-ID: <56DDE5CB.60204@cogentembedded.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35386 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753616AbcCGUeY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 15:34:24 -0500
Received: by mail-lb0-f181.google.com with SMTP id bc4so144762540lbc.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2016 12:34:23 -0800 (PST)
In-Reply-To: <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 03/07/2016 11:29 PM, Geert Uytterhoeven wrote:

>>>> --- a/drivers/pinctrl/sh-pfc/core.c
>>>> +++ b/drivers/pinctrl/sh-pfc/core.c
>>>> @@ -545,7 +545,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
>>>>                           return ret;
>>>>           }
>>>>
>>>> -       pinctrl_provide_dummies();
>>>> +       /* Enable dummy states for those platforms without pinctrl
>>>> support */
>>>> +       if (!of_have_populated_dt())
>>
>>     I'd considered this condition -- it won't fly on SH where CONFIG_OF=n,
>> the kernel just won't build IIUC...
>
> I haven't tried to compile it yet, but <linux/of.h> does provide a dummy that
> returns false.

    Oops, indeed. I missed it. :-(
    This approach is better then, won't have to fix again whenever SH gets DT 
support.

> Gr{oetje,eeting}s,
>
>                          Geert

MBR, Sergei


From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Mon, 7 Mar 2016 23:02:54 +0300
Message-ID: <56DDDE6E.6090908@cogentembedded.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:36825 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752958AbcCGUC7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 15:02:59 -0500
Received: by mail-lb0-f176.google.com with SMTP id x1so143857973lbj.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2016 12:02:59 -0800 (PST)
In-Reply-To: <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hello.

On 03/07/2016 10:56 PM, Geert Uytterhoeven wrote:

>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> If pinctrl_provide_dummies() is used unconditionally, then the dummy
>> state will be used even on DT platforms when the "init" state was
>> intentionally left out. Instead of "default", the dummy "init" state
>> will then be used during probe. Thus, when probing an I2C controller on
>> cold boot, communication triggered by bus notifiers broke because the
>> pins were not initialized.
>>
>> Do it like OMAP2: use the dummy state only for non-DT platforms.
>
> Thanks!
>
> Interestingly, Sergei submitted a similar patch a few days ago
> "pinctrl: sh-pfc: core: only call pinctrl_provide_dummies"
> (https://patchwork.ozlabs.org/patch/592245/)

    I shot first! :-)

>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Geert recently pointed out the problem, that the IRQ2 fixup for the
>> DA9xxx PMICs failed on Lager on cold boot. I could verify this iff IIC3
>> was used and not I2C3. IIC3 is the default, however I mostly used I2C3
>> recently, because it has the slave capabilities.
>>
>> The original pinctrl_provide_dummies() is there since the beginning of the
>> file, so in order to avoid regressions, the below solution looks plausible to
>> me. I do not have much experience with hardware older than Gen2, though, so
>> comments are much appreciated!
>>
>>
>>   drivers/pinctrl/sh-pfc/core.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
>> index 0c2d14c504aa1d..db53d7bbc16e18 100644
>> --- a/drivers/pinctrl/sh-pfc/core.c
>> +++ b/drivers/pinctrl/sh-pfc/core.c
>> @@ -545,7 +545,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
>>                          return ret;
>>          }
>>
>> -       pinctrl_provide_dummies();
>> +       /* Enable dummy states for those platforms without pinctrl support */
>> +       if (!of_have_populated_dt())

    I'd considered this condition -- it won't fly on SH where CONFIG_OF=n, the 
kernel just won't build IIUC...

>> +               pinctrl_provide_dummies();
>>
>>          ret = sh_pfc_init_ranges(pfc);
>>          if (ret < 0)
>> --
>> 2.7.0
>
> Gr{oetje,eeting}s,
>
>                          Geert

MBR, Sergei


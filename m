From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/4] pinctrl: sh-pfc: Use unsigned int for
 register/field widths and offsets
Date: Thu, 12 Mar 2015 08:49:48 +0100
Message-ID: <CAMuHMdWxEVMnQYS0=vXbAkfUmypY934KcBegbXDXROgRL=MzVw@mail.gmail.com>
References: <1425985583-26279-1-git-send-email-geert+renesas@glider.be>
	<1425985583-26279-3-git-send-email-geert+renesas@glider.be>
	<1705055.eTGDDjPxdV@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:34218 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754001AbbCLHtu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2015 03:49:50 -0400
In-Reply-To: <1705055.eTGDDjPxdV@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>

On Thu, Mar 12, 2015 at 2:00 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> @@ -322,13 +319,15 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned
>> mark, int pinmux_type) return -EINVAL;
>>       }
>>
>> -     pos = 0;
>> -     enum_id = 0;
>> -     field = 0;
>> -     value = 0;
>> -
>>       /* Iterate over all the configuration fields we need to update. */
>>       while (1) {
>> +             const struct pinmux_cfg_reg *cr = NULL;
>> +             unsigned int field = 0;
>> +             u16 enum_id = 0;
>> +             u32 value = 0;
>
> There's no need to initialize field, enum_id and value to 0 here.

And cr.

> With that fixed,

Will update and resend.

> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

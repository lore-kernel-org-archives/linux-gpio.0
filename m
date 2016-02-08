From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/2] pinctrl: sh-pfc: Improve pinmux macros documentation
Date: Mon, 8 Feb 2016 16:48:55 +0100
Message-ID: <CAMuHMdW_XbzfFcfRod4usntwgkg7-aYqUxvzXoNBOSegwa2E+Q@mail.gmail.com>
References: <1448890332-773-1-git-send-email-geert+renesas@glider.be>
	<1448890332-773-2-git-send-email-geert+renesas@glider.be>
	<4029813.xaXaFntOiW@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34147 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbcBHPs4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2016 10:48:56 -0500
In-Reply-To: <4029813.xaXaFntOiW@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Magnus Damm <damm@opensource.se>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On Thu, Feb 4, 2016 at 7:43 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 30 November 2015 14:32:11 Geert Uytterhoeven wrote:
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> v3:
>>   - Add Acked-by,
>>   - Document function names referring to IPSR fields,
>>   - Replace "configuration register" by more specific terms,
>>   - Rename "ms" to "msel" or "gsel",
>>   - EMEV2 PINMUX_IPSR_NOFN() pinmux configurations have a GPIO function,
>>
>> v2:
>>   - Clarify same width vs. different widths,
>>   - Mention GPSR for PINMUX_IPSR_DATA(),
>>   - Document NOGM (= NOGP + MSEL),
>>   - Fix s/ispr/ipsr/ typos.

[...]

> With those changes,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks a lot!

Will queue for next renesas-drivers and v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

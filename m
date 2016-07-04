From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: fix overly long lines
Date: Mon, 4 Jul 2016 22:15:23 +0300
Message-ID: <37b292fe-3a14-62d6-bdc5-7f7e5e93d958@cogentembedded.com>
References: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
 <6941131.ZKfJHhvm82@wasted.cogentembedded.com>
 <CAMuHMdXYLg7nQ1rTHnuTG2-2J1veApAcizA6j_5-UE1jPs2TPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35105 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507AbcGDTP2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 15:15:28 -0400
Received: by mail-lf0-f41.google.com with SMTP id l188so122063858lfe.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 12:15:27 -0700 (PDT)
In-Reply-To: <CAMuHMdXYLg7nQ1rTHnuTG2-2J1veApAcizA6j_5-UE1jPs2TPA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On 07/01/2016 10:50 AM, Geert Uytterhoeven wrote:

>> The PORT_GP_CFG_<n>() macros take up more than 80 columns -- and not for
>> a good reason. Make the header file checkpatch.pl-proof at least in this
>> respect...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> But it doesn't apply, due to "pinctrl: sh-pfc: Initial R8A7796 PFC support"

    ... and *still* not merged? Or am I looking at a wrong tree? :-/

> which was submitted one day earlier.

    I don't think that matters... What matters are the order of merges.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei


From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
Date: Thu, 14 Jul 2016 15:09:08 +0300
Message-ID: <c97c4dfe-9db0-d8ec-0bd1-6b26911e653e@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <1525017.NKJprrWkDB@wasted.cogentembedded.com>
 <CAMuHMdV086grEjTUxkhihF5t5NcO-pKt_8GfXhUWrMsq1zVbYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34356 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115AbcGNMJL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2016 08:09:11 -0400
Received: by mail-lf0-f44.google.com with SMTP id l69so5006404lfg.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jul 2016 05:09:10 -0700 (PDT)
In-Reply-To: <CAMuHMdV086grEjTUxkhihF5t5NcO-pKt_8GfXhUWrMsq1zVbYg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hello.

On 7/13/2016 9:13 AM, Geert Uytterhoeven wrote:

>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> ---
>> The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
>> repo plus my 2 R8A7792 PFC patches posted before...
>>
>> Changes in version 2:
>> - added AVB_AVTP_MATCH pin group.
>
> Thanks for the update!

    Not at all. How about queuing the PFC patches? :-)

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei


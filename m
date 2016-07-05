From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
Date: Tue, 5 Jul 2016 14:00:21 +0300
Message-ID: <c78b6ffe-9969-85a4-221b-f5adeea724f9@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <1734030.FmmGtJt7OA@wasted.cogentembedded.com>
 <CAMuHMdX9bxt9W_0NxPZn5Hi9314rBuDnecvL2TfqrwKm6r0q6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35461 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754824AbcGELAb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 07:00:31 -0400
Received: by mail-lf0-f48.google.com with SMTP id l188so132128898lfe.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2016 04:00:25 -0700 (PDT)
In-Reply-To: <CAMuHMdX9bxt9W_0NxPZn5Hi9314rBuDnecvL2TfqrwKm6r0q6g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hello.

On 7/5/2016 9:57 AM, Geert Uytterhoeven wrote:

>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, you forgot to add the avb_avtp_match group.
> Is that intentional?

    No, it didn't get created in the original Renesas patch and I forgot about it.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei


From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Wed, 9 Mar 2016 15:51:09 +0300
Message-ID: <56E01C3D.1060600@cogentembedded.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
 <56DDE5CB.60204@cogentembedded.com>
 <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
 <20160309095805.GA1506@katana>
 <CACRpkdZzbp5MwD6uH=GbkYbvB=HsGOHYi+HcYpn5gZacmRwHwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:36103 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536AbcCIMvL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:51:11 -0500
Received: by mail-lb0-f180.google.com with SMTP id x1so63694735lbj.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 04:51:10 -0800 (PST)
In-Reply-To: <CACRpkdZzbp5MwD6uH=GbkYbvB=HsGOHYi+HcYpn5gZacmRwHwg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>

Hello.

On 3/9/2016 1:32 PM, Linus Walleij wrote:

>>>>     This approach is better then, won't have to fix again whenever SH gets DT
>>>> support.
>>>
>>> Perhaps the of_have_populated_dt() check should be moved inside
>>> pinctrl_provide_dummies()?
>>
>> I suggest we pick up this patch now even with stable tag (the irq storm
>> fixup doesn't work correctly because of this) and consider the
>> refactoring as a second step?
>
> Sergei, Geert, do you ACK this?

    Since this patch fixes the real issue in mainline (which I wasn't aware of 
-- my patch only describes an issue with the 'ravb' driver the patches for 
using which in gen2 were never sent upstream):

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    I'd only like that the "Fixes:" and "Cc:" tags were added to it.

> Yours,
> Linus Walleij

MBR, Sergei


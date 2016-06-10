From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: add r8a7795 support for voltage switching
Date: Fri, 10 Jun 2016 13:21:39 +0200
Message-ID: <CAMuHMdXnk2O4Q6O5OYVfdMujFEiit3pU4OD-DNL+qawgwAOyUw@mail.gmail.com>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdWyt2e9f=8r+q9U=BLFW2R9OSh5GCnpvsMniXWahQ_qzg@mail.gmail.com> <20160610111200.GB1626@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36846 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbcFJLVl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2016 07:21:41 -0400
In-Reply-To: <20160610111200.GB1626@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jun 10, 2016 at 1:12 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> BTW, are these a hard dependency for patch 3, or will the missing power
>> source control just be ignored?
>
> Long answer short: It is a hard dependency.
>
> It shouldn't be, but fixing this might need patches to pfc, mmc-core,
> and sdhi driver. Need to think about it. (and even then, patch 3 will be
> depending on these yet-to-come fixes).

Thanks, good to know! ;-)

Simon: So either you can merge sh-pfc-for-v4.8 first (after I have sent the
pull request, and Linus W. has merged it!), or the DTS update will have to wait
for v4.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

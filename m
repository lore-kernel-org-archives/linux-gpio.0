From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] the great <mach/gpio.h> purge
Date: Tue, 01 Jul 2014 20:35:19 +0900
Message-ID: <038801cf9520$894200d0$9bc60270$@samsung.com>
References: <CACRpkdbPHn6bWdr8t9BrmE2JZZuuVnF7ujzEFdrM86WmrRS5Hw@mail.gmail.com>
 <02c501cf94d1$fca59720$f5f0c560$@samsung.com>
 <CAOesGMgkG_LJR2Db6+S339SYpaf+0cBxs2oXNOAHiq4-J3H0pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23941 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757886AbaGALfc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jul 2014 07:35:32 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N810012F6UV1X90@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 01 Jul 2014 20:35:19 +0900 (KST)
In-reply-to: <CAOesGMgkG_LJR2Db6+S339SYpaf+0cBxs2oXNOAHiq4-J3H0pQ@mail.gmail.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, arm@kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> 
> On Mon, Jun 30, 2014 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Linus Walleij wrote:
> >>
> >> Hi ARM SoC guys,
> >>
> > Hi Linus,
> >
> >> please pull in this patch set removing <mach/gpio.h> for good.
> >> I guess it could collide with some S5P deletion.
> >
> > Yeah...
> >
> >> If you decide to pull the S5P purge first, tell me so I can rebase.
> >>
> > So, I think, would be better if we could remove S5P64X0 and S5PC100 then
> > <mach/gpio.h> in samsung stuff. But it's up to arm-soc maintainer? ;-)
> 
> 
> As long as it's just deletion from both sides, I can happily resolve
> that when merging.
> 
Thanks :)

> Kukjin, I presume the removal would be in a cleanup branch as well?
> Please try to send it soon so we can get some time in -next with it.
> 
Yeah, I will send it soon if no objections.

> (I'll do merges in a couple of days, the backlog is building up. :)
> 
Sure, thanks.

- Kukjin


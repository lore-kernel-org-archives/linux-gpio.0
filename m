From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 08:47:02 -0700
Message-ID: <CA+55aFwbRVG-5AW+NnMOFZ_hU5i+i7f3FxgEt9Qm7B6pEd7x0g@mail.gmail.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
	<CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
	<alpine.DEB.2.20.1603181532040.4690@virtualbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:36470 "EHLO
	mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410AbcCRPrE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 11:47:04 -0400
In-Reply-To: <alpine.DEB.2.20.1603181532040.4690@virtualbox>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Schindelin <Johannes.Schindelin@gmx.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Junio C Hamano <gitster@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

On Fri, Mar 18, 2016 at 7:32 AM, Johannes Schindelin
<Johannes.Schindelin@gmx.de> wrote:
>
> On Fri, 18 Mar 2016, Linus Torvalds wrote:
>
>> I thought git didn't merge two branches that have no common base by
>> default, but it seems it will happily do so.
>
> What happened to "The coolest merge EVER!"?
>
>         http://thread.gmane.org/gmane.comp.version-control.git/5126/

I'm not complaining about multi-root capability in general - it's
still cool. In the kernel, we have aef8755711a2 ("Merge Btrfs into
fs/btrfs") that does something slightly similar.

It's literally just the fact that "git merge" does it with no extra
flags or checks. I'd like people to have to be aware of what they are
doing when they merge two different projects, not do it by mistake.

So making it conditional on a flag like "--no-common-root" is what I'd look for.

Or just make it about the merge stategy. For example, "subtree" makes
sense exactly for merging one project into a subdirectory of another.
But the default merge shouldn't do it.

I don't think the original "resolve" did it, for example. You can't do
a three-way merge without a base.

Note how that above "coolest merge" definitely wasn't done by just
"git merge gitk". I had to play around with the git internals. Now, it
shouldn't be _that_ hard, but at the same time it really shouldn't be
as easy as "I didn't know, so I merged two independent projects".

                       Linus

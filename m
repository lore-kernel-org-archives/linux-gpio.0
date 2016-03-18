From: Junio C Hamano <gitster@pobox.com>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 08:43:30 -0700
Message-ID: <xmqqzitvrdul.fsf@gitster.mtv.corp.google.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
	<CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
	<alpine.DEB.2.20.1603181532040.4690@virtualbox>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pb-smtp0.pobox.com ([208.72.237.35]:54221 "EHLO
	sasl.smtp.pobox.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752558AbcCRPne (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 11:43:34 -0400
In-Reply-To: <alpine.DEB.2.20.1603181532040.4690@virtualbox> (Johannes
	Schindelin's message of "Fri, 18 Mar 2016 15:32:54 +0100 (CET)")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Schindelin <Johannes.Schindelin@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

Johannes Schindelin <Johannes.Schindelin@gmx.de> writes:

> Hi Linus,
>
> On Fri, 18 Mar 2016, Linus Torvalds wrote:
>
>> I thought git didn't merge two branches that have no common base by
>> default, but it seems it will happily do so.
>
> What happened to "The coolest merge EVER!"?
>
> 	http://thread.gmane.org/gmane.comp.version-control.git/5126/
>
> Ciao,
> Dscho

An obvious response to the above, "What about it?", is something you
would have already anticipated when you wrote the above, and I wish
I saw that in the message I am responding to, but I didn't, so here
is my attempt ;-)

The old article shows two interesting things.  One is that there are
cases where it makes perfect sense to bind two unrelated histories
when the two roots are totally unrelated.

I am not Linus, but I think the proposal is to make it harder to do
this unusual merge by mistake, while keeping it possible to do so
when the user really wants to.  And the "deliberately whitespace
damaged patch" in the message you are responding to was primarily to
point out where the "making it harder" logic should go by showing
how to make it impossible, leaving it to readers to adjust it to
"harder but still possible".

Now, the second thing that the old article you pointed shows is that
it is possible to create such a merge without using "git merge" even
though it is more involved and takes conscious effort by the user.
In that sense, you could argue that, with the "make it impossible"
change in Linus's message to "git merge", there is no more change
needed (I do not know if that is what you meant to imply, though).

I think it makes sense to teach "git merge" to error out like Linus
did unless the user explicitly says "I know what I am doing" with an
explicit option (e.g. --force or --merge-unrelated-histories).

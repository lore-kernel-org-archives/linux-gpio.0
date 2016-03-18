From: Junio C Hamano <gitster@pobox.com>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 10:16:55 -0700
Message-ID: <xmqqk2kzr9iw.fsf@gitster.mtv.corp.google.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
	<CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
	<alpine.DEB.2.20.1603181532040.4690@virtualbox>
	<CA+55aFwbRVG-5AW+NnMOFZ_hU5i+i7f3FxgEt9Qm7B6pEd7x0g@mail.gmail.com>
	<xmqqr3f7rbck.fsf@gitster.mtv.corp.google.com>
	<CA+55aFzVqPzEg6zq7sRweE7OCVKMJzM1eZRHXddMG+BabEDeCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pb-smtp0.pobox.com ([208.72.237.35]:60990 "EHLO
	sasl.smtp.pobox.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755089AbcCRRQ6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 13:16:58 -0400
In-Reply-To: <CA+55aFzVqPzEg6zq7sRweE7OCVKMJzM1eZRHXddMG+BabEDeCA@mail.gmail.com>
	(Linus Torvalds's message of "Fri, 18 Mar 2016 10:01:25 -0700")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Johannes Schindelin <Johannes.Schindelin@gmx.de>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> The code in the recursive merge that allows this to happen is this:
> ...
> And I do think that's right, and I think it's clever, and it goes back to 2006:
>
>   934d9a24078e merge-recur: if there is no common ancestor, fake empty one
>
> but I think there should be an option there.

Oh, I think everybody understands that and agrees by now.


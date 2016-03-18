From: Junio C Hamano <gitster@pobox.com>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 09:37:31 -0700
Message-ID: <xmqqr3f7rbck.fsf@gitster.mtv.corp.google.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
	<CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
	<alpine.DEB.2.20.1603181532040.4690@virtualbox>
	<CA+55aFwbRVG-5AW+NnMOFZ_hU5i+i7f3FxgEt9Qm7B6pEd7x0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwbRVG-5AW+NnMOFZ_hU5i+i7f3FxgEt9Qm7B6pEd7x0g@mail.gmail.com>
	(Linus Torvalds's message of "Fri, 18 Mar 2016 08:47:02 -0700")
Sender: git-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Johannes Schindelin <Johannes.Schindelin@gmx.de>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> It's literally just the fact that "git merge" does it with no extra
> flags or checks. I'd like people to have to be aware of what they are
> doing when they merge two different projects, not do it by mistake.
>
> So making it conditional on a flag like "--no-common-root" is what I'd look for.

I think I said essentially the same thing in a separate message; I
am not sure "--no-common-root" is a good name, but I think it is
better to be more explicit than tying this to a strategy.

> I don't think the original "resolve" did it, for example. You can't do
> a three-way merge without a base.

Yes, and that continues to this day:

        # Give up if we are given two or more remotes -- not handling octopus.
        case "$remotes" in
        ?*' '?*)
                exit 2 ;;
        esac

        # Give up if this is a baseless merge.
        if test '' = "$bases"
        then
                exit 2
        fi

This is a tangent but I wonder if we should say why we refuse to
the standard error before calling these two "exit"s.

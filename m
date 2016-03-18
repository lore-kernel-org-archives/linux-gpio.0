From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 10:01:25 -0700
Message-ID: <CA+55aFzVqPzEg6zq7sRweE7OCVKMJzM1eZRHXddMG+BabEDeCA@mail.gmail.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
	<CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
	<alpine.DEB.2.20.1603181532040.4690@virtualbox>
	<CA+55aFwbRVG-5AW+NnMOFZ_hU5i+i7f3FxgEt9Qm7B6pEd7x0g@mail.gmail.com>
	<xmqqr3f7rbck.fsf@gitster.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:32913 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754484AbcCRRB0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 13:01:26 -0400
In-Reply-To: <xmqqr3f7rbck.fsf@gitster.mtv.corp.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Junio C Hamano <gitster@pobox.com>
Cc: Johannes Schindelin <Johannes.Schindelin@gmx.de>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

On Fri, Mar 18, 2016 at 9:37 AM, Junio C Hamano <gitster@pobox.com> wrote:
>
>> I don't think the original "resolve" did it, for example. You can't do
>> a three-way merge without a base.
>
> Yes, and that continues to this day:

Yeah, "octopus" also refuses it cleanly:

        common=$(git merge-base --all $SHA1 $MRC) ||
                die "Unable to find common commit with $pretty_name"

The code in the recursive merge that allows this to happen is this:

        if (merged_common_ancestors == NULL) {
                /* if there is no common ancestor, use an empty tree */
                struct tree *tree;

                tree = lookup_tree(EMPTY_TREE_SHA1_BIN);
                merged_common_ancestors = make_virtual_commit(tree, "ancestor");
        }

so the "no common ancestors" is just considered to be an empty merge base.

And I do think that's right, and I think it's clever, and it goes back to 2006:

  934d9a24078e merge-recur: if there is no common ancestor, fake empty one

but I think there should be an option there.

> This is a tangent but I wonder if we should say why we refuse to
> the standard error before calling these two "exit"s.

As mentioned, Octopus does.

That said, there's probably no reason to ever use the old three-way
merge, so I'm not even sure it's worth fixing the old
git-merge-resolve.

            Linus

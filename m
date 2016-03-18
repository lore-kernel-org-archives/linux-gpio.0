From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 11:37:08 +0530
Message-ID: <56EB9B0C.4050507@nvidia.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com> <CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18606 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbcCRGUb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 02:20:31 -0400
In-Reply-To: <CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


On Friday 18 March 2016 11:37 AM, Linus Torvalds wrote:
> On Thu, Mar 17, 2016 at 1:59 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> NOTE: tree was a bit dirty and I realized it too late: Laxmans
>> devm_gpiochip_add() branch was based on my for-next branch rather
>> than my devel branch, making some commits appear twice and
>> a file named README.md "Share upstreaming patches" appear and
>> then get reverted out by me.
>>
>> The end result should be clean but the history is a bit messy.
> Gaah. I took the tree, but I didn't realize just *how* messy it was. I
> doubt you did either.
>
> Dammit, had I realized just how screwed up that branch was, I'd have
> made you re-do it.
>
> Because that branch is crap.
>
> And the real reason is is crap isn't a "README.md" file that comes and
> goes. The real reason it is crap is that it has a new root commit, and
> Laxman has done something TOTALLY INSANE.
>
> I'm not even sure what insane tool was used to do this, but there's a
> new root commit at
>
>    a101ad945113be3d7f283a181810d76897f0a0d6
>
> that has no parenthood, and that is only used for a completely bogus
> merge (merge commit e5451c8f8330e03ad3cfa16048b4daf961af434f). That's
> where the README.md file comes from.
>
> Git does support the notion of having multiple roots, and it is a
> useful thing to have when you merge two different projects with
> separate history. In fact, git itself has that, for 'gitk' that was
> merged into the main git history.
>
> We have that in the kernel for the initial btrfs merge too, actually.
> btrfs started out outside the full kernel, and had a root of its own
> with its own development history, and then it was merged into the
> kernel tree under fs/btrfs.
>
> But this is *not* that. That commit
> a101ad945113be3d7f283a181810d76897f0a0d6 is just pure garbage, and the
> merge that introduces it is pure shit.
>
> Dammit, I noticed too late, so now it's out there. How the hell did
> that even happen? Why did Laxman do that insane merge? Why did it get
> pulled back?
>
> You actually have to *work* at making shit like this, so I wonder what
> workflow you guys had to make that bad merge. It's easy enough to do
> with git manually, but it's hard to do by _mistake_. Is there some
> broken tool that Laxman uses?
>
> I'm very annoyed, because while the multi-root situation can be
> useful, it can also be confusing as hell. It can cause bisection
> problems, and it can just cause people to go "WTF?"
>
> I need to know what happened and make sure it doesn't happen again. If
> this is some intentional workflow by nvidia, it needs to stop *now*.
> It's broken shit.
>


For creating the repo and branch, I just followed the instruction from wiki
https://help.github.com/articles/create-a-repo/

and for pushing changes
https://help.github.com/articles/fork-a-repo/

I jut use git (git version 2.1.4) for pushing the changes in github repo.

There is no other tools used.




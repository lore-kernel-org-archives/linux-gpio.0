From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Fri, 18 Mar 2016 00:15:25 -0700
Message-ID: <CA+55aFy=-UAbVo+Xx08tBA7eTPk2B+G3=SbarVxThS57LdakPA@mail.gmail.com>
References: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
	<CA+55aFwV4Cq=4zJc6Fw0yAGrTmci_DFAjJKxkk05pjJJf3iYbA@mail.gmail.com>
	<56EB9B0C.4050507@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:37983 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbcCRHP0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 03:15:26 -0400
In-Reply-To: <56EB9B0C.4050507@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Junio C Hamano <gitster@pobox.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

On Thu, Mar 17, 2016 at 11:07 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
> For creating the repo and branch, I just followed the instruction from wiki
> https://help.github.com/articles/create-a-repo/

So you shouldn't have created a new repo at all, you should just have
cloned an existing one (that gets you a repo, of course).

You basically ended up starting a new project.

But I guess the github connection explains why there was a crazy
README.md file there, and I can see why that documentation would make
you think it's the right thing to do.

Oh well.

Just a "git init" wouldn't have done that kind of damage, the github
documentation is just misleading in this respect.

We may have to make it really really really clear for the kernel that
people should not use github in any way except purely for hosting..

> I jut use git (git version 2.1.4) for pushing the changes in github repo.
>
> There is no other tools used.

I thought git didn't merge two branches that have no common base by
default, but it seems it will happily do so.

So once you made the mistake of starting a new project, git merge
ended up "helpfully" allowing you to merge the remote tracking branch
into that new project, and we ended up with a silly new root.

"git pull-request" will complain about not having a commit in common,
but "git merge" apparently does not even warn.

Adding Junio and the git list. This seems like much too easy a way to screw up.

Junio (and git people), the problem is that github seems to have
caused Laxman to think he should start a new project, and then git
happily merged the new root just because nobody knew better. And
sadly, I didn't notice the history screw-up until too late, so now we
in the kernel have a third root commit (the first two are
intentional): commit a101ad945113 was merged by commit e5451c8f8330.

So how about a patch something like this:

  --- a/builtin/merge.c
  +++ b/builtin/merge.c
  @@ -1398,7 +1398,7 @@ int cmd_merge(int argc, const char **argv,
const char *prefix)
                     NULL, 0, UPDATE_REFS_DIE_ON_ERR);

          if (remoteheads && !common)
  -               ; /* No common ancestors found. We need a real merge. */
  +               die(_("No common ancestor - not merging"));
          else if (!remoteheads ||
                   (!remoteheads->next && !common->next &&
                    common->item == remoteheads->item)) {

(the above is explicitly whitespace-damaged on purpose - it's not
meant as a serious patch, because we do want the *ability* to merge
different projects across different roots, and there are even git
tests for it, it's just that I think it's too easy to make this
mistake and not even realize).

So the real thing having a special option required to merge
non-related projects? Or at least a humongous warning?

You can recreate (for testing only!) this by doing this in a kernel repo:

  git checkout a101ad945113
  git merge 3cf42efc3479

and you'll see how it happily ends up creating a merge commit with no
common ancestors and no warning that anything might be wrong. It will
take a while - walking all the way up to the root to not find the
common object - but it will happily merge those two totally unrelated
branches without complaining at all.

Now I'm starting to wonder just how many github projects have lots of
separate root commits..

            Linus

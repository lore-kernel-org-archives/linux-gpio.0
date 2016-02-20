From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in __request_region()
Date: Sat, 20 Feb 2016 09:11:54 -0800
Message-ID: <CA+55aFx9-itKjqahUnXAoeDNgbi1MeNH5gDQB8Sw9AguPwGefQ@mail.gmail.com>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
	<1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
	<20160219221056.23487da2@x2>
	<56C7A459.1090801@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:36157 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758811AbcBTRLy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 12:11:54 -0500
In-Reply-To: <56C7A459.1090801@virtuousgeek.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Vincent Pelletier <plr.vincent@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>, Alan Cox <alan@linux.intel.com>, Giel van Schijndel <me@mortis.eu>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

On Fri, Feb 19, 2016 at 3:25 PM, Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
> +Linus (the de-facto resource guy).
>
> On 02/19/2016 01:10 PM, Vincent Pelletier wrote:
>>
>> I finally got around to rebasing some patches, and realised that the
>> patch from Simon Guinot below still gets rebased over torvalds' v4.4 .
>>
>> Any reason it was not applied ?
>> Or was the issue fixed in another, non-git-conflicting way ? (I see
>> nothing recent in git log kernel/resource.c)
>>
>> I do not find a trace of a mail confirming that I tested it and that it
>> fixes the issue. So here goes:
>> Tested-by: Vincent Pelletier <plr.vincent@gmail.com>

Hmm.

So I'm not entirely happy with the patch, because I think the problem
with using a possibly free'd parent resource at restart still exists.

As far as I can tell, if we hit the IORESOURCE_MUXED case *after* we
have successfully delved into a resource that wasn't busy, we will
have updated "parent" in a previous iteration of the loop, and we'll
not use the original parent when we then re-start after the sleep. So
quite frankly, I suspect any user of MUXED memory regions is still
fundamentally buggy, and IORESOURCE_MUXED has always been a hacky and
broken thing.

That said, I ended up applying the patch anyway, even if I despise it.
For all I know, muxed users never end up having those non-busy
sub-resources in practice, and maybe there is some serialization at
the top level for the drivers that use it. So if testing has shown
that it helps some actual case, I'll believe the testing. But the code
still looks rather debatable, and the whole IORESOURCE_MUXED approach
looks broken.

Jesse, that came in through you and the drm tree, I think. Alan is
marked as author, and there are other people who actually use and can
test the code. Can you guys think about the code a bit more.

I'm wondering if the *real* fix ends up being to reset the 'parent'
pointer to the original top-level parent after the sleep?

To recap: the patch is in my tree, but I'm not all that happy about it.

                    Linus

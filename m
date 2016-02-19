From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Fri, 19 Feb 2016 22:10:56 +0100
Message-ID: <20160219221056.23487da2@x2>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
	<1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36364 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2992692AbcBSVHw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 16:07:52 -0500
In-Reply-To: <1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Alan Cox <alan@linux.intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

Hello,

I finally got around to rebasing some patches, and realised that the
patch from Simon Guinot below still gets rebased over torvalds' v4.4 .

Any reason it was not applied ?
Or was the issue fixed in another, non-git-conflicting way ? (I see
nothing recent in git log kernel/resource.c)

I do not find a trace of a mail confirming that I tested it and that it
fixes the issue. So here goes:
Tested-by: Vincent Pelletier <plr.vincent@gmail.com>

Testing details: bug reproduced on 4.1, patch applied over 4.1 and bug
disappeared. After rebasing this patch (along with others) over 4.4,
bug does not reappear. I did not try to reproduce bug with 4.4, but if
preferred I can give it a go.

On Thu, 10 Sep 2015 00:15:18 +0200, Simon Guinot
<simon.guinot@sequanux.org> wrote:
> In __request_region, if a conflict with a BUSY and MUXED resource is
> detected, then the caller goes to sleep and waits for the resource to
> be released. A pointer on the conflicting resource is kept. At wake-up
> this pointer is used as a parent to retry to request the region. A first
> problem is that this pointer might well be invalid (if for example the
> conflicting resource have already been freed). An another problem is
> that the next call to __request_region() fails to detect a remaining
> conflict. The previously conflicting resource is passed as a parameter
> and __request_region() will look for a conflict among the children of
> this resource and not at the resource itself. It is likely to succeed
> anyway, even if there is still a conflict. Instead, the parent of the
> conflicting resource should be passed to __request_region().
> 
> As a fix attempt, this patch don't update the parent resource pointer in
> the case we have to wait for a muxed region right after.
> 
> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> Tested-by: Vincent Donnefort <vdonnefort@gmail.com>
> ---
>  kernel/resource.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/resource.c b/kernel/resource.c
> index fed052a1bc9f..b8c84804db6a 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1072,9 +1072,10 @@ struct resource * __request_region(struct resource *parent,
>  		if (!conflict)
>  			break;
>  		if (conflict != parent) {
> -			parent = conflict;
> -			if (!(conflict->flags & IORESOURCE_BUSY))
> +			if (!(conflict->flags & IORESOURCE_BUSY)) {
> +				parent = conflict;
>  				continue;
> +			}
>  		}
>  		if (conflict->flags & flags & IORESOURCE_MUXED) {
>  			add_wait_queue(&muxed_resource_wait, &wait);

Regards,
-- 
Vincent Pelletier

From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Fri, 19 Feb 2016 15:25:13 -0800
Message-ID: <56C7A459.1090801@virtuousgeek.org>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
 <1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
 <20160219221056.23487da2@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:34584 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1428550AbcBSXY5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 18:24:57 -0500
In-Reply-To: <20160219221056.23487da2@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>
Cc: Alan Cox <alan@linux.intel.com>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Torvalds <torvalds@linux-foundation.org>

+Linus (the de-facto resource guy).

On 02/19/2016 01:10 PM, Vincent Pelletier wrote:
> Hello,
> 
> I finally got around to rebasing some patches, and realised that the
> patch from Simon Guinot below still gets rebased over torvalds' v4.4 .
> 
> Any reason it was not applied ?
> Or was the issue fixed in another, non-git-conflicting way ? (I see
> nothing recent in git log kernel/resource.c)
> 
> I do not find a trace of a mail confirming that I tested it and that it
> fixes the issue. So here goes:
> Tested-by: Vincent Pelletier <plr.vincent@gmail.com>
> 
> Testing details: bug reproduced on 4.1, patch applied over 4.1 and bug
> disappeared. After rebasing this patch (along with others) over 4.4,
> bug does not reappear. I did not try to reproduce bug with 4.4, but if
> preferred I can give it a go.
> 
> On Thu, 10 Sep 2015 00:15:18 +0200, Simon Guinot
> <simon.guinot@sequanux.org> wrote:
>> In __request_region, if a conflict with a BUSY and MUXED resource is
>> detected, then the caller goes to sleep and waits for the resource to
>> be released. A pointer on the conflicting resource is kept. At wake-up
>> this pointer is used as a parent to retry to request the region. A first
>> problem is that this pointer might well be invalid (if for example the
>> conflicting resource have already been freed). An another problem is
>> that the next call to __request_region() fails to detect a remaining
>> conflict. The previously conflicting resource is passed as a parameter
>> and __request_region() will look for a conflict among the children of
>> this resource and not at the resource itself. It is likely to succeed
>> anyway, even if there is still a conflict. Instead, the parent of the
>> conflicting resource should be passed to __request_region().
>>
>> As a fix attempt, this patch don't update the parent resource pointer in
>> the case we have to wait for a muxed region right after.
>>
>> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
>> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
>> Tested-by: Vincent Donnefort <vdonnefort@gmail.com>
>> ---
>>  kernel/resource.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/resource.c b/kernel/resource.c
>> index fed052a1bc9f..b8c84804db6a 100644
>> --- a/kernel/resource.c
>> +++ b/kernel/resource.c
>> @@ -1072,9 +1072,10 @@ struct resource * __request_region(struct resource *parent,
>>  		if (!conflict)
>>  			break;
>>  		if (conflict != parent) {
>> -			parent = conflict;
>> -			if (!(conflict->flags & IORESOURCE_BUSY))
>> +			if (!(conflict->flags & IORESOURCE_BUSY)) {
>> +				parent = conflict;
>>  				continue;
>> +			}
>>  		}
>>  		if (conflict->flags & flags & IORESOURCE_MUXED) {
>>  			add_wait_queue(&muxed_resource_wait, &wait);
> 
> Regards,
> 


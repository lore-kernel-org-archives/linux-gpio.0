From: Octavian Purdila <octavian.purdila@intel.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 11:10:38 +0200
Message-ID: <CAE1zotJ1gj5q69vVMF3=y6KMgGJYSVRvxgPTL=GnU+tGKxNi3w@mail.gmail.com>
References: <1418740800.10278.1.camel@phoenix>
	<5490635D.6040305@intel.com>
	<CAAVeFuKEF8GiEEjrc_whmEW-C+YxZr_e5LhTCK=wgqQssr7P6Q@mail.gmail.com>
	<CAE1zotJ+S8SkVAoj-FVm0wbxnJ6ww0YL1EsXENzrKHMJTR0TXg@mail.gmail.com>
	<CAAVeFu+ZTrMgEs=PJzHGxgatkjvVtPjcS1kRLCBiHk8pK7BVfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:48379 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152AbaLQJKk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 04:10:40 -0500
Received: by mail-wi0-f173.google.com with SMTP id r20so14951740wiv.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 01:10:39 -0800 (PST)
In-Reply-To: <CAAVeFu+ZTrMgEs=PJzHGxgatkjvVtPjcS1kRLCBiHk8pK7BVfw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>

On Wed, Dec 17, 2014 at 10:59 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Dec 17, 2014 at 5:57 PM, Octavian Purdila
> <octavian.purdila@intel.com> wrote:
>> On Wed, Dec 17, 2014 at 10:50 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>>> On Wed, Dec 17, 2014 at 1:52 AM, Daniel Baluta <daniel.baluta@intel.com> wrote:
>>>>
>>>>
>>>> On 12/16/2014 04:40 PM, Axel Lin wrote:
>>>>>
>>>>> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>>>>>
>>>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>>>
>>>>
>>>> Tested-by: Daniel Baluta <daniel.baluta@intel.com>
>>>
>>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>>>
>>> But this seems to apply to patches in mid-flight, could it be squashed
>>> there maybe?
>>
>> Sure, I can add it to the existing series, but I prefer to keep it as
>> separate patch. Is that ok with you?
>
> Why? This is clearly a fix, so if the series is not merged yet,
> doesn't it make more sense to squash it and have the desired
> functionality from the start?

The fix is not for issues introduced by the series, but for an issue
existing in the already merged code. Also it is a separate issue then
the one fixed in the other patches in the series.

AFAIK each fix should be in a separate patch, am I missing something?

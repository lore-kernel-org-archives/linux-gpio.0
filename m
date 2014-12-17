From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 17:59:18 +0900
Message-ID: <CAAVeFu+ZTrMgEs=PJzHGxgatkjvVtPjcS1kRLCBiHk8pK7BVfw@mail.gmail.com>
References: <1418740800.10278.1.camel@phoenix> <5490635D.6040305@intel.com>
 <CAAVeFuKEF8GiEEjrc_whmEW-C+YxZr_e5LhTCK=wgqQssr7P6Q@mail.gmail.com> <CAE1zotJ+S8SkVAoj-FVm0wbxnJ6ww0YL1EsXENzrKHMJTR0TXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:58896 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319AbaLQI7j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 03:59:39 -0500
Received: by mail-ig0-f173.google.com with SMTP id r2so8364293igi.12
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 00:59:38 -0800 (PST)
In-Reply-To: <CAE1zotJ+S8SkVAoj-FVm0wbxnJ6ww0YL1EsXENzrKHMJTR0TXg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Octavian Purdila <octavian.purdila@intel.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>

On Wed, Dec 17, 2014 at 5:57 PM, Octavian Purdila
<octavian.purdila@intel.com> wrote:
> On Wed, Dec 17, 2014 at 10:50 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Wed, Dec 17, 2014 at 1:52 AM, Daniel Baluta <daniel.baluta@intel.com> wrote:
>>>
>>>
>>> On 12/16/2014 04:40 PM, Axel Lin wrote:
>>>>
>>>> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>>>>
>>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>>
>>>
>>> Tested-by: Daniel Baluta <daniel.baluta@intel.com>
>>
>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> But this seems to apply to patches in mid-flight, could it be squashed
>> there maybe?
>
> Sure, I can add it to the existing series, but I prefer to keep it as
> separate patch. Is that ok with you?

Why? This is clearly a fix, so if the series is not merged yet,
doesn't it make more sense to squash it and have the desired
functionality from the start?

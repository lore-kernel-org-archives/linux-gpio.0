From: Octavian Purdila <octavian.purdila@intel.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 10:57:19 +0200
Message-ID: <CAE1zotJ+S8SkVAoj-FVm0wbxnJ6ww0YL1EsXENzrKHMJTR0TXg@mail.gmail.com>
References: <1418740800.10278.1.camel@phoenix>
	<5490635D.6040305@intel.com>
	<CAAVeFuKEF8GiEEjrc_whmEW-C+YxZr_e5LhTCK=wgqQssr7P6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:53418 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbaLQI5U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 03:57:20 -0500
Received: by mail-wg0-f44.google.com with SMTP id b13so19531381wgh.17
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 00:57:19 -0800 (PST)
In-Reply-To: <CAAVeFuKEF8GiEEjrc_whmEW-C+YxZr_e5LhTCK=wgqQssr7P6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>

On Wed, Dec 17, 2014 at 10:50 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Dec 17, 2014 at 1:52 AM, Daniel Baluta <daniel.baluta@intel.com> wrote:
>>
>>
>> On 12/16/2014 04:40 PM, Axel Lin wrote:
>>>
>>> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>>>
>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>
>>
>> Tested-by: Daniel Baluta <daniel.baluta@intel.com>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> But this seems to apply to patches in mid-flight, could it be squashed
> there maybe?

Sure, I can add it to the existing series, but I prefer to keep it as
separate patch. Is that ok with you?

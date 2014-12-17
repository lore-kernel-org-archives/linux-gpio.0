From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 17:50:59 +0900
Message-ID: <CAAVeFuKEF8GiEEjrc_whmEW-C+YxZr_e5LhTCK=wgqQssr7P6Q@mail.gmail.com>
References: <1418740800.10278.1.camel@phoenix> <5490635D.6040305@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:47307 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751692AbaLQIvU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 03:51:20 -0500
Received: by mail-ie0-f172.google.com with SMTP id tr6so14653179ieb.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 00:51:19 -0800 (PST)
In-Reply-To: <5490635D.6040305@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Baluta <daniel.baluta@intel.com>
Cc: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Octavian Purdila <octavian.purdila@intel.com>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>

On Wed, Dec 17, 2014 at 1:52 AM, Daniel Baluta <daniel.baluta@intel.com> wrote:
>
>
> On 12/16/2014 04:40 PM, Axel Lin wrote:
>>
>> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
>
> Tested-by: Daniel Baluta <daniel.baluta@intel.com>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

But this seems to apply to patches in mid-flight, could it be squashed
there maybe?

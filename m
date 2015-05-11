From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 2/4] gpio: gpio-generic: add flag to read out output value
 from reg_set
Date: Mon, 11 May 2015 16:28:05 +0300
Message-ID: <5550AE65.8070401@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>	<1430321701-13758-3-git-send-email-vladimir_zapolskiy@mentor.com> <CACRpkdbw_Gy5Qswp=90hwL=iOfxQSHBEk6rSRLhBKWoP6Le+LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:61407 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367AbbEKN2J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 09:28:09 -0400
In-Reply-To: <CACRpkdbw_Gy5Qswp=90hwL=iOfxQSHBEk6rSRLhBKWoP6Le+LA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 11.05.2015 12:50, Linus Walleij wrote:
> On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
> 
>> The change introduces BGPIOF_READ_OUTPUT_REG_SET flag for gpio-generic
>> GPIO chip implementation, which allows to get correct configured value
>> from reg_set register, input value is still get from reg_dat.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> Looks reasonable. Patch applied.
> 
> Do we need device tree bindings for this?

I don't think so, particular drivers have this as a fixed property, and
"basic-mmio-gpio" has no device tree bindings.

OTOH let see on dynamics of the flag usage, if it grows, it may happen
that its negation is a better candidate for a quirk.

--
With best wishes,
Vladimir


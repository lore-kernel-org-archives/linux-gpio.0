From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] RFC: interrupt consistency check for OF GPIO IRQs
Date: Thu, 22 Aug 2013 01:00:14 +0200
Message-ID: <CACRpkdZLZv7LA8rN-MyUaB9jYMyxb1Sw0LyqFHUAec1GnHzE+g@mail.gmail.com>
References: <1376387195-27469-1-git-send-email-larsi@wh2.tu-dresden.de>
	<9241298.URG9CVQFmF@flatron>
	<5212737A.1030904@wwwdotorg.org>
	<201308211521.21129.poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:64255 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753113Ab3HUXAO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2013 19:00:14 -0400
Received: by mail-ob0-f174.google.com with SMTP id wd6so2099557obb.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2013 16:00:14 -0700 (PDT)
In-Reply-To: <201308211521.21129.poeschel@lemonage.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, galak@codeaurora.org, Pawel Moll <pawel.moll@arm.com>

On Wed, Aug 21, 2013 at 3:21 PM, Lars Poeschel <poeschel@lemonage.de> wrote:
> On Monday 19 August 2013 at 21:35:22, Stephen Warren wrote:
>> On 08/17/2013 03:59 AM, Tomasz Figa wrote:

>> > Then two _example_ formats follow, preceded by following statement:
>> >     The following two variants are commonly used:
>> > I already know a variant which uses three (Exynos combiner) and four
>> > (S3C24xx interrupt controller) cells. They are not pin controllers,
>> > but you can't stop anyone from adopting similar or even more complex
>> > specifiers formats for their hardware, especially when it matches
>> > more closely the interrupt/pin layout used in their hardware.
>>
>> Yes, the binding doc interrupts.txt mentioned above does not specify
>> *the* one-/two-cell format, but *a* common/possible one- and two-cell
>> format. There's no strict reason that all interrupt controllers have to
>> use those exact formats. The only way to parse interrupt specifiers is
>> to ask the driver for the the interrupt controller code to parse the
>> property.
>
> I agree with you. I also understand the interrupts.txt binding doc as it
> lists only a common/possible cell format, but it's purpose is not to
> restrict it to this.
>
> I send an updated patch, that uses the drivers xlate function to parse the
> interrupt property in a few minutes.

Thanks that you take this on a spin, I've been busy...

(I also agree with the other comments here, let's see if we can
figure this out!)

Yours,
Linus Walleij

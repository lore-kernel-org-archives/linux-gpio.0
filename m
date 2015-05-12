From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFI] pinmux: pin group ownership
Date: Tue, 12 May 2015 13:55:42 +0100
Message-ID: <5551F84E.9040602@nvidia.com>
References: <554CCFD1.5050907@nvidia.com>	<CACRpkdY_Le063_hA4+kKMD8NFMFdVVB89g8YeCsWnoTg4dADxw@mail.gmail.com>	<5551E9B9.5030208@nvidia.com> <CACRpkdYMgu-_52gYT54W0dSLXap9spDuaz35rcnrx0mGvu=B2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7932 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933100AbbELMzv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 08:55:51 -0400
In-Reply-To: <CACRpkdYMgu-_52gYT54W0dSLXap9spDuaz35rcnrx0mGvu=B2Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>


On 12/05/15 13:10, Linus Walleij wrote:
> On Tue, May 12, 2015 at 1:53 PM, Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> [Me]:
>>> The usecount are done on individual pins, not groups.
>>
>> Thanks for confirming. With regard to the change
>> e5b3b2d9ed202697a937c282f9c4d93b1e3e0848, IIUC then this allows devices
>> not to define any pins but just groups. Probably because from some
>> devices (such as berlin) pinmux'ing is always done at the group level.
> 
> That's correct.
> 
>> If this is the case then it would appear that there is no protection
>> against two devices trying to use the same group. Is this correct?
> 
> Seems like so... darn you found a loophole.

Ok, I was hoping I had missed something, so thanks for confirming.

>>> In the devel tree you can even set the pinmux_ops.strict to disallow
>>> GPIOs and other functions to share a pin.
>>
>> Thanks, however, I don't think that this helps in this case because
>> pin_request() would not be called by pinmux_enable_setting() as num_pins
>> = 0.
> 
> You're right.
> 
> The implementation assumes collissions happen at pin level,
> not group level.
> 
> I wonder if there are enough devices out there with this problem
> that we need to check for it?

Probably not many, indeed.

> If so I would opt to create a bool .group_only property
> on pinmux_ops like we created .strict so that we can
> avoid all pin-specific code on such pin controllers.
> 
> But I don't know it it's worth it for these few pin controllers :/
> 
> On the U300 there is only group selection, but the datasheet
> helpfully defined all pins anyway so I could handle collissions
> on the pin level. This is the ideal solution if possible.

Yes, I agree registering all pins would be ideal, however, I could see
that this may seem unnecessary for some devices.

Thanks for the info.

Cheers
Jon

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------

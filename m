From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFI] pinmux: pin group ownership
Date: Tue, 12 May 2015 12:53:29 +0100
Message-ID: <5551E9B9.5030208@nvidia.com>
References: <554CCFD1.5050907@nvidia.com> <CACRpkdY_Le063_hA4+kKMD8NFMFdVVB89g8YeCsWnoTg4dADxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6182 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932720AbbELLxf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:53:35 -0400
In-Reply-To: <CACRpkdY_Le063_hA4+kKMD8NFMFdVVB89g8YeCsWnoTg4dADxw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>

Hi Linus,

On 12/05/15 12:30, Linus Walleij wrote:
> On Fri, May 8, 2015 at 5:01 PM, Jon Hunter <jonathanh@nvidia.com> wrote:
> 
>> Looking at this change, if pinmux_enable_setting() is called but
>> .get_group_pins() is not defined, then num_pins will be 0. If this is
>> the case then pin_request() is not called to allocate the pins in the
>> group (because no pins are defined for the group). So that makes sense.
>>
>> However, I am trying to understand then, if the pinmux driver will
>> protect against another device attempting to use the same group for a
>> different function when already in-use?
>>
>> For example, if you have the two functions i2c0 and uart0 mapped to pin
>> group A, but no pins are defined for group A, will pinmux prevent
>> someone attempting to configure both functions on the same group at the
>> same time?
>>
>> I did not see anywhere that sets a usecount for a group (ie. allocates
>> the group) but only for a pin.
> 
> The usecount are done on individual pins, not groups.

Thanks for confirming. With regard to the change
e5b3b2d9ed202697a937c282f9c4d93b1e3e0848, IIUC then this allows devices
not to define any pins but just groups. Probably because from some
devices (such as berlin) pinmux'ing is always done at the group level.
If this is the case then it would appear that there is no protection
against two devices trying to use the same group. Is this correct?

> In the devel tree you can even set the pinmux_ops.strict to disallow
> GPIOs and other functions to share a pin.

Thanks, however, I don't think that this helps in this case because
pin_request() would not be called by pinmux_enable_setting() as num_pins
= 0.

Cheers
Jon

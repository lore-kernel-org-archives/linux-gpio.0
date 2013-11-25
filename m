From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpiolib: add missing declarations
Date: Mon, 25 Nov 2013 18:26:03 +0900
Message-ID: <529317AB.1050600@nvidia.com>
References: <1385186069-28986-1-git-send-email-acourbot@nvidia.com> <20131125085831.GO2281@intel.com> <CAAVeFu+wFAqroiyzwRQLkRAmhVQV-efOYA51DTHUwMMA1nTYxA@mail.gmail.com> <20131125092802.GQ2281@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2803 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725Ab3KYJ0H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2013 04:26:07 -0500
In-Reply-To: <20131125092802.GQ2281@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/25/2013 06:28 PM, Mika Westerberg wrote:
> On Mon, Nov 25, 2013 at 06:07:10PM +0900, Alexandre Courbot wrote:
>> On Mon, Nov 25, 2013 at 5:58 PM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>>> On Sat, Nov 23, 2013 at 02:54:29PM +0900, Alexandre Courbot wrote:
>>>> Add missing declarations and include files to avoid warnings during
>>>> compilation of include/gpio/driver.h.
>>>
>>> It would be good to have those warnings included in the changelog as well.
>>
>> As in, copy-pasting the compiler's output? Isn't the change explicit enough?
>
> If you just do 'git log' you can't see the change itself and that's where
> the changelog should help. If I see some warnings when I build the kernel,
> the first thing I usually do is to check 'git log' against linux-next and
> see if someone has already fixed that warning (grepping the warning message
> from changelog).

Ah, I can see several examples of what you mention indeed. Will add 
these and send a v2.


From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/3] pinctrl: ns2: add pinmux driver support for Broadcom
 NS2 SoC
Date: Wed, 9 Mar 2016 13:07:31 -0800
Message-ID: <b771e51f-e183-052d-eb6f-ff8f3ec76bf3@broadcom.com>
References: <1457005303-26829-1-git-send-email-yendapally.reddy@broadcom.com>
 <1457005303-26829-3-git-send-email-yendapally.reddy@broadcom.com>
 <CACRpkdaKn4puDsZBPSbfkmHW4KHqBW8q1T2vpyNk_0Yb7C0AXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 5520-maca-inet1-outside.broadcom.com ([216.31.211.11]:22361
	"EHLO mail-irv-18.broadcom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933627AbcCIVHf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 16:07:35 -0500
In-Reply-To: <CACRpkdaKn4puDsZBPSbfkmHW4KHqBW8q1T2vpyNk_0Yb7C0AXQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Jonathan Bell <jonathan@raspberrypi.org>
Cc: Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 3/9/2016 3:04 AM, Linus Walleij wrote:
> On Thu, Mar 3, 2016 at 6:41 PM, Yendapally Reddy Dhananjaya Reddy
> <yendapally.reddy@broadcom.com> wrote:
>
>> This adds the initial support of the Broadcom NS2 pinmux driver
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
>
> Now yet another Broadcom driver!
>
> Can I get the help of the maintainers of the other
> Broadcom drivers to say:
>
> - If this looks sane
>

I've reviewed this driver internally before it was sent out to public. 
Here's my reviewed-by:

Reviewed-by: Ray Jui <ray.jui@broadcom.com>

Like I mentioned before, we have been working closely with our ASIC team 
to have one pad per register based register layout in our next-gen SoC. 
That way we are able to use the generic pinctrl-single driver. It's 
definitely our best interest to re-use a generic driver when possible, 
to minimize the ongoing maintenance cost. Note we only have control on 
chips that we work on; there are other Broadcom SoCs that we do not have 
a say, unfortunately.

> - If this hardware looks suspiciously similar to one of the
>   other drivers and should rather me a subdriver of one of
>   the existing ones

The IOMUX block in NS2 seems different from that of Cygnus and NSP. It 
only supports group based mux configuration and does not have any 
mechanism to allow GPIO pin function override. It also supports per pad 
based pinconf functions.

>
> Yours,
> Linus Walleij
>

Thanks,

Ray

From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 2/3] pinctrl: nsp: add pinmux driver support for Broadcom
 NSP SoC
Date: Mon, 30 Nov 2015 09:05:40 -0800
Message-ID: <565C81E4.90507@broadcom.com>
References: <1448042245-25702-1-git-send-email-yrdreddy@broadcom.com>
 <CACRpkdZ=vyPSiPCUppfDWC9OShqfe-BRvB5QjU1AZmbDbYvsZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:29027 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484AbbK3RFn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 12:05:43 -0500
In-Reply-To: <CACRpkdZ=vyPSiPCUppfDWC9OShqfe-BRvB5QjU1AZmbDbYvsZQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

Hi Linus,

On 11/30/2015 4:49 AM, Linus Walleij wrote:
> On Fri, Nov 20, 2015 at 6:57 PM, Yendapally Reddy Dhananjaya Reddy
> <yrdreddy@broadcom.com> wrote:
>
>> This adds the initial support of the Broadcom NSP pinmux driver.
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
>
> So what does Ray and Stephen say about this?
>
> Is the hardware unique enough to warrant its own driver?
>
> Or should it utilize/extend one of the existing Broadcom
> drivers?

Currently, the IOMUX configurations in Cygnus, NSP, and NS2 are 
completely different and require a separate driver to each of these 
SoCs. We now realize the shortcomings and have been communicating with 
our ASIC team. We'd like to fix this for the next-gen of our SoC. We are 
driving towards using a register layout that will allow us to use just 
"pinctrl-single" and "pinconf-single."

>
> Yours,
> Linus Walleij
>

Thanks,

Ray

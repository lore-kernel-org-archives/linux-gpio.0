From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 090/182] pinctrl: cygnus-gpio: use gpiochip data pointer
Date: Mon, 14 Dec 2015 09:01:25 -0800
Message-ID: <566EF5E5.9070305@broadcom.com>
References: <1449667793-1826-1-git-send-email-linus.walleij@linaro.org>
 <56685F8F.4020700@broadcom.com>
 <CACRpkdbSDCdQJvDUyvYo9-HRbh66XRYNMH7VdFLPARqgTK_mBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:9916 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590AbbLNRB2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 12:01:28 -0500
In-Reply-To: <CACRpkdbSDCdQJvDUyvYo9-HRbh66XRYNMH7VdFLPARqgTK_mBw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>



On 12/13/2015 3:27 AM, Linus Walleij wrote:
> On Wed, Dec 9, 2015 at 6:06 PM, Ray Jui <rjui@broadcom.com> wrote:
>
>> The change itself looks fine to me. But I thought the previous patchset from
>> Pramod changes the file name, all the function names and macros from
>> "cygnus" to "iproc" and have been merged by you?
>>
>> Shouldn't this patch be developed on top of that? Or am I missing something?
>
> Merge conflicts is a fact of life. I am merging this change to the GPIO
> tree and the other stuff is merged to the pinctrl tree.
>
> That said I think that git copes with this kind of stuff. And if it doesn't,
> I will maybe merge the trees into one for this merge window, just to make
> things easier.
>
> Yours,
> Linus Walleij
>

Okay. As it is this change looks good to me!

Acked-by: Ray Jui <rjui@broadcom.com>

Thanks!

Ray

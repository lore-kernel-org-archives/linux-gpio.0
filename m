From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 1/4] gpiolib: unify pr_* messages format
Date: Wed, 4 Dec 2013 15:15:53 +0900
Message-ID: <529EC899.8030603@nvidia.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386097406-24585-2-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13936 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897Ab3LDGP4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 01:15:56 -0500
In-Reply-To: <1386097406-24585-2-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 12/04/2013 04:03 AM, Andy Shevchenko wrote:
> This patch includes following amendments:
>   1) use "?" as a label when last is not defined in gpiod_*;

"when last is not defined" -> "when none is defined" ?

>   2) whenever it's possilbe gpiod_* are used;

s/possilbe/possible

>   3) print a function name, if it's already used in other messages.
>
> Additionally it fixes an indentation in few places.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Nice cleanup. I wonder if we should not make the GPIO label mandatory in 
some future patch and always use it in error messages (and also build it 
from dev_name(dev) and con_id in gpiod_get()).

One thing I wonder though: are you *absolutely* sure that none of the 
gpiod_*() log functions you are using can be called with a NULL desc? If 
you are not, it might be worth to make them more robust to this case 
that would otherwise make the kernel crash.

Might be even better if we could get rid of these desc_to_gpio() calls 
and display something like "desc->chip->label[gpio_chip_hwgpio(desc)]" 
in the log instead of "gpio-desc_to_gpio(desc)".

(last suggestion is just a suggestion though, I'm ok with this patch as 
long as you can guarantee none of the desc_to_gpio(desc) calls will crash)

Alex.


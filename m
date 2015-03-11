From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: bcm63xx gpio issue on 3.19
Date: Wed, 11 Mar 2015 14:23:42 +0900
Message-ID: <54FFD15E.3040202@nvidia.com>
References: <54FDDE00.7030100@freebox.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6187 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbbCKFXs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 01:23:48 -0400
In-Reply-To: <54FDDE00.7030100@freebox.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Schichan <nschichan@freebox.fr>, linux-mips@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Nicolas,

(adding the linux-gpio mailing-list and Linus W.)

On 03/10/2015 02:53 AM, Nicolas Schichan wrote:
>
> Hello Alexandre,
>
> Using the latest 3.19 kernel, the bcm63xx GPIO code under
> arch/mips/bcm63xx/gpio.c is unable to register the gpio chip via
> gpiochip_add(), as it returns -ENOMEM. The kcalloc call for the gpio_desc
> array fails, as during prom code, it is too early for the kmalloc to work.
>
> It looks like the issue is caused by your patch: "gpio: remove gpio_descs
> global array"

Indeed. This happens because we removed the global GPIO array and 
replaced it with a more flexible per-chip array of GPIOs. We were hoping 
that issues like this one would have been caught in -next, but sadly the 
problem with bcm63xx went unnoticed until now. :(

>
> Could you please advise on how to fix/workaround that ? (ideally while keeping
> the possibility to invoke the gpiolib code from the setup/prom code).

The only allocation performed by gpiochip_add() is the array of 
gpio_descs. Having this array pre-allocated in your early code (maybe by 
using a static array variable) and passing it to a gpiochip_add_early() 
function would do the trick.

However, it is not that simple since gpio_desc is a private structure 
which details (including its size) are not visible outside of drivers/gpio.

Another solution I could see would be to have a kernel config option 
that would make gpiolib "pre-allocate" a number of gpio descriptors as a 
static array for such cases - similar to the global GPIO array, but not 
as big.

Finally, we can also restore the global GPIO array as a config option 
for the few architectures that need it.

Of course, I would prefer a solution based on dynamic allocation - is 
there a kind a primitive memory allocator that we can use at this early 
stage of boot? I.e. would alloc_pages() maybe work?

How do other subsystems that rely on dynamic allocation for registering 
their resources handle this? I guess regulator must fall in the same 
use-case, doesn't it?

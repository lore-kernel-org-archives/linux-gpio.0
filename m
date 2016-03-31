From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: ppc4xx: drop unused variable
Date: Thu, 31 Mar 2016 21:09:40 +1100
Message-ID: <1459418980.24848.1.camel@ellerman.id.au>
References: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42394 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243AbcCaKJu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Mar 2016 06:09:50 -0400
In-Reply-To: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Thu, 2016-03-31 at 09:14 +0200, Linus Walleij wrote:

> commit 0d36fe65f58391712e11a6621075f373216e5f00
> "powerpc: ppc4xx: use gpiochip data pointer"
> made the mm_gc local variable in ppc4xx_gpio_set()
> redundant, and when GCC treats warnings as errors this
> happens:
> 
> arch/powerpc/sysdev/ppc4xx_gpio.c: In function 'ppc4xx_gpio_set':
> arch/powerpc/sysdev/ppc4xx_gpio.c:93:26: error:
>   unused variable 'mm_gc' [-Werror=unused-variable]
>      struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>                              ^
>    cc1: all warnings being treated as errors
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I've applied this to the GPIO tree where the offending
> commit is now merged.

Thanks.

If you feel like cross building powerpc in future it should be as simple as:

 $ dnf install gcc-powerpc64-linux-gnu || apt-get install gcc-powerpc-linux-gnu
 $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ...

:)

cheers


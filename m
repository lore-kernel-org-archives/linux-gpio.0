From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Wed, 8 Apr 2015 10:18:23 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307566599151@IN01WEMBXB.internal.synopsys.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
 <1428414919.2665.2.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:46977 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752824AbbDHKS2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 06:18:28 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tuesday 07 April 2015 07:25 PM, Alexey Brodkin wrote:

Hi Linus,

On Tue, 2015-03-31 at 11:30 +0300, Alexey Brodkin wrote:


> From: Vineet Gupta <vgupta@synopsys.com><mailto:vgupta@synopsys.com>
>
> Synopsys SDP platform uses DW GPIO controller in design with
> ARC cores. So adding ARC to architectures that may select this
> GPIO controller.
>
> Even though support for Synopsys SDP is yet to be submitted we'll need
> this tiny option enabled at least for properly working interrupts (DW
> GPIO controller is used as interrupt controller).
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com><mailto:vgupta@synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com><mailto:abrodkin@synopsys.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com><mailto:andriy.shevchenko@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org><mailto:linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 4b3284b..83d2d0b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -148,7 +148,7 @@ config GPIO_GENERIC_PLATFORM
>
>  config GPIO_DWAPB
>       tristate "Synopsys DesignWare APB GPIO driver"
> -     depends on ((ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
> +     depends on ((ARC || ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
>       select GPIO_GENERIC
>       select GENERIC_IRQ_CHIP
>       help


I'm wondering if there's a chance for this patch to be reviewed and/or
applied?


Actually, given that ARC SDP support merge in upstream hinges on this one, Linus can u please provide ur ACK on this one so I could pick it up instead and route via the ARC tree for next window. That way we could lalso avoid any cross branch merge issues etc.

Thx,
-Vineet

Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0B233D6DD;
	Mon, 13 Apr 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087923; cv=none; b=Eix2aW0vJ6IS/IBWPc4Jt5ER776YT3J9zKzE9JTXS1AA5NH3CSieiRQRFEBnR8Y7m0fi21gxUCldbOfDBRq+ESXyzbYQ1a0fcmovPp5GJTw6cgo7ycHB2SODhgGbw45OmBsrWORq2wU16n/RKYhJv4/AbObHblhkA1hOR+TAg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087923; c=relaxed/simple;
	bh=WyiUE0gUbdjjvEx1688riyxWEbMO5SIwWFq6YOC87iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o16VJ47AL/aid6Pz4kOY+lRcS0uyxmYMctpNfgpYJk/6te63R7HQV57vYcFqtQvldn1Z4uYBP0svU/Ju/qjA1Lo9ZNO+b47yP+qD8H5xqx7cvFkzCtQHi8l9fjEcoqNxCfono3hOPhofRbnNvKOuv8ldp8DWtQFA3Q1ebq/Eh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aJ-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5A4C6C0CA1; Mon, 13 Apr 2026 15:44:53 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:44:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [resend, PATCH v2 1/1] MIPS: Alchemy: Remove unused forward
 declaration
Message-ID: <adzzVQNjjk9ZifNk@alpha.franken.de>
References: <20260320202852.3233790-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320202852.3233790-1-andriy.shevchenko@linux.intel.com>

On Fri, Mar 20, 2026 at 09:28:08PM +0100, Andy Shevchenko wrote:
> The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> This seems to be a leftover for a 5 years.
> 
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> v2 (resend): Cc'ed to GPIO maintainers and ML
> v2: collected tags (Thomas)
> 
> Bart, it was agreed to take this patch via GPIO tree
> (that's why we have an Ack), can you apply it, please?
> 
>  arch/mips/include/asm/mach-au1x00/gpio-au1000.h | 2 --
>  arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> index d820b481ac56..e6306f6820e6 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> @@ -40,8 +40,6 @@
>  #define AU1000_GPIO2_INTENABLE	0x10
>  #define AU1000_GPIO2_ENABLE	0x14
>  
> -struct gpio;
> -
>  static inline int au1000_gpio1_to_irq(int gpio)
>  {
>  	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> index 43d44f384f97..b12f37262cfa 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> @@ -12,7 +12,6 @@
>  #include <asm/io.h>
>  #include <asm/mach-au1x00/au1000.h>
>  
> -struct gpio;
>  struct gpio_chip;
>  
>  /* with the current GPIC design, up to 128 GPIOs are possible.
> -- 
> 2.50.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

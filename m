From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 6/9] drivers/gpio: make gpio-pl061.c explicitly
 non-modular
Date: Sun, 27 Mar 2016 20:40:06 +0300
Message-ID: <20160327174006.GC2637@tarshish>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
 <1459093489-18314-7-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:38422 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752463AbcC0RkR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 27 Mar 2016 13:40:17 -0400
Content-Disposition: inline
In-Reply-To: <1459093489-18314-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi Paul,

On Sun, Mar 27, 2016 at 11:44:46AM -0400, Paul Gortmaker wrote:
> The Kconfig for this driver is currently:
> 
> config GPIO_PL061
>         bool "PrimeCell PL061 GPIO support"
> 
> ...meaning that it currently is not being built as a module by anyone.
> Lets remove the couple traces of modularity, so that when reading the
> driver there is no doubt it is builtin-only.
> 
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 6/6] gpio: pca953x: make the define names consistent
Date: Thu, 08 Sep 2016 15:27:35 +0300
Message-ID: <1473337655.11323.94.camel@linux.intel.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
         <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:40824 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752174AbcIHM1l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Sep 2016 08:27:41 -0400
In-Reply-To: <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 2016-09-08 at 12:48 +0200, Bartosz Golaszewski wrote:
> The register offset defines for the pca953x and pca957x expander
> families should have the same names to better reflect their similar
> purposes.



 
>  	chip->regs = &pca957x_regs;
>  
> -	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
> +	ret = pca953x_read_regs(chip, PCA957X_OUTPUT, chip-
> >reg_output);
>  	if (ret)
>  		goto out;
> -	ret = pca953x_read_regs(chip, PCA957X_CFG, chip-
> >reg_direction);
> +	ret = pca953x_read_regs(chip, PCA957X_DIRECTION, chip-
> >reg_direction);

Bu we may use chip->regs->direction here, right? And output before. 

>  	if (ret)
>  		goto out;
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

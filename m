From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 4/5] gpio: pca953x: remove an unused variable
Date: Wed, 07 Sep 2016 16:58:44 +0300
Message-ID: <1473256724.11323.72.camel@linux.intel.com>
References: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
         <1473255472-16090-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:60603 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752767AbcIGN6v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 09:58:51 -0400
In-Reply-To: <1473255472-16090-5-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 15:37 +0200, Bartosz Golaszewski wrote:
> The chip_type variable in struct pca953x_chip is no longer required.
> 
> Remove it.
> 
> -		chip->write_regs = chip->chip_type == PCA953X_TYPE ?
> -					pca953x_write_regs_16 :
> -					pca957x_write_regs_16;
> +		if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
> +			chip->write_regs = pca953x_write_regs_16;
> +		else
> +			chip->write_regs = pca957x_write_regs_16;
>  		chip->read_regs = pca953x_read_regs_16;

I would also move this to previous patch.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

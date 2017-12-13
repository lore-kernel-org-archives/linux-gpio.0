From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/3] [v8] pinctrl: qcom: disable GPIO groups with no pins
Date: Wed, 13 Dec 2017 16:42:28 +0200
Message-ID: <1513176148.7000.21.camel@linux.intel.com>
References: <1513111858-6251-1-git-send-email-timur@codeaurora.org>
         <1513111858-6251-3-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:34655 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752749AbdLMOpd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Dec 2017 09:45:33 -0500
In-Reply-To: <1513111858-6251-3-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On Tue, 2017-12-12 at 14:50 -0600, Timur Tabi wrote:
> pinctrl-msm only accepts an array of GPIOs from 0 to n-1, and it
> expects
> each group to support have only one pin (npins == 1).
> 
> We can support "sparse" GPIO maps if we allow for some groups to have
> zero
> pins (npins == 0).  These pins are "hidden" from the rest of the
> driver
> and gpiolib.
> 
> Access to unavailable GPIOs is blocked via a request callback.  If the
> requested GPIO is unavailable, -EACCES is returned, which prevents
> further access to that GPIO.

We recently have some interesting BIOS/Windows driver design which makes
a need of something similar. Mika did patched pinctrl-intel for that. I
dunno that approach can be used here, or your proposal be utilized in
pinctrl-intel. Mika, any comments?

See some nitpicks below.

>  
>  	seq_printf(s, " %-8s: %-3s %d", g->name, is_out ? "out" :
> "in", func);
>  	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
> -	seq_printf(s, " %s", pulls[pull]);
> +	seq_printf(s, " %s\n", pulls[pull]);

I would rather do

 seq_putc(s, '\n');

which makes code slightly more flexible for maintenance and reading.


>  }
>  
>  static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip
> *chip)
> @@ -524,23 +529,36 @@ static void msm_gpio_dbg_show(struct seq_file
> *s, struct gpio_chip *chip)
>  	unsigned gpio = chip->base;
>  	unsigned i;
>  
> -	for (i = 0; i < chip->ngpio; i++, gpio++) {
> +	for (i = 0; i < chip->ngpio; i++, gpio++)
>  		msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
> -		seq_puts(s, "\n");
> -	}

This kind of change looks like a candidate to a separate patch,
though I mentioned it's just a nit.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

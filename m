From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/4] Revert "gpio: set up initial state from
 .get_direction()"
Date: Tue, 31 Oct 2017 11:08:46 +0200
Message-ID: <1509440926.10233.77.camel@linux.intel.com>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
         <1509396602-1936-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1509396602-1936-2-git-send-email-timur@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 2017-10-30 at 15:49 -0500, Timur Tabi wrote:
> This reverts commit 72d3200061776264941be1b5a9bb8e926b3b30a5.
> 
> We cannot blindly query the direction of all GPIOs when the pins are
> first registered.  The get_direction callback normally triggers a
> read/write to hardware, but we shouldn't be touching the hardware for
> an individual GPIO until after it's been properly requested.
> 

> +		/* REVISIT: most hardware initializes GPIOs as inputs
> (often
> +		 * with pullups enabled) so power usage is minimized.
> Linux
> +		 * code should set the gpio direction first thing;
> but until
> +		 * it does, and in case chip->get_direction is not
> set, we may
> +		 * expose the wrong direction in sysfs.
> +		 */

Can you preserve the style and indentation of the commit?
Does checkpatch warn you about style? (It's apparently not a net
subsystem)

> +		desc->flags = !chip->direction_input ? (1 <<
> FLAG_IS_OUT) : 0;
>  	}
>  
>  #ifdef CONFIG_PINCTRL

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

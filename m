From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH STABLE v4.19.15] gpiolib: fix line event timestamps for
 nested irqs
Date: Wed, 16 Jan 2019 17:02:16 +0100
Message-ID: <20190116160216.GA4594@kroah.com>
References: <20190116153557.13720-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116153557.13720-1-brgl@bgdev.pl>
Sender: stable-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 16, 2019 at 04:35:57PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Nested interrupts run inside the calling thread's context and the top
> half handler is never called which means that we never read the
> timestamp.
> 
> This issue came up when trying to read line events from a gpiochip
> using regmap_irq_chip for interrupts.
> 
> Fix it by reading the timestamp from the irq thread function if it's
> still 0 by the time the second handler is called.
> 
> Fixes: d58f2bf261fd ("gpio: Timestamp events in hardirq handler")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Hi Sasha,
> 
> this is a backport for v4.19.y series. The original patch didn't apply
> due to a conflict.

What is the git commit id for this patch in Linus's tree?

thanks,

greg k-h

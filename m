From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Thu, 30 Nov 2017 10:46:35 +0100
Message-ID: <3058528.dbeyJzq7DI@ws-stein>
References: <20171130092655.25965-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:36319 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750923AbdK3Jqi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Nov 2017 04:46:38 -0500
In-Reply-To: <20171130092655.25965-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Felipe Balbi <felipe.balbi@linux.intel.com>

On Thursday, November 30, 2017, 10:26:55 AM CET Linus Walleij wrote:
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -587,6 +587,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>   * @events: KFIFO for the GPIO events
>   * @read_lock: mutex lock to protect reads from colliding with adding
>   * new events to the FIFO
> + * @timestamp: cache for the timestamp storing it between hardirq
> + * and IRQ thread, used to bring the timestamp close to the actual
> + * event
>   */
>  struct lineevent_state {
>  	struct gpio_device *gdev;
> @@ -597,6 +600,7 @@ struct lineevent_state {
>  	wait_queue_head_t wait;
>  	DECLARE_KFIFO(events, struct gpioevent_data, 16);
>  	struct mutex read_lock;
> +	s64 timestamp;
    ^^^
u64? ktime_get_real_ns() returns u64 and struct gpioevent_data
has __u64 for timestamp.

Best regards,
Alexander


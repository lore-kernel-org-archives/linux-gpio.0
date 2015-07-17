From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 2/2] tracing: gpio: add Kconfig option for
 enabling/disabling trace events
Date: Fri, 17 Jul 2015 14:36:06 -0400
Message-ID: <20150717143606.200d97d7@gandalf.local.home>
References: <20150713143459.09582cb9@gandalf.local.home>
	<1437068376-24617-1-git-send-email-tal.shorer@gmail.com>
	<1437068376-24617-3-git-send-email-tal.shorer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437068376-24617-3-git-send-email-tal.shorer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tal Shorer <tal.shorer@gmail.com>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 16 Jul 2015 20:39:36 +0300
Tal Shorer <tal.shorer@gmail.com> wrote:

> Add a new options to gpio Kconfig, CONFIG_GPIO_TRACING, that is used
> for enabling/disabling compilation of gpio function trace events.
> 

If I can get acks from the gpio maintainers, I can take this in my
tree, as it depends on code that modifies the core tracing facility.

-- Steve

> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> ---
>  drivers/gpio/Kconfig        | 7 +++++++
>  include/trace/events/gpio.h | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c1e2ca3..2829e8e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -88,6 +88,13 @@ config GPIO_SYSFS
>  config GPIO_GENERIC
>  	tristate
>  
> +config GPIO_TRACING
> +	bool "gpio tracing"
> +	depends on TRACING
> +	help
> +	  Enable tracing for gpio subsystem
> +
> +
>  # put drivers in the right section, in alphabetical order
>  
>  config GPIO_DA9052
> diff --git a/include/trace/events/gpio.h b/include/trace/events/gpio.h
> index 927a8ad..09af636 100644
> --- a/include/trace/events/gpio.h
> +++ b/include/trace/events/gpio.h
> @@ -1,6 +1,10 @@
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM gpio
>  
> +#ifndef CONFIG_GPIO_TRACING
> +#define NOTRACE
> +#endif
> +
>  #if !defined(_TRACE_GPIO_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_GPIO_H
>  

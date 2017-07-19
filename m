From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [RFC] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is disabled
Date: Wed, 19 Jul 2017 16:08:15 -0700
Message-ID: <20170719230815.GA38936@dtor-ws>
References: <1500503665-21278-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34357 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933480AbdGSXIS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2017 19:08:18 -0400
Received: by mail-pg0-f66.google.com with SMTP id v190so1143602pgv.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2017 16:08:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1500503665-21278-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, sergei.shtylyov@cogentembedded.com, andrew@lunn.ch, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

On Wed, Jul 19, 2017 at 07:34:25PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> gpiod_get_optional() returns NULL when GPIOLIB is disabled since
> commit 22c403676dbbb7c6 ("gpio: return NULL from gpiod_get_optional when
> GPIOLIB is disabled").
> 
> However, many gpiod functions still have WARN_ON(1) in their
> GPIOLIB=n stubs, which causes warnings in drivers even if the
> GPIO descriptior is requested via gpiod_get_optional().
> 
> Remove the WARN_ON(1) so that drivers can silently work fine
> without kernel warnings when GPIOLIB is disabled. 

Hmm, I did not realize that GPIO API allowed calls with NULL desc and
they would be silently accepted and return 0... Not sure if that is the
best way for the subsystem to behave, but Linus is the boss ;)

Maybe check for NULL explicitly and keep warning if !NULL is passed?

> 
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  include/linux/gpio/consumer.h | 59 -------------------------------------------
>  1 file changed, 59 deletions(-)
> 
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 8f702fc..40c1be5 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -197,17 +197,11 @@ gpiod_get_array_optional(struct device *dev, const char *con_id,
>  static inline void gpiod_put(struct gpio_desc *desc)
>  {
>  	might_sleep();
> -
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  
>  static inline void gpiod_put_array(struct gpio_descs *descs)
>  {
>  	might_sleep();
> -
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  
>  static inline struct gpio_desc *__must_check
> @@ -254,150 +248,99 @@ devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
>  {
>  	return NULL;
>  }
> -
>  static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
>  {
>  	might_sleep();
> -
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
> -
>  static inline void devm_gpiod_put_array(struct device *dev,
>  					struct gpio_descs *descs)
>  {
>  	might_sleep();
> -
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
> -
> -
>  static inline int gpiod_get_direction(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -ENOSYS;
>  }
>  static inline int gpiod_direction_input(struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -ENOSYS;
>  }
>  static inline int gpiod_direction_output(struct gpio_desc *desc, int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -ENOSYS;
>  }
>  static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -ENOSYS;
>  }
>  
> -
>  static inline int gpiod_get_value(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  static inline void gpiod_set_value(struct gpio_desc *desc, int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline void gpiod_set_array_value(unsigned int array_size,
>  					 struct gpio_desc **desc_array,
>  					 int *value_array)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline void gpiod_set_raw_array_value(unsigned int array_size,
>  					     struct gpio_desc **desc_array,
>  					     int *value_array)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  
>  static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline void gpiod_set_array_value_cansleep(unsigned int array_size,
>  					    struct gpio_desc **desc_array,
>  					    int *value_array)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
>  						int value)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  static inline void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
>  						struct gpio_desc **desc_array,
>  						int *value_array)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  }
>  
>  static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -ENOSYS;
>  }
>  
>  static inline int gpiod_is_active_low(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  static inline int gpiod_cansleep(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return 0;
>  }
>  
>  static inline int gpiod_to_irq(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -EINVAL;
>  }
>  
> @@ -408,8 +351,6 @@ static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
>  
>  static inline int desc_to_gpio(const struct gpio_desc *desc)
>  {
> -	/* GPIO can never have been requested */
> -	WARN_ON(1);
>  	return -EINVAL;
>  }
>  
> -- 
> 2.7.4
> 

-- 
Dmitry

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/3] pinctrl: Allow configuration of pins from gpiolib
 based drivers
Date: Thu, 19 Jan 2017 14:11:22 +0200
Message-ID: <1484827882.2133.229.camel@linux.intel.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
         <20170119094820.83595-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119094820.83595-3-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2017-01-19 at 12:48 +0300, Mika Westerberg wrote:
> When a GPIO driver is backed by a pinctrl driver the GPIO driver
> sometimes needs to call the pinctrl driver to configure certain
> things,
> like whether the pin is used as input or output. In addition to this
> there are other configurations applicable to GPIOs such as setting
> debounce time of the GPIO.
> 
> To support this we introduce a new function pinctrl_gpio_set_config()
> that can be used by gpiolib based driver to pass configuration
> requests
> to the backing pinctrl driver.


> +	mutex_lock(&pctldev->mutex);
> +	pin = gpio_to_pin(range, gpio);
> +	ret = pinconf_set_config(pctldev, pin, configs,
> ARRAY_SIZE(configs));
> +	mutex_unlock(&pctldev->mutex);

Does gpio_to_pin() require to be under lock?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

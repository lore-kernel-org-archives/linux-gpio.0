From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/3] pinctrl: Widen the generic pinconf argument from 16
 to 24 bits
Date: Thu, 19 Jan 2017 14:04:59 +0200
Message-ID: <1484827499.2133.228.camel@linux.intel.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
         <20170119094820.83595-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119094820.83595-2-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2017-01-19 at 12:48 +0300, Mika Westerberg wrote:
> The current pinconf packed format allows only 16-bit argument limiting
> the maximum value 65535. For most types this is enough. However,
> debounce time can be in range of hundreths of milliseconds in case of
> mechanical switches so we cannot represent the worst case using the
> current format.
> 


>  static inline enum pin_config_param pinconf_to_config_param(unsigned
> long config)
>  {
> -	return (enum pin_config_param) (config & 0xffffUL);
> +	return (enum pin_config_param) (config & 0xffUL);
>  }
>  
> -static inline u16 pinconf_to_config_argument(unsigned long config)
> +static inline u32 pinconf_to_config_argument(unsigned long config)
>  {
> -	return (enum pin_config_param) ((config >> 16) & 0xffffUL);
> +	return (enum pin_config_param) ((config >> 8) & 0xffffffUL);

Looks like copy'n'paste error in the initial code, I mean casting should
go as (u16) -> (u32).

Perhaps, in case you submit new version, do the first patch with a fix
of this one. Then conversion would look more logical.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

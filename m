From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpiolib: append SFI helpers for GPIO API
Date: Thu, 17 Oct 2013 15:41:35 +0300
Message-ID: <1382013695.29062.141.camel@smile>
References: <1381979015-28980-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381979015-28980-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, sfi-devel@simplefirmware.org, linux-gpio@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2013-10-16 at 20:03 -0700, David Cohen wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> To support some (legacy) firmwares and platforms let's make life easier for
> their customers.
> 


> +int sfi_get_gpio_by_name(const char *name)
> +{
> +	struct sfi_gpio_table_entry *pentry = sfi_gpio_table;
> +	int i;
> +
> +	if (!pentry)
> +		return -1;

^^^^ It seems an old version.

New version was published while ago and even has an ACK from Linus:

http://www.spinics.net/lists/kernel/msg1545960.html


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

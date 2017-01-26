From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 15:43:41 +0200
Message-ID: <20170126134341.GI17297@lahna.fi.intel.com>
References: <20170126142020.7bfd1229@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:65066 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751733AbdAZNnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 08:43:45 -0500
Content-Disposition: inline
In-Reply-To: <20170126142020.7bfd1229@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>

On Thu, Jan 26, 2017 at 02:20:20PM +0100, Jean Delvare wrote:
> Hi Cristina,
> 
> In this commit:
> 
> commit 658b476c742fe379e7020309fd590a27b457a4c1
> Date:   Fri Apr 1 14:00:07 2016 +0300
> 
>     pinctrl: baytrail: Add debounce configuration
> 
> you added support for getting and setting debounce configuration for
> the Baytrail pins. Now gcc complains about the following:
> 
>   CC [M]  drivers/pinctrl/intel/pinctrl-baytrail.o
> drivers/pinctrl/intel/pinctrl-baytrail.c: In function ‘byt_pin_config_set’:
> drivers/pinctrl/intel/pinctrl-baytrail.c:1181:17: warning: variable ‘debounce’ set but not used [-Wunused-but-set-variable]
>   u32 conf, val, debounce;
>                  ^
> 
> I looked at the code, and it indeed looks wrong. You are reading the
> BYT_DEBOUNCE_REG register, clearing the debounce time bits from it, and
> then writing the debounce time bits to the *BYT_CONF0_REG* register.
> This is certainly corrupting the chip configuration, as the
> configuration register bits 2-0 have a completely different meaning
> (mux configuration.)

Yes, you are right.

This is fixed by following commit from Andy:

https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=fixes&id=04ff5a095d662e0879f0eb04b9247e092210aeff

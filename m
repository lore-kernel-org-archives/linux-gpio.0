From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] pinctrl / gpio: Introduce .set_config() callback
 for GPIO chips
Date: Thu, 19 Jan 2017 14:17:01 +0200
Message-ID: <1484828221.2133.231.camel@linux.intel.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
         <20170119094820.83595-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:43991 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752402AbdASMSf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Jan 2017 07:18:35 -0500
In-Reply-To: <20170119094820.83595-4-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2017-01-19 at 12:48 +0300, Mika Westerberg wrote:
> Currently we already have two pin configuration related callbacks
> available for GPIO chips .set_single_ended() and .set_debounce(). In
> future we expect to have even more, which does not scale well if we
> need
> to add yet another callback to the GPIO chip structure for each
> possible
> configuration parameter.
> 
> Better solution is to reuse what we already have available in the
> generic pinconf.
> 
> To support this, we introduce a new .set_config() callback for GPIO
> chips. The callback takes a single packed pin configuration value as
> parameter. This can then be extended easily beyond what is currently
> supported by just adding new types to the generic pinconf enum.
> 
> We then convert the existing drivers over .set_config() and finally
> remove the .set_single_ended() and .set_debounce() callbacks.
> 
 
> +#ifdef CONFIG_GENERIC_PINCONF
> +
> +#ifdef CONFIG_DEBUG_FS
> +#define PCONFDUMP(a, b, c, d) { .param = a, .display = b, .format =
> c, \
> +				.has_arg = d }

I understand you moved existing code, though 3 liner here would look
better.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

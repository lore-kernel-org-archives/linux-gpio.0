From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [RFC v1 1/9] gpio: davinci: get rid of DAVINCI_N_GPIO
Date: Fri, 29 Nov 2013 10:48:11 -0500
Message-ID: <5298B73B.8060605@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com> <1385494815-15740-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:41742 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751899Ab3K2PsO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 10:48:14 -0500
In-Reply-To: <1385494815-15740-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, nsekhar@ti.com, prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com

On Tuesday 26 November 2013 02:40 PM, Grygorii Strashko wrote:
> Since Davinci GPIO driver is moved to support gpiolib it has to use
> ARCH_NR_GPIOS (can be configured using CONFIG_ARCH_NR_GPIO Kconfig
> option) configuration instead of any mach/platform specific options.
> 
> Hence, replace private DAVINCI_N_GPIO with common ARCH_NR_GPIOS. This is
> safe because default value for ARCH_NR_GPIOS=256 and maximum number of
> supported GPIOs for Davinci is DAVINCI_N_GPIO=144.
> 
> More over, this is one of steps to re-use Davinci GPIO driver by other
> mach/platform.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
Looks like you just combined the two earlier patches you have posted.
Ack applies here as well.

regards,
Santosh


From: Greg Kroah-Hartman <greg@kroah.com>
Subject: Re: [PATCH][RESEND] serial_mctrl_gpio: use gpiod_set_array function
Date: Tue, 25 Nov 2014 09:40:30 -0800
Message-ID: <20141125174030.GA31905@kroah.com>
References: <8534699.OPo8bzguux@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47929 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363AbaKYR4A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Nov 2014 12:56:00 -0500
Content-Disposition: inline
In-Reply-To: <8534699.OPo8bzguux@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Mon, Nov 17, 2014 at 06:31:30PM +0100, Rojhalat Ibrahim wrote:
> Make the serial_mctrl_gpio driver the first user of the new gpiod_set_array
> function, which is now available in the linux-gpio devel tree.
> All modem control output signals are now set simultaneously.
> 
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Resend: Add Greg Kroah-Hartman and the linux-serial list to the recipients
>         in hopes of getting an ACK.
> 


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


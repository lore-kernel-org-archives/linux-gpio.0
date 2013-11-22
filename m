From: Liu Gang <Gang.Liu@freescale.com>
Subject: Re: [PATCH] powerpc/gpio: Fix the wrong GPIO input data on
 MPC8572/MPC8536
Date: Fri, 22 Nov 2013 12:47:36 +0800
Message-ID: <1385095656.16677.39.camel@linux>
References: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
	 <1384901494.1403.383.camel@snotra.buserror.net>
	 <1384916079.16677.26.camel@linux>
	 <1384993966.1403.466.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]:5268
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751923Ab3KVEsP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 23:48:15 -0500
In-Reply-To: <1384993966.1403.466.camel@snotra.buserror.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, b07421@freescale.com, r61911@freescale.com

On Wed, 2013-11-20 at 18:32 -0600, Scott Wood wrote:
> For userspace value setting, it looks like gpiolib blocks the write if
> the pin if FLAG_IS_OUT is set.  This suggests that this is an error
> condition for other uses as well.  Though, I notice that
> mpc8xxx_gpio_dir_out() calls gpio_set() before actually changing the
> direction.  So it may be useful to avoid races where the wrong value is
> output briefly after the direction is changed (especially in open drain
> situations, where the signal could have a meaningful default even before
> we begin outputting).  But that raises the question of how you'd do that
> from userspace, and it also renders the to-be-output value as write-only
> data (until the direction is actually changed), since a readback would
> get the input value instead.
> 
> > So maybe it's better to eliminate the effects of the ->data to the
> > input pins when reading the status, regardless of the possible changes
> > of the pins and the data.
> > Do you think so?
> 
> Perhaps, but that doesn't require you to modify ->data in the get()
> function.
> 
> -Scott
> 
I think you considered about this more comprehensive.
I'll update the code without the modification of ->data in the get()
function, and also with the comments from Anatolij.

Best Regards,
Liu Gang



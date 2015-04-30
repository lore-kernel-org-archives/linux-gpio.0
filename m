From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 03/23] gpio: sysfs: drop redundant lock-as-irq
Date: Thu, 30 Apr 2015 11:07:58 +0200
Message-ID: <20150430090758.GI32318@localhost>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
 <1429630951-27082-4-git-send-email-johan@kernel.org>
 <CACRpkdZjh1vwwogf4fu5jpyf-d4A2c4UnFtK-RxanUtmo0_-Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35418 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934AbbD3JHz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2015 05:07:55 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZjh1vwwogf4fu5jpyf-d4A2c4UnFtK-RxanUtmo0_-Gw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Apr 29, 2015 at 11:48:57PM +0200, Linus Walleij wrote:
> On Tue, Apr 21, 2015 at 5:42 PM, Johan Hovold <johan@kernel.org> wrote:
> 
> > Drop redundant lock-as-irq in gpio_setup_irq, which has already been
> > handled when requesting and releasing the irq (i.e. in the irq chip
> > irq_request_resources and irq_release_resources callbacks).
> 
> Well we would hope they all do that. And I hope for the vast majority
> that is true, but there is a TODO to go over all gpiochip drivers
> (some which are elsewhere in the kernel than drivers/gpio) and
> make sure they actually do so.
> 
> Right now it's a bit arbitrary if so happens, and in not marked by
> the driver as IRQ then this kicks in and provides an additional
> protection.
> 
> But maybe that's overzealous, what do people say?

No, you're right. The drivers that fail to do this needs to be fixed,
but the "redundant" lock-as-irq in the sysfs interface should not be
removed before that.

I'll respin the series and add it back with a comment explaining why
gpiochip_lock_as_irq is currently called twice.

Thanks,
Johan

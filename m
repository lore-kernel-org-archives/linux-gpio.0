From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Fri, 27 Nov 2015 09:37:21 -0800
Message-ID: <20151127173721.GC27040@dtor-ws>
References: <20151111194530.GA26559@dtor-ws>
 <CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36317 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684AbbK0RhY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2015 12:37:24 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 17, 2015 at 02:43:14PM +0100, Linus Walleij wrote:
> On Wed, Nov 11, 2015 at 8:45 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > We should not fall back to the legacy unnamed gpio lookup style if the
> > driver requests gpios with different names, because we'll give out the same
> > gpio twice. Let's keep track of the names that were used for the device and
> > only do the fallback for the first name used.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > v1: incorporated changes suggested by Mika Westerberg in response to the
> > draft patch I posted in Goodix thread.
> >
> > v2: moved acpi_can_fallback_to_crs body to drivers/gpio/gpiolib-acpi.c
> > and provided stub for !CONFIG_ACPI case to fix build error if ACPI is
> > disabled.
> 
> Patch applied with Mika's ACK.
> 
> Had to fuzz a bit to make it apply, hope nothing breaks.

Hmm, I'd like to get this patch into my tree as well to apply Irina's
goodix pieces on top to make sure they do not break. Would it be OK for
me to just apply the patch and hope git will sort it out when we merge
into next/mainline, you maybe you could prepare a 4.3-based branch with
the patch for me to pull?

Thanks!

-- 
Dmitry

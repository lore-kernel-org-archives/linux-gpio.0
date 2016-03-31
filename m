From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpio / ACPI: ignore GpioInt() GPIOs when requesting
 GPIO_OUT_*
Date: Thu, 31 Mar 2016 10:33:34 -0700
Message-ID: <20160331173334.GA39098@dtor-ws>
References: <20160324175025.GA4149@dtor-ws>
 <CACRpkdYxpP=tKhuWyCQT4FdkEeruPS-0DWbJmXmPMFkVye=9tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:35625 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757383AbcCaRdh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 13:33:37 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYxpP=tKhuWyCQT4FdkEeruPS-0DWbJmXmPMFkVye=9tA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 31, 2016 at 11:49:13AM +0200, Linus Walleij wrote:
> On Thu, Mar 24, 2016 at 6:50 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > From: Dmitry Torokhov <dtor@chromium.org>
> >
> > When firmware does not use _DSD properties that allow properly name GPIO
> > resources, the kernel falls back on parsing _CRS resources, and will
> > return entries described as GpioInt() as general purpose GPIOs even
> > though they are meant to be used simply as interrupt sources for the
> > device:
> 
> Patch applied for fixes. Is this a regression so that I should
> also tag it for stable?

No, I think it is OK to keep it in 4.6+.

Thanks.

-- 
Dmitry

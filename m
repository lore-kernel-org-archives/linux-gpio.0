From: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Subject: Re: [PATCH] gpio: create an API to detect open drain/source on lines
Date: Thu, 18 Feb 2016 21:20:40 +0000
Message-ID: <20160218212032.GA3699@vian>
References: <1455633979-30970-1-git-send-email-linus.walleij@linaro.org>
 <20160217002124.GA31158@vian>
 <CACRpkdYmhRrfMgdoxh7oV1p4swaRRZ+sGPM_AU6+KD_JL8R6NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37601 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbcBRVUq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 16:20:46 -0500
Received: by mail-wm0-f46.google.com with SMTP id g62so44367004wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 13:20:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYmhRrfMgdoxh7oV1p4swaRRZ+sGPM_AU6+KD_JL8R6NA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Feb 18, 2016 at 09:47:07PM +0100, Linus Walleij wrote:
> On Wed, Feb 17, 2016 at 1:21 AM, Nicolas Saenz Julienne
> <nicolassaenzj@gmail.com> wrote:
> > On Tue, Feb 16, 2016 at 03:46:19PM +0100, Linus Walleij wrote:
> >> My left hand merges code to privatize the descriptor handling
> >> while my right hand merges drivers that poke around and
> >> disrespect with the same gpiolib internals.
> >>
> >> So let's expose the proper APIs for drivers to ask the gpiolib
> >> core if a line is marked as open drain or open source and
> >> get some order around things so this driver compiles again.
> >
> > Thanks, looks way better now, I'd suggest to remove the "gpiolib.h"
> > include since it's not needed anymore. I can do it's on a separate patch
> > on top of this one if you prefer :)

Sorry I wasn't more clear. What I meant to say it's that we can now remove the
#include "gpiolib.h" from gpio-tps65218 driver since the line config query
functions are included in "gpio/driver.h".

--
Nicolas

From: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Subject: Re: [PATCH] gpio: create an API to detect open drain/source on lines
Date: Wed, 17 Feb 2016 00:21:24 +0000
Message-ID: <20160217002124.GA31158@vian>
References: <1455633979-30970-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35173 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964844AbcBQAV2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 19:21:28 -0500
Received: by mail-wm0-f52.google.com with SMTP id c200so188108184wme.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 16:21:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455633979-30970-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Feb 16, 2016 at 03:46:19PM +0100, Linus Walleij wrote:
> My left hand merges code to privatize the descriptor handling
> while my right hand merges drivers that poke around and
> disrespect with the same gpiolib internals.
>
> So let's expose the proper APIs for drivers to ask the gpiolib
> core if a line is marked as open drain or open source and
> get some order around things so this driver compiles again.

Thanks, looks way better now, I'd suggest to remove the "gpiolib.h"
include since it's not needed anymore. I can do it's on a separate patch
on top of this one if you prefer :)

Acked-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

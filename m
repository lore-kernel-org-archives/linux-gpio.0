From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] intel_mid: switch to use SFI GPIO API
Date: Tue, 26 Nov 2013 10:38:53 +0100
Message-ID: <CACRpkdawieDmHhOj4p4KVgE=FH5LaxWG94U0btbPgX_5ue-Lyg@mail.gmail.com>
References: <1384957896-3477-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1384957896-3477-4-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33094 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753357Ab3KZJiz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 04:38:55 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so5530143obb.31
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 01:38:53 -0800 (PST)
In-Reply-To: <1384957896-3477-4-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Cohen <david.a.cohen@intel.com>, "linux-gpio @ vger . kernel . org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>

On Wed, Nov 20, 2013 at 3:31 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of custom implementation of the SFI GPIO API let's use one provided by
> gpiolib.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

So is it possible to move this to just do gpiod_get() from the drivers
and abstract away SFI altogether as indicated by Mika?

I'd love that, if possible.

Yours,
Linus Walleij

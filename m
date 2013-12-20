From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Fri, 20 Dec 2013 10:02:41 +0100
Message-ID: <CACRpkdZjWg6DU75NuAW9QTFBcfXW8e9EuksL1cRCG-v-LHh78w@mail.gmail.com>
References: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:53637 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754647Ab3LTJCm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:02:42 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so2395385obc.20
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:02:42 -0800 (PST)
In-Reply-To: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Len Brown <lenb@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>

On Tue, Dec 10, 2013 at 2:21 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Here is a sixth [1] version of the SFI GPIO helpers. This series contains SFI
> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
>
> It has been tested on Medfield device on top of recent linux-next-20131210 +
> Mika's ACPI gpio patches [2].

This is still stalled due to no response from the SFI maintainer, Len
can you please look at this series, if you ACK them I'm happy to take
the whole series through the GPIO tree.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] gpio: intel-mid: Remove potentially harmful code
Date: Mon, 11 Jul 2016 10:54:41 +0200
Message-ID: <CACRpkdYqTaJ3TZYCbZfEBfXnKf_Cu5L++Mbp=WVUcWBjj0LKFA@mail.gmail.com>
References: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36861 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757686AbcGKIyn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 04:54:43 -0400
Received: by mail-oi0-f53.google.com with SMTP id n8so36531546oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 01:54:43 -0700 (PDT)
In-Reply-To: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, stable <stable@vger.kernel.org>, #@black.fi.intel.com, v3.13+@black.fi.intel.com

On Wed, Jul 6, 2016 at 11:50 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The commit d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
> doesn't look at all as a proper support for Intel Merrifield and I dare to say
> that it distorts the behaviour of the hardware.
>
> The register map is different on Intel Merrifield, i.e. only 6 out of 8
> register have the same purpose but none of them has same location in the
> address space. The current case potentially harmful to existing hardware since
> it's poking registers on wrong offsets and may set some pin to be GPIO output
> when connected hardware doesn't expect such.
>
> Besides the above GPIO and pinctrl on Intel Merrifield have been located in
> different IP blocks. The functionality has been extended as well, i.e. added
> support of level interrupts, special registers for wake capable sources and
> thus, in my opinion, requires a completele separate driver.
>
> If someone wondering the existing gpio-intel-mid.c would be converted to actual
> pinctrl (which by the fact it is now), though I wouldn't be a volunteer to do
> that.
>
> Fixes: d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
> Cc: stable@vger.kernel.org # v3.13+
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's review tag.

Yours,
Linus Walleij

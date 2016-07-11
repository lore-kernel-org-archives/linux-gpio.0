From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to support Merrifield
Date: Mon, 11 Jul 2016 11:12:37 +0200
Message-ID: <CACRpkdYoq_i3cks80wrMLxSGHV77a25r11D5r=RAAAePNEmd2Q@mail.gmail.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <89AE17FDD09DD746ACFB52B7F3E0AF788895FA89@ORSMSX115.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36039 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbcGKJMj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 05:12:39 -0400
Received: by mail-oi0-f45.google.com with SMTP id n8so37063729oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 02:12:39 -0700 (PDT)
In-Reply-To: <89AE17FDD09DD746ACFB52B7F3E0AF788895FA89@ORSMSX115.amr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wood, Brian J" <brian.j.wood@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>, "Koskinen, Ilkka" <ilkka.koskinen@intel.com>

On Fri, Jul 8, 2016 at 6:54 PM, Wood, Brian J <brian.j.wood@intel.com> wrote:

> +Ilkka (he's investigating adding in pinctrl code for getting/setting the GPIO pins on BXT platform)
>
> Ilkka, not being too familiar with pinctrl would there need to be more added to these functions
> mrfld_gpio_get()/mrfld_gpio_set() for the mux'ing needs we were discussing for Brillo?

I don't know if that was intended to be internal but as it happens I
keep an eye out for
Brillo. I have been including people from Google in the review of the
new chardev
ABI that will be merged for v4.8.

If special userspace concerns are needed for Brillo or any other IoT business, I
would be happy if we could do it here on the GPIO list, so we all have a good
picture of what IoT/Brillo/makespaces need for doing their GPIO business
from userspace.

I'd be especially scared if userspace need to do muxing beyond "set as GPIO"
but whatever comes up, we need some structure to it.

> Andy, the code looks good. +1 from me :-)

I'm recording that as an Acked-by in the changelog.

Yours,
Linus Walleij

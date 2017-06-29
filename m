From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset calculation
Date: Thu, 29 Jun 2017 14:17:01 +0200
Message-ID: <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34226 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752803AbdF2MRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 08:17:09 -0400
Received: by mail-it0-f48.google.com with SMTP id v202so8549269itb.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 05:17:08 -0700 (PDT)
In-Reply-To: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Graeme Gregory <graeme.gregory@linaro.org>

On Mon, Jun 26, 2017 at 7:37 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> According to Whiskey Cove PMIC GPIO controller specification, for GPIO
> pins 0-12, GPIO input and output register control address range from,
>
> 0x4e44-0x4e50 for GPIO outputs control register
>
> 0x4e51-0x4e5d for GPIO input control register
>
> But, currently when calculating the GPIO register offsets in to_reg()
> function, all GPIO pins in the same bank uses the same GPIO control
> register address. This logic is incorrect. This patch fixes this
> issue.
>
> This patch also adds support to selectively skip register modification
> for virtual GPIOs.
>
> In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
> These virtual GPIOs are used by the ACPI code as means to access various
> non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
> manipulate the physical GPIO pin register. A similar patch has been
> merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
> find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
> Do not write regular gpio registers for virtual GPIOs")

So where can I get a handle on the people inside Intel who are obviously
using ACPI GPIO class for shoehorning what we in the linux kernel call
syscon or register bit misc access into the GPIO ACPI container just
because they feel it is convenient?

They need to invent a NEW ACPI four-character thing and call that
"misc register bit" (_MRB?) or whatever and have it bind to syscon.
This is not working.

It feels like I am starting to maintain Intel's swiss army knife for misc
register manipulation, and that should not be done by "virtual GPIO"
because just look at it:

General-purpose input/output - yeah that sounds like something
going in/out of the system right? And something that is used by electronics
outside the provider. Like a LED. Or a key.

"Virtual GPIO" - those are not input/outputs at all in most cases,
because they are internally routed, and they are not general purpose
at all because mostly they are for a specific purpose. Neither are they
virtual because the signals are very real.

Calling something "virtual GPIO" is just one big confusion for the brain.

Looking at Rusty Russell's API design manifesto:
http://sweng.the-davies.net/Home/rustys-api-design-manifesto
this is just screwing things up.

> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Reported-by: Jukka Laitinen <jukka.laitinen@intel.com>

I have applied the patch because I think you know this better than
me, just including Mika and Andy as a side note. The patch is fine
because it makes the system run despite the above mentioned
violation of ACPI which is not your fault.

Would you mind signing yourself up as maintainer in the MAINTAINERS
file for this driver?

Yours,
Linus Walleij

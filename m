From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC] gpio: add set_active_low() function to gpio_chip
Date: Thu, 19 Mar 2015 11:07:16 +0900
Message-ID: <CAAVeFuKT1OPhM8LMQ5z9WejZEeYgqSzwcmCOw6V7E7Y0c=8btA@mail.gmail.com>
References: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:36572 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbbCSCHh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 22:07:37 -0400
In-Reply-To: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 19, 2015 at 5:16 AM, David Cohen
<david.a.cohen@linux.intel.com> wrote:
> Some gpio controllers are capable of programming its pins' active-low
> state. Let's add this new gpio_chip function for such cases and use it
> in gpiolib.
>
> When set_active_low() is implemented, we no longer need to do soft flips
> on values from non-raw get functions.
>
> Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
> ---
>
> Hi,
>
> This is a RFC, not meant for integration (yet).
>
> We have a GPIO controller that is capable of inverting the GPIO logical value
> on hardware using a register (and GPIO voltage level if configured for output):
> - If GPIO pin is configured for input, only the logical value is affected: the
>   GPIO level stays the same but the read values are inverted (it affects even
>   interrupt event triggers).
> - If GPIO pin is configured for output, the GPIO level is also inverted.
>
> Is it acceptable to expose this functionality via new gpio chip operation
> set_active_low()?

At first I thought "why not", but then I couldn't help but ask "why?"

Handling the active low state in software is basically free and
requires no extra support. What is the benefit of handling it in
hardware that would counterbalance the complexity this adds to the
GPIO framework?

Also, wouldn't that require us to reverse this active-low logic in the
*_raw functions for them to work as expected?

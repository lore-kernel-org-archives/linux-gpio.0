From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: of: allow of_gpiochip_find_and_xlate to find
 more than one chip per node
Date: Wed, 18 Feb 2015 18:15:10 +0100
Message-ID: <CACRpkdZ1Enp5vKJk=9VwDrOaM+n_mAoX_jSBcLBbZEQpsyYGeA@mail.gmail.com>
References: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Holmberg <hans.holmberg@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, cochran@lexmark.com, Daniel Mack <zonque@gmail.com>, tylerwhall@gmail.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 10, 2015 at 9:48 AM, Hans Holmberg <hans.holmberg@intel.com> wrote:

> The change:
>
> 7b8792bbdffdff3abda704f89c6a45ea97afdc62
> gpiolib: of: Correct error handling in of_get_named_gpiod_flags
>
> assumed that only one gpio-chip is registred per of-node.
> Some drivers register more than one chip per of-node, so
> adjust the matching function of_gpiochip_find_and_xlate to
> not stop looking for chips if a node-match is found and
> the translation fails.
>
> Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>

OK this patch applied for stable and pushed for testing
in -next.

Yours,
Linus Walleij

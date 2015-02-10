From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: of: allow of_gpiochip_find_and_xlate to find
 more than one chip per node
Date: Tue, 10 Feb 2015 17:50:22 +0900
Message-ID: <CAAVeFu+F1oy4AZqWmMkGqiVxz5YF1y-qMxyHObWjjVXp8PuGcg@mail.gmail.com>
References: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Holmberg <hans.holmberg@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Howard Cochran <cochran@lexmark.com>, Daniel Mack <zonque@gmail.com>, Tyler Hall <tylerwhall@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 10, 2015 at 5:48 PM, Hans Holmberg <hans.holmberg@intel.com> wrote:
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

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!

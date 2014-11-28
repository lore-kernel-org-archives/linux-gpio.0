From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: remove gpio_descs global array
Date: Fri, 28 Nov 2014 11:29:11 +0100
Message-ID: <CACRpkdZV-nQPXDnxiBgPTZTpyQ2eiKNL8qJY9jRq=A5foc-xmw@mail.gmail.com>
References: <1416383487-15993-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416383487-15993-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 19, 2014 at 8:51 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Replace the ARCH_NR_GPIOS-sized static array of GPIO descriptors by
> dynamically-allocated arrays for each GPIO chip.
>
> This change makes gpio_to_desc() perform in O(n) (where n is the number
> of GPIO chips registered) instead of O(1), however since n is rarely
> bigger than 1 or 2 no noticeable performance issue is expected.
> Besides this provides more incentive for GPIO consumers to move to the
> gpiod interface. One could use a O(log(n)) structure to link the GPIO
> chips together, but considering the low limit of n the hypothetical
> performance benefit is probably not worth the added complexity.
>
> This patch uses kcalloc() in gpiochip_add(), which removes the ability
> to add a chip before kcalloc() can operate. I am not aware of such
> cases, but if someone bisects up to this patch then I will be proven
> wrong...
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

OK patch applied. Let's see if the world explodes.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-idio-16: Use lowercase symbol names for const variables
Date: Tue, 17 Nov 2015 12:04:11 +0100
Message-ID: <CACRpkdbPtkxEUBxevE6vtYX2+fz+e3bh6Cq2fgFGVfpiAxzQ9Q@mail.gmail.com>
References: <20151104123008.GA15302@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151104123008.GA15302@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2015 at 1:30 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> To prevent confusion and to match existing coding style used in other
> gpio drivers symbol names within the 104-idio-16 gpio driver should be
> lowercase.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

This patch doesn not apply on top of the IRQ support I just
merged, so please rebase it and resend, include Alex' review tag.

Yours,
Linus Walleij

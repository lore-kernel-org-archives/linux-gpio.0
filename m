From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tps65912: fix wrong container_of arguments
Date: Fri, 20 Feb 2015 10:42:50 +0100
Message-ID: <CACRpkdYwZvhBVj82ZB5YD-9pOMaY8ri=ynROL0La-Qe6yYu3qw@mail.gmail.com>
References: <1424310745-28101-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424310745-28101-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 19, 2015 at 2:52 AM, Nicolas Saenz Julienne
<nicolassaenzj@gmail.com> wrote:

> The gpio_chip operations receive a pointer the gpio_chip struct which is
> contained in the driver's private struct, yet the container_of call in those
> functions point to the mfd struct defined in include/linux/mfd/tps65912.h.
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

Wut? Has this driver ever worked??

Patch applied and tagged for stable, thanks a lot.

Yours,
Linus Walleij

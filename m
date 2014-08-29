From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: change gpiochip_request_own_desc() prototype
Date: Fri, 29 Aug 2014 08:57:57 +0200
Message-ID: <CACRpkdb0uZ52E6ezTZ7d_HSZ96Ykf87xZ=kx2V2jF64yGvJazw@mail.gmail.com>
References: <1408467969-21226-1-git-send-email-acourbot@nvidia.com>
	<1408467969-21226-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408467969-21226-3-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 19, 2014 at 7:06 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The current prototype of gpiochip_request_own_desc() requires to obtain
> a pointer to a descriptor. This is in contradiction to all other GPIO
> request schemes, and imposes an extra step of obtaining a descriptor to
> drivers. Most drivers actually cannot even perform that step since the
> function that does it (gpichip_get_desc()) is gpiolib-private.
>
> Change gpiochip_request_own_desc() to return a descriptor from a
> (chip, hwnum) tuple and update users of this function (currently
> gpiolib-acpi only).
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij

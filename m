From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: mockup: use irq_sim
Date: Wed, 2 Aug 2017 13:34:50 +0200
Message-ID: <CACRpkdaPxNHRu9vtB-h1v39WDZYscLWxDUeS8d+6mTQEZSjv=w@mail.gmail.com>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl> <1500466814-32679-4-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500466814-32679-4-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2017 at 2:20 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Shrink the driver by removing the code dealing with dummy interrupts
> and replacing it with calls to the irq_sim API.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

You can definately merge this along with the simulator into the IRQchip
subsystem.

Yours,
Linus Walleij

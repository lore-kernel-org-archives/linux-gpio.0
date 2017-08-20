From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] gpio: mockup: use irq_sim
Date: Mon, 21 Aug 2017 00:13:23 +0200
Message-ID: <CACRpkdbjmdHKQkSoTX54DKfB6zQmvTWkKp4-bV-RAmP9OYz0kg@mail.gmail.com>
References: <20170814112056.3751-1-brgl@bgdev.pl> <20170814112056.3751-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170814112056.3751-4-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2017 at 1:20 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Shrink the driver by removing the code dealing with dummy interrupts
> and replacing it with calls to the irq_sim API.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I applied this to the GPIO tree after pulling the infrastructure
from Thomas branch.

Yours,
Linus Walleij

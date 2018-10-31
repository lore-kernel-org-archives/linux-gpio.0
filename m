From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: Move irq_chip definition inside struct pl061
Date: Wed, 31 Oct 2018 11:33:24 +0100
Message-ID: <CACRpkdZxqtV2dk_CoDtwx9_iCy_hSt8E+HjDGu6WcBEBxc8ueA@mail.gmail.com>
References: <20181024172915.15544-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024172915.15544-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 24, 2018 at 7:29 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Keeping the irq_chip definition static will make it shared with multiple
> giochips in the system. This practice is considered to be bad and now we
> will get the below warning from gpiolib core:
>
> "detected irqchip that is shared with multiple gpiochips: please fix the
> driver."
>
> Hence, move the irq_chip definition from static to `struct pl061` for
> using a unique irq_chip for each gpiochip.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied. Much better like this!

Yours,
Linus Walleij

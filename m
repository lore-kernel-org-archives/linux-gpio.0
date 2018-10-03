From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mockup: use device properties instead of platform_data
Date: Wed, 3 Oct 2018 09:54:36 +0200
Message-ID: <CACRpkdb0755w1cUQgfA=_Gf_oKSO=8+u9a8ni7L=0+HEppbkQA@mail.gmail.com>
References: <20180925112946.30629-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925112946.30629-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, vincent.whitchurch@axis.com, Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 25, 2018 at 1:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Some users want to introduce device tree support to the mockup driver.
> Let's make it easier by switching to using generic device properties.
> The driver stays compatible with previous use cases and after this
> conversion there'll be no need to change the way probing of mockup
> GPIO chips works.
>
> Tested with libgpiod test suite.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1 -> v2:
> - dropped an unnecessary check when reading the base gpio number property

Patch applied.

Vincent, could you rebase your work on top of this
when/if you resend?

Yours,
Linus Walleij

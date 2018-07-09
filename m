From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] selftests: gpio: gpio-mockup-chardev GPIOHANDLE_REQUEST_OUTPUT
 fix
Date: Mon, 9 Jul 2018 16:08:57 +0200
Message-ID: <CACRpkdZny9ixvz8=dVXfLG04_5pSoHYJa01qeB+gXqpkPCoGpA@mail.gmail.com>
References: <20180606174424.9630-1-rafael.tinoco@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606174424.9630-1-rafael.tinoco@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rafael David Tinoco <rafael.tinoco@linaro.org>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, shuah@kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kselftest@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 6, 2018 at 7:44 PM Rafael David Tinoco
<rafael.tinoco@linaro.org> wrote:

> Following logic from commit: 22f6592b23, GPIOHANDLE_REQUEST_OUTPUT
> should handle errors same way as GPIOHANDLE_REQUEST_INPUT does, or else
> the following error occurs:
>
> gpio-mockup-chardev: gpio<gpiochip1> line<0> test flag<0x2> value<0>: No
> such file or directory
>
> despite the real result of gpio_pin_test(), gpio_debugfs_get() and
> gpiotools_request_linehandle() functions.
>
> Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>

Patch applied. Sorry for forgetting about it.

Yours,
Linus Walleij

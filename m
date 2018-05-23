From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Clear irq trigger type on irq shutdown
Date: Wed, 23 May 2018 11:48:23 +0200
Message-ID: <CACRpkdZtE6tD2aM49DNovfEz5DYEjfmh0_=WxaAUY6jLz_tigg@mail.gmail.com>
References: <no_message-id@ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <no_message-id@ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Grigoryev Denis <grigoryev@fastwel.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 4, 2018 at 6:53 PM, Grigoryev Denis <grigoryev@fastwel.ru> wrote:

> The driver stores the result of irq_set_type() in the internal variables
> irq_trig_raise and irq_trig_fall, which later are used to determine
> the GPIOs that must be re-configured as input. These variables retain their
> value between gpiolib's  export / unexport, resulting in an incorrect
> state in some cases. The corresponding bits in the variables
> irq_trig_raise and irq_trig_fall should be cleared in irq_shutdown().
>
> Signed-off-by: Denis Grigoryev <grigoryev@fastwel.ru>

Patch applied with Andy's ACK.

If there are issues we can just revert it.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: poll InterruptEnable bits in enable_irq
Date: Mon, 26 Mar 2018 11:12:04 +0200
Message-ID: <CACRpkdaXzf=2nap2oqU0z_sTQ7XaFJGBnuk0UBE7FfNpT8mAFA@mail.gmail.com>
References: <20180312164530.215524-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312164530.215524-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: adurbin@chromium.org, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 12, 2018 at 5:45 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:

> In certain cases interrupt enablement will be delayed relative to when
> the InterruptEnable bits are written.  One example of this is when
> a GPIO's "debounce" logice is first enabled.  After enabling debounce,
> there is a 900 us "warm up" period during which InterruptEnable[0]
> (bit 11) will read as 0 despite being written 1.  During this time
> InterruptSts will not be updated, nor will interrupts be delivered, even
> if the GPIO's interrupt configuration has been written to the register.
>
> To work around this delay, poll the InterruptEnable bits after setting
> them to ensure interrupts have truly been enabled in hardware before
> returning from the irq_enable handler.
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

Patch applied.

I see the AMD people were not on CC so adding them here so they can
say if there is any problem with the approach.

Daniel: maybe you should consider listing yourself as comaintainer of this
driver?

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: 104-idi-48: Utilize devm_ functions in driver
 probe callback
Date: Thu, 26 Jan 2017 15:53:52 +0100
Message-ID: <CACRpkdbtGjTJ84mJ8TzUysAvkiJTtiH0ef5PoWn=JnsDqn5yXA@mail.gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com> <9867e73be56728749f123534b6ef144269cdac9c.1485287208.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9867e73be56728749f123534b6ef144269cdac9c.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 9:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The devm_ resource manager functions allow memory to be automatically
> released when a device is unbound. This patch takes advantage of the
> resource manager functions and replaces the gpiochip_add_data call and
> request_irq call with the devm_gpiochip_add_data call and
> devm_request_irq call respectively. In addition, the idi_48_remove
> function has been removed as no longer necessary due to the use of the
> relevant devm_ resource manager functions.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij

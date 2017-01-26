From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] gpio: gpio-mm: Utilize devm_ functions in driver
 probe callback
Date: Thu, 26 Jan 2017 15:55:53 +0100
Message-ID: <CACRpkdYAA9rD62kbYsWH3WW=7vKPksoNKzOfY6Q+LWaRHG8EdA@mail.gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com> <010e1799ddc02e5f41c2cebded47ed5478b3d7b6.1485287208.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <010e1799ddc02e5f41c2cebded47ed5478b3d7b6.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 9:01 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The devm_ resource manager functions allow memory to be automatically
> released when a device is unbound. This patch takes advantage of the
> resource manager functions and replaces the gpiochip_add_data call with
> the devm_gpiochip_add_data call. In addition, the gpiomm_remove function
> has been removed as no longer necessary due to the use of the relevant
> devm_ resource manager functions.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij

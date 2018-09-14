From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Free the last requested descriptor
Date: Fri, 14 Sep 2018 10:56:00 +0200
Message-ID: <CACRpkdYgC7Z79c3swKE=ZwEUfVTC+oijKOqo5HwVdXLOsTT8Mg@mail.gmail.com>
References: <20180913133704.15739-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913133704.15739-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 13, 2018 at 3:37 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> The current code only frees N-1 gpios if an error occurs during
> gpiod_set_transitory, gpiod_direction_output or gpiod_direction_input.
> Leading to gpios that cannot be used by userspace nor other drivers.
>
> Cc: Timur Tabi <timur@codeaurora.org>
> Cc: stable@vger.kernel.org
> Fixes: ab3dbcf78f60f46d ("gpioib: do not free unrequested descriptors)
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied for fixes with Jan's Reported-by tag.

Yours,
Linus Walleij

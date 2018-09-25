From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix gpio_direction_* for single direction GPIOs
Date: Tue, 25 Sep 2018 09:36:14 +0200
Message-ID: <CACRpkdbOUgvrC7GduKj2fOo6kn1HdtODvQ22NVnxw4pV6uivhA@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Timur Tabi <timur@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Ricardo,

thanks for the patch and sorry for taking time before responding.

On Fri, Sep 21, 2018 at 12:36 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> GPIOs with no programmable direction are not required to implement
> direction_output nor direction_input.
>
> If we try to set an output direction on an output-only GPIO or input
> direction on an input-only GPIO simply return 0.
>
> This allows this single direction GPIO to be used by libgpiod.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

It makes perfect sense, patch applied.

I'll go in and add some comments to the code so I understand it
right as well in the future.

Yours,
Linus Walleij

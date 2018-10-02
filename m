From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] gpiolib: Add init_valid_mask exported function
Date: Tue, 2 Oct 2018 11:14:20 +0200
Message-ID: <CACRpkdaFciX3xMw8ErRCwy79VVF6HDVkjAHi2EOtXXX_X1uVuw@mail.gmail.com>
References: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Timur Tabi <timur@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jhugo@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 2, 2018 at 10:27 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Add a function that allows initializing the valid_mask from
> gpiochip_add_data.
>
> This prevents race conditions during gpiochip initialization.
>
> If the function is not exported, then the old behaviour is respected,
> this is, set all gpios as valid.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

This is a very appetizing patch set.

I think patches 1 & 2 should be applied for sure even if
we don't apply patch 3, simply because it is way more
elegant.

Looking forward to see some test on Qualcomm's hardware
for this!

Yours,
Linus Walleij

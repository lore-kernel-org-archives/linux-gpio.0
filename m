From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/3] gpiolib: Add init_valid_mask exported function
Date: Wed, 10 Oct 2018 09:55:00 +0200
Message-ID: <CACRpkdZmfR9xBiym8MsQ-6y3bYzXO6xte=wySYDWHZ0YNt9R5Q@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: jhugo@codeaurora.org, timur@kernel.org, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 5, 2018 at 8:53 AM Ricardo Ribalda Delgado
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

Patch applied,

thanks a lot for your hard work on this!

Yours,
Linus Walleij

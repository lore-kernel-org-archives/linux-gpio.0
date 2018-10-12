From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Initialize gdev field before is used
Date: Fri, 12 Oct 2018 10:17:01 +0200
Message-ID: <CACRpkdbnNh6bzD_zp+Dc078c5Bi6JMTZRu9k5BZDYApS6kn54g@mail.gmail.com>
References: <20181012061136.11421-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012061136.11421-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>, jhugo@codeaurora.org, timur@kernel.org, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 12, 2018 at 8:11 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> gpio_hog depends on gdev field being initialized. This patch fixes an
> OOPs during initialization of TI's AM335x-ICEv2.
>
> Fixes: 3edfb7bd76bd1cba ("gpiolib: Show correct direction from the beginning")
> Tested-by: Vignesh R <vigneshr@ti.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied. Thanks to both of you for sorting this out!

Yours,
Linus Walleij

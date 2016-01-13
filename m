From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix chip order in gpio list
Date: Wed, 13 Jan 2016 11:11:02 +0100
Message-ID: <CACRpkdZb1wWy-19y9BX9T0xeKUfmC2ym-sd4JEoLqhqVeb6GFw@mail.gmail.com>
References: <1452203205-4660-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452203205-4660-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2016 at 10:46 PM, Julien Grossholtz
<julien.grossholtz@savoirfairelinux.com> wrote:

> In some situations the gpio_list order is not correct.
> As a consequence gpiochip_find_base returns the same
> base number twice. This happens when a first ship is added
> with manual base number, then other ships are added using
> automatic base number.
>
> To prevent this behaviour, this patch add the new ship after
> the last element of the gpio list.
>
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

Patch looks correct to me so applied.

Bamvor: please comment if you see some problems.

Yours,
Linus Walleij

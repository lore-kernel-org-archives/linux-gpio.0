From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: sysfs: fix memory leak in gpiod_sysfs_set_active_low
Date: Fri, 30 Jan 2015 10:30:03 +0100
Message-ID: <CACRpkdZoP_m+Jb+a7jOVDdUNzVO7x_MLVpycxxTqqoUSfimkRg@mail.gmail.com>
References: <1422270166-17525-1-git-send-email-johan@kernel.org>
	<1422270166-17525-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1422270166-17525-3-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 26, 2015 at 12:02 PM, Johan Hovold <johan@kernel.org> wrote:

> Fix memory leak in the gpio sysfs interface due to failure to drop
> reference to device returned by class_find_device when setting the
> gpio-line polarity.
>
> Fixes: 0769746183ca ("gpiolib: add support for changing value polarity
> in sysfs")
> Cc: stable <stable@vger.kernel.org>     # v2.6.33
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: sysfs: fix memory leak in gpiod_export_link
Date: Fri, 30 Jan 2015 10:29:08 +0100
Message-ID: <CACRpkdZwW+NRL0nVOZw96AFnxgU8BWipuJ7ugO41ju781MWA5Q@mail.gmail.com>
References: <1422270166-17525-1-git-send-email-johan@kernel.org>
	<1422270166-17525-2-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422270166-17525-2-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 26, 2015 at 12:02 PM, Johan Hovold <johan@kernel.org> wrote:

> Fix memory leak in the gpio sysfs interface due to failure to drop
> reference to device returned by class_find_device when creating a link.
>
> Fixes: a4177ee7f1a8 ("gpiolib: allow exported GPIO nodes to be named
> using sysfs links")
> Cc: stable <stable@vger.kernel.org>     # v2.6.32
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Let's see if I get it into v3.19 properly...

Yours,
Linus Walleij

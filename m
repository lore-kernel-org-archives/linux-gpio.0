From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] USB: serial: gpio line-name fix and FT232R CBUS gpio support
Date: Mon, 1 Oct 2018 11:43:55 +0200
Message-ID: <CACRpkdaG-S-6LfCKgxz4jdbD=kRO7q7k_8FAHqsSNBPdC07iDA@mail.gmail.com>
References: <20180930122703.7115-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930122703.7115-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, pados@pados.hu, Loic Poulain <loic.poulain@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Sep 30, 2018 at 2:29 PM Johan Hovold <johan@kernel.org> wrote:

> Turns out gpiolib still doesn't like having non-unique line names, so
> drop the line names from the recently added FTX cbus gpio
> implementation before adding support also for FT232R.

Oh.

> Linus, we finally got around to adding gpio support for FTDI devices;
> see commit
>
>         ba93cc7da896 ("USB: serial: ftdi_sio: implement GPIO support for FT-X devices")
>
> in my usb-next branch (and linux-next).

This is good news, I think it's a pretty neat way for people to get
a few inexpensive GPIOs from their serial adapters.

> The gpiolib warnings and inability to use the legacy sysfs interface
> prevents us from setting the line names however as someone is bound to
> plugin more than one of these devices at some point. I think we
> discussed this issue with the name space and hotpluggable devices a few
> years ago, but looks like this topic may need to be revisited.

Hm I guess the right long-term fix is to allow per-gpiochip unique
names rather than enforcing globally unique names.

The idea is to make it possible for userspace to look up a GPIO
on a chip by name, so if the gpiochip has a unique name,
and the line name is unique on that chip it should be good
enough.

Yours,
Linus Walleij

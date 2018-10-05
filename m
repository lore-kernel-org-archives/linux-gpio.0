From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] USB: serial: gpio line-name fix and FT232R CBUS gpio
 support
Date: Fri, 5 Oct 2018 15:40:14 +0200
Message-ID: <20181005134014.GH3774@localhost>
References: <20180930122703.7115-1-johan@kernel.org>
 <CACRpkdaG-S-6LfCKgxz4jdbD=kRO7q7k_8FAHqsSNBPdC07iDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaG-S-6LfCKgxz4jdbD=kRO7q7k_8FAHqsSNBPdC07iDA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, pados@pados.hu, Loic Poulain <loic.poulain@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 01, 2018 at 11:43:55AM +0200, Linus Walleij wrote:
> On Sun, Sep 30, 2018 at 2:29 PM Johan Hovold <johan@kernel.org> wrote:

> > Linus, we finally got around to adding gpio support for FTDI devices;
> > see commit
> >
> >         ba93cc7da896 ("USB: serial: ftdi_sio: implement GPIO support for FT-X devices")
> >
> > in my usb-next branch (and linux-next).
> 
> This is good news, I think it's a pretty neat way for people to get
> a few inexpensive GPIOs from their serial adapters.
> 
> > The gpiolib warnings and inability to use the legacy sysfs interface
> > prevents us from setting the line names however as someone is bound to
> > plugin more than one of these devices at some point. I think we
> > discussed this issue with the name space and hotpluggable devices a few
> > years ago, but looks like this topic may need to be revisited.
> 
> Hm I guess the right long-term fix is to allow per-gpiochip unique
> names rather than enforcing globally unique names.

Indeed.

> The idea is to make it possible for userspace to look up a GPIO
> on a chip by name, so if the gpiochip has a unique name,
> and the line name is unique on that chip it should be good
> enough.

I haven't really had time do dig into this again, but is this also an
issue with the chardev interface? I thought this was one of the things
you wanted to get right with the new interface, so hopefully that's
already taken care of.

If the flat name space is only an issue with the legacy interface we
might get away with simply not using the line names in sysfs when a new
chip flag is set (unless we can resue .can_sleep, but there seems to be
some i2c devices already using line names).

Thanks,
Johan

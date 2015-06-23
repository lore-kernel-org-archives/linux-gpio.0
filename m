From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Tue, 23 Jun 2015 11:22:19 +0200
Message-ID: <20150623092219.GA28202@localhost>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <20150622172610.GK483@localhost>
 <11dedbc454ab78f5e03497e2c5d8f5b3@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11dedbc454ab78f5e03497e2c5d8f5b3@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Johan Hovold <johan@kernel.org>, linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2015 at 10:11:35PM +0200, Stefan Agner wrote:
> On 2015-06-22 19:26, Johan Hovold wrote:

> > Instead, hang the gpio chip directly off the usb interface (not the
> > port), add a new config option, and keep the gpio implementation under
> > drivers/usb/serial (possibly in its own file ftdi_sio-gpio.c).
> 
> Agreed sounds like a good plan. Will try this approach in v2.
> 
> Except I don't think hanging it directly to the USB interface is the
> right thing to do.
> 
> Looking at the block diagram of FT232R or FT232H, the CBUS pins seem to
> be part of the UART/FIFO controller. And I think the dual UART FT2232D
> actually supports controlling the CBUS pins of the two UART controllers
> individually, at least the block diagram thereof suggests so.

The port is a Linux abstraction, and for FTDI we happen to have exactly
one port child device per USB interface. As I see it, the gpio
controller for the CBUS pins should be a sibling rather than a child
device to the port.

Note that we'd still have two gpio-controllers on FT2232D (one per USB
interface).

I'm aware that this requires some restructuring of the ftdi_sio-driver
(e.g. the device type and ftdi-interface number should be a feature of
the usb-serial rather than usb-serial-port device).

Thanks,
Johan

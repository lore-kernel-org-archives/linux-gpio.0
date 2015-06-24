From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Wed, 24 Jun 2015 09:56:48 +0200
Message-ID: <20150624075648.GD4976@localhost>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <20150622172610.GK483@localhost>
 <11dedbc454ab78f5e03497e2c5d8f5b3@agner.ch>
 <20150623092219.GA28202@localhost>
 <77568c206b51c50da927d69ea6b15957@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:33453 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbbFXH4q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 03:56:46 -0400
Content-Disposition: inline
In-Reply-To: <77568c206b51c50da927d69ea6b15957@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Johan Hovold <johan@kernel.org>, linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>

On Wed, Jun 24, 2015 at 12:08:50AM +0200, Stefan Agner wrote:
> On 2015-06-23 11:22, Johan Hovold wrote:
> > On Mon, Jun 22, 2015 at 10:11:35PM +0200, Stefan Agner wrote:
> >> On 2015-06-22 19:26, Johan Hovold wrote:
> > 
> >> > Instead, hang the gpio chip directly off the usb interface (not the
> >> > port), add a new config option, and keep the gpio implementation under
> >> > drivers/usb/serial (possibly in its own file ftdi_sio-gpio.c).
> >>
> >> Agreed sounds like a good plan. Will try this approach in v2.
> >>
> >> Except I don't think hanging it directly to the USB interface is the
> >> right thing to do.
> >>
> >> Looking at the block diagram of FT232R or FT232H, the CBUS pins seem to
> >> be part of the UART/FIFO controller. And I think the dual UART FT2232D
> >> actually supports controlling the CBUS pins of the two UART controllers
> >> individually, at least the block diagram thereof suggests so.
> > 
> > The port is a Linux abstraction, and for FTDI we happen to have exactly
> > one port child device per USB interface. As I see it, the gpio
> > controller for the CBUS pins should be a sibling rather than a child
> > device to the port.
> > 
> > Note that we'd still have two gpio-controllers on FT2232D (one per USB
> > interface).
> 
> I did some research. I think the FT2232D or FT2232H devices do not
> support the CBUS Bit Bang mode. For instance the D2XX Programmer's Guide
> indicates that on page 69 (CBUS Bit Bang Mode (FT232R and FT232H devices
> only)) as well as the AN_184 "FTDI Device Input Output Pin States", does
> not mention that the CBUS pins as EEPROM selectable (the same document
> does so for FT232R/FT232H devices)...
> 
> I don't have such a device, hence I can't try it out...

Just make sure to only register the gpio chip for device types that
support it (and devices that are configured for it...).

> > I'm aware that this requires some restructuring of the ftdi_sio-driver
> > (e.g. the device type and ftdi-interface number should be a feature of
> > the usb-serial rather than usb-serial-port device).
> 
> The findings above probably do not change the fact that we should not
> use the Linux port abstraction to attach the GPIO controller...
> 
> I looked into that a bit more in depth. Do I see things right that the
> multi-port devices have multiple USB interfaces, which leads to
> usb_serial_probe and in turn ftdi_sio_probe getting called multiple
> times by the USB stack? If yes, I think I have the bigger picture to go
> ahead and try to implement it accordingly.

Yes, that is correct.

Johan

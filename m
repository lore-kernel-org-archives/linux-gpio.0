From: Daniel Santos <danielfsantos@att.net>
Subject: Re: RESEND: Generating interrupts from a USB device driver?
Date: Tue, 03 Sep 2013 14:10:38 -0500
Message-ID: <5226342E.70804@att.net>
References: <52251562.5000208@att.net> <20130902230738.GA22494@kroah.com> <52253E1F.6000101@att.net> <20130903175933.GA8463@kroah.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130903175933.GA8463@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


On 09/03/2013 12:59 PM, Greg KH wrote:
> Hm, I thought we used to have some of them, I guess people have been
> saying they would write a driver for this type of hardware for a long
> time now :(

Well, on the bright side, we have one now, albeit in a "this is my first 
driver that nobody has reviewed yet" state. :)  It works (even on RPi -- 
well, mostly).  As-is, it has a fair TODO & fix list, which I'm sure 
will grow rapidly with some review. I hope that as I learn the kernel 
better, I can generalize parts of this into some re-usable lib for other 
USB-to-SPI/I2C/GPIO drivers.

https://github.com/daniel-santos/mcp2210-linux/

> Anyway, look at the spi core, I think you want to tie into the
> spi_new_device() call in your usb driver, and start sending/receiving
> data through the SPI interfaces the spi core provides.

I'm actually using the alternative to that call, which is the 
spi_alloc_device() / spi_add_device() pair as I'm not using struct 
spi_board_info at all since it doesn't (currently) have even half of the 
fields I need for each device. However, struct spi_device does have the 
two void * fields controller_data and controller_state -- I suppose I 
can use those to pass a pointer to a add_notify() type of function.  I 
was just trying to seek a more generic, re-usable mechanism, but this 
should at least work for now.

> The Linux SPI mailing list should be able to help you out a lot more
> here than I can.
>
> greg k-h

Thanks again for your help!

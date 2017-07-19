From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 19 Jul 2017 14:59:00 +0200
Message-ID: <20170719145900.42172f44@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <20170710125210.GK29638@localhost>
        <20170719085934.GU29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719085934.GU29638@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017 10:59:34 +0200
Johan Hovold johan@kernel.org wrote:
...
>> > +static const struct mfd_cell ftdi_cells[] = {
>> > +	{ .name = "ftdi-cbus-gpio", },
>> > +	{ .name = "ftdi-mpsse-i2c", },
>> > +	{ .name = "ftdi-mpsse-spi", },
>> > +	{ .name = "ftdi-fifo-fpp-mgr", },
>> > +};  
>> 
>> Correct me if I'm wrong, but aren't these modes really mutually
>> exclusive, possibly with exception of cbus-gpio (some pins are at least
>> available as GPIOs in MPSSE mode)? Then MFD is not is not the right fit
>> here either.  
>
>You never replied to this, and I'm afraid there are more issue with this
>series.

Sorry, unfortunately I'm too busy with other stuff. Will try to find
time to rework.

>> And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
>> seems too application specific for a generic chip like this.  
>
>Of which this is one is one of the major.

Thanks all for feedback. I'm still pondering how to interface the
fpga manager driver to FTDI FIFO driver.

>In short, your driver is much to application specific and is probably
>something that needs to be implemented in userspace using libftdi.

I have a requirement to use the fpga manager framework, therefore the
kernel driver is needed. Our usage scenario is a multi stage fpga
configuration process, the first stage is a pre-configuration via
FTDI SPI/FIFO, all subsequent stages are also done by other fpga
manager drivers. libftdi based driver already existed for hardware
bring-up, now I need similar functionality as kernel fpga manager.

>Speaking of libftdi, you seem to have copied or borrowed a lot of code
>and protocol from libftdi and this should have been mentioned in commit
>messages and file headers (not just in a comment to one specific
>function).

I'll mention this in next patch series.

>These chips can be used for a many different applications (also in FIFO
>mode) so you cannot tie a driver to it exposing just a specific
>interface for programming a certain class of FPGAs.

Agreed.

Anatolij

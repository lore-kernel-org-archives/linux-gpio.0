From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Tue, 25 Jul 2017 13:52:35 +0200
Message-ID: <20170725115235.GO2729@localhost>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-2-git-send-email-agust@denx.de>
 <20170710125210.GK29638@localhost>
 <20170719085934.GU29638@localhost>
 <20170719145900.42172f44@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170719145900.42172f44@crub>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2017 at 02:59:00PM +0200, Anatolij Gustschin wrote:
> On Wed, 19 Jul 2017 10:59:34 +0200
> Johan Hovold johan@kernel.org wrote:

> >> And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
> >> seems too application specific for a generic chip like this.  
> >
> >Of which this is one is one of the major.
> 
> Thanks all for feedback. I'm still pondering how to interface the
> fpga manager driver to FTDI FIFO driver.
> 
> >In short, your driver is much to application specific and is probably
> >something that needs to be implemented in userspace using libftdi.
> 
> I have a requirement to use the fpga manager framework, therefore the
> kernel driver is needed. Our usage scenario is a multi stage fpga
> configuration process, the first stage is a pre-configuration via
> FTDI SPI/FIFO, all subsequent stages are also done by other fpga
> manager drivers. libftdi based driver already existed for hardware
> bring-up, now I need similar functionality as kernel fpga manager.

How are you even accessing these fpga-managers from userspace? I thought
current interface was for in-kernel use only?

Thanks,
Johan

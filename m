From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Mon, 10 Jul 2017 14:52:10 +0200
Message-ID: <20170710125210.GK29638@localhost>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-2-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499374158-12388-2-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 06, 2017 at 10:49:16PM +0200, Anatolij Gustschin wrote:
> Add USB part with common functions for USB-GPIO/I2C/SPI master
> adapters. These allow communication with chip's control, transmit
> and receive endpoints and will be used by various FT232H drivers.

> +static const struct mfd_cell ftdi_cells[] = {
> +	{ .name = "ftdi-cbus-gpio", },
> +	{ .name = "ftdi-mpsse-i2c", },
> +	{ .name = "ftdi-mpsse-spi", },
> +	{ .name = "ftdi-fifo-fpp-mgr", },
> +};

Correct me if I'm wrong, but aren't these modes really mutually
exclusive, possibly with exception of cbus-gpio (some pins are at least
available as GPIOs in MPSSE mode)? Then MFD is not is not the right fit
here either.

And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
seems too application specific for a generic chip like this.

Johan

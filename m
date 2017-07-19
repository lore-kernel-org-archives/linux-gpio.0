From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 19 Jul 2017 13:58:30 +0200
Message-ID: <20170719135830.643f853d@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <20170710125210.GK29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40673 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752492AbdGSL6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2017 07:58:36 -0400
In-Reply-To: <20170710125210.GK29638@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>

On Mon, 10 Jul 2017 14:52:10 +0200
Johan Hovold johan@kernel.org wrote:

>On Thu, Jul 06, 2017 at 10:49:16PM +0200, Anatolij Gustschin wrote:
>> Add USB part with common functions for USB-GPIO/I2C/SPI master
>> adapters. These allow communication with chip's control, transmit
>> and receive endpoints and will be used by various FT232H drivers.  
>
>> +static const struct mfd_cell ftdi_cells[] = {
>> +	{ .name = "ftdi-cbus-gpio", },
>> +	{ .name = "ftdi-mpsse-i2c", },
>> +	{ .name = "ftdi-mpsse-spi", },
>> +	{ .name = "ftdi-fifo-fpp-mgr", },
>> +};  
>
>Correct me if I'm wrong, but aren't these modes really mutually
>exclusive, possibly with exception of cbus-gpio (some pins are at least
>available as GPIOs in MPSSE mode)? Then MFD is not is not the right fit
>here either.

MPSSE and FIFO modes are mutually exclusive, but I'm not sure about
MPSSE and CBUS-GPIO. CBUS-GPIO didn't work as expected when I was
testing with MPSSE SPI master driver, but maybe it is a driver issue.
FT245 FIFO and CBUS GPIO can be switched by a control request, when
FIFO mode is configured in the EEPROM.

>And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
>seems too application specific for a generic chip like this.

Yes, I agree. I'm thinking of a rework to add a FIFO driver instead
and use it in the fpp-mgr driver. Is that the right direction? 

Thanks,
Anatolij

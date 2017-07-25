From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Tue, 25 Jul 2017 14:34:41 +0200
Message-ID: <20170725143441.2debeff6@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <20170710125210.GK29638@localhost>
        <20170719135830.643f853d@crub>
        <20170725114908.GN2729@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:48191 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751799AbdGYMer (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jul 2017 08:34:47 -0400
In-Reply-To: <20170725114908.GN2729@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>

On Tue, 25 Jul 2017 13:49:08 +0200
Johan Hovold johan@kernel.org wrote:

>On Wed, Jul 19, 2017 at 01:58:30PM +0200, Anatolij Gustschin wrote:
>> On Mon, 10 Jul 2017 14:52:10 +0200
>> Johan Hovold johan@kernel.org wrote:
>>   
>> >On Thu, Jul 06, 2017 at 10:49:16PM +0200, Anatolij Gustschin wrote:  
>> >> Add USB part with common functions for USB-GPIO/I2C/SPI master
>> >> adapters. These allow communication with chip's control, transmit
>> >> and receive endpoints and will be used by various FT232H drivers.    
>> >  
>> >> +static const struct mfd_cell ftdi_cells[] = {
>> >> +	{ .name = "ftdi-cbus-gpio", },
>> >> +	{ .name = "ftdi-mpsse-i2c", },
>> >> +	{ .name = "ftdi-mpsse-spi", },
>> >> +	{ .name = "ftdi-fifo-fpp-mgr", },
>> >> +};    
>> >
>> >Correct me if I'm wrong, but aren't these modes really mutually
>> >exclusive, possibly with exception of cbus-gpio (some pins are at least
>> >available as GPIOs in MPSSE mode)? Then MFD is not is not the right fit
>> >here either.  
>> 
>> MPSSE and FIFO modes are mutually exclusive, but I'm not sure about
>> MPSSE and CBUS-GPIO. CBUS-GPIO didn't work as expected when I was
>> testing with MPSSE SPI master driver, but maybe it is a driver issue.  
>
>Yes, that wasn't clear to me either from just looking at the data
>sheets. MPSSE seems to deal with its GPIOs differently.

yes, the GPIOs are at different pins in MPSSE mode and these pins are
controlled via writes/reads to/from bulk endpoint with MPSSE commands.

>> FT245 FIFO and CBUS GPIO can be switched by a control request, when
>> FIFO mode is configured in the EEPROM.  
>
>Since the set_bitmode command is used to control the CBUS gpios, does
>that mean that they cannot be toggled independently while FIFO mode is
>in use (as the same command is used to set FIFO mode)?

yes.

Thanks,
Anatolij

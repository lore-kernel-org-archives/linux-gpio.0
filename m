From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Tue, 11 Jul 2017 08:52:37 +0200
Message-ID: <20170711085237.4c472621@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-2-git-send-email-agust@denx.de>
 <87y3s0adr3.fsf@miraculix.mork.no>
 <20170707115329.06dcdb69@crub>
 <20170710123427.GJ29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:48778 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753946AbdGKGwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jul 2017 02:52:42 -0400
In-Reply-To: <20170710123427.GJ29638@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 10 Jul 2017 14:34:27 +0200
Johan Hovold johan@kernel.org wrote:

>On Fri, Jul 07, 2017 at 11:53:29AM +0200, Anatolij Gustschin wrote:
>> On Fri, 07 Jul 2017 09:48:48 +0200
>> Bjørn Mork bjorn@mork.no wrote:
>>   
>> >[adding Johan on the CC list]
>> >
>> >Anatolij Gustschin <agust@denx.de> writes:
>> >  
>> >> +static struct usb_device_id ftdi_mfd_table[] = {
>> >> +	{ USB_DEVICE(0x0403, 0x6014) },
>> >> +	{}
>> >> +};
>> >> +MODULE_DEVICE_TABLE(usb, ftdi_mfd_table);    
>> >
>> >This device ID is currently handled by the ftdi_sio driver, so I believe
>> >you at least have to explain how you intend these two drivers to
>> >cooperate...  
>> 
>> these drivers cannot cooperate, the different ftdi function modes
>> use same device pins as in UART mode. So, you either can use the
>> device in UART interface mode or in some different mode. I do not
>> load the ftdi_sio module or do unbind the USB device from the
>> ftdio_sio driver and bind it to the mfd driver, e.g.:
>> 
>>   sh -c "echo -n "3-2:1.0" > /sys/bus/usb/drivers/ftdi_sio/unbind"
>>   sh -c "echo -n "3-2:1.0" > /sys/bus/usb/drivers/ftdi-mfd/bind"  
>
>I'm afraid that's not good enough. If we're going to support a non-UART
>mode through a separate driver, we need to have all drivers for these
>devices be able to retrieve the current mode during probe and only bind
>when the mode matches.

Can we reliably retrieve the current mode? For devices with connected
EEPROM some modes (including UART) are configurable in the EEPROM. For
devices without EEPROM the default mode is always UART, but FIFO-,
Bitbang- and MPSSE-mode can be switched via commands to the the chip.

Anatolij

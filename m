From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 19 Jul 2017 17:03:52 +0200
Message-ID: <20170719170352.443f57e7@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <87y3s0adr3.fsf@miraculix.mork.no>
        <20170707115329.06dcdb69@crub>
        <20170710123427.GJ29638@localhost>
        <20170711085237.4c472621@crub>
        <20170712085003.GQ29638@localhost>
        <87vamy81f1.fsf@miraculix.mork.no>
        <20170719152942.6202fdbb@crub>
        <063D6719AE5E284EB5DD2968C1650D6DD003C702@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DD003C702@AcuExch.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>
Cc: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017 13:39:36 +0000
David Laight David.Laight@ACULAB.COM wrote:

>From: Anatolij Gustschin
>> Sent: 19 July 2017 14:30  
>...
>> >Stupid question, I know, but I cannot help thinking: If you have an
>> >EEPROM then why the h... don't you use an application specific device
>> >ID?  
>> 
>> It would make sense for adapter devices that you can buy and plug.
>> In my particular case the configuration device with FTDI chips is
>> internal part of embedded board, the configuration interface is
>> never exposed to end users. I doesn't make sense to register an
>> ID for such hardware.  
>
>Sounds like you should absolutely be registering an ID so that
>nothing can try to use it using the default one.

The intended usage can already be enforced by rejecting not signed
bootloader/kernel/firmware.

Anatolij

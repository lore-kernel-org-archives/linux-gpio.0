From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 19 Jul 2017 15:29:42 +0200
Message-ID: <20170719152942.6202fdbb@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <87y3s0adr3.fsf@miraculix.mork.no>
        <20170707115329.06dcdb69@crub>
        <20170710123427.GJ29638@localhost>
        <20170711085237.4c472621@crub>
        <20170712085003.GQ29638@localhost>
        <87vamy81f1.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vamy81f1.fsf-3F4PFWf5pNjpjLOzFPqGjWGXanvQGlWp@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QmrDuHJu?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 12 Jul 2017 11:11:46 +0200
Bjørn Mork bjorn-yOkvZcmFvRU@public.gmane.org wrote:

>Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>> On Tue, Jul 11, 2017 at 08:52:37AM +0200, Anatolij Gustschin wrote:
>>  
>>> For devices with connected EEPROM some modes (including UART) are
>>> configurable in the EEPROM. For devices without EEPROM the default
>>> mode is always UART, but FIFO-, Bitbang- and MPSSE-mode can be
>>> switched via commands to the the chip.  
>>
>> IIRC we should be able read from the EEPROM, and I would at least expect
>> there to be a way to retrieve the current mode as well.  
>
>Stupid question, I know, but I cannot help thinking: If you have an
>EEPROM then why the h... don't you use an application specific device
>ID?

It would make sense for adapter devices that you can buy and plug.
In my particular case the configuration device with FTDI chips is
internal part of embedded board, the configuration interface is
never exposed to end users. I doesn't make sense to register an
ID for such hardware.

Thanks,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

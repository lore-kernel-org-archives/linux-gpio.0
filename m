From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 12 Jul 2017 11:11:46 +0200
Message-ID: <87vamy81f1.fsf@miraculix.mork.no>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <87y3s0adr3.fsf@miraculix.mork.no> <20170707115329.06dcdb69@crub>
        <20170710123427.GJ29638@localhost> <20170711085237.4c472621@crub>
        <20170712085003.GQ29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:50459 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750738AbdGLJLz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 05:11:55 -0400
In-Reply-To: <20170712085003.GQ29638@localhost> (Johan Hovold's message of
        "Wed, 12 Jul 2017 10:50:03 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Johan Hovold <johan@kernel.org> writes:
> On Tue, Jul 11, 2017 at 08:52:37AM +0200, Anatolij Gustschin wrote:
>
>> For devices with connected EEPROM some modes (including UART) are
>> configurable in the EEPROM. For devices without EEPROM the default
>> mode is always UART, but FIFO-, Bitbang- and MPSSE-mode can be
>> switched via commands to the the chip.
>
> IIRC we should be able read from the EEPROM, and I would at least expect
> there to be a way to retrieve the current mode as well.

Stupid question, I know, but I cannot help thinking: If you have an
EEPROM then why the h... don't you use an application specific device
ID?


Bj=C3=B8rn

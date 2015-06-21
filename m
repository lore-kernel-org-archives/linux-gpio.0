From: Philipp Hachtmann <hachti@hachti.de>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 21 Jun 2015 04:22:52 +0200
Message-ID: <55861FFC.30704@hachti.de>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from donald.hachti.de ([188.40.85.216]:34423 "EHLO donald.hachti.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753011AbbFUCcu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 20 Jun 2015 22:32:50 -0400
In-Reply-To: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, johan@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Am 21.06.2015 um 00:12 schrieb Stefan Agner:
> There are three GPIO modes supported by FTDI devices:
> 1. Asynchronous Bit Bang Mode (used in Sacha's patch)
> 2. Synchronous Bit Bang Mode (used in Philipp's patch)
> 3. CBUS Bit Bang Mode (used in Philipp's patch and this patchset)

1. No idea, could be
2. wrong
3. wrong

This is more complicated as I remember. The chip (I speak of FT232H here, 
because it's "my" chip) has quite a lot of options.

Reference: http://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232H.pdf

I did not use a bit bang mode. My patches were about synchronous FIFO mode and 
CBUS control. I'll try to explain.

There are eight data lines called ADBUS[7:0] and ten "other" lines called 
ACBUS[9:0].

When the chip is configured (EEPROM!) for UART mode (default), the RX, TX and 
modem status lines are assigned to ADBUS[7:0]. ACBUS7 can be used as an USB 
voltage detect input (and for nothing else in any case as it looks).
The other ACBUS lines can be configured for several tasks like TXLED, RXLED, 
SLEEP, clock output etc.
The ACBUS5, ACBUS6, ACBUS8 and ACBUS9 can also individually be configured to I/O 
mode which the datasheet calls "ACBUS BitBang".
These up to four (depending on user's choice) GPIO lines can be accessed from 
the host. They're usable for extra control to attached hardware. Controlling 
these CBUS lines was the intent of my CBUS patch.

My usblink board (FT232H plus FPGA etc.) makes use of the FT232H's asynchronous 
and synchronous FIFO modes. The asynchronous FIFO mode has to be selected by 
EEPROM settings. This works out of the box with the ftdi_sio driver. The driver 
doesn't notice anything. Just works. Baud rate settings etc. become meaningless, 
of course :-)
If you want to get the full USB 2.0 speed you have to use the synchronous FIFO 
mode. For this to work the chip has to be eeprom configured to asynchronous FIFO 
mode and then the driver has to select synchronous FIFO mode. This was subject 
of my other patch.

The chip has some other more or less cool modes but I have no idea if and how 
they work with the ftdi_sio driver. Two of them are named asynchronous and 
synchronous BitBang mode.

Conclusion:
The FTDI chip has different *modes* of operation which can be selected by eeprom 
and/or software. The mode determines the use of the *ADBUS* and some ACBUS pins. 
Two of modes are called bit bang modes.

ACBUS bit bang is an additional functionality which is *not to be confused* with 
the chip's operation mode!

The confusion comes from things like FTDI_SIO_SET_BITBANG_REQUEST to do anything...

I have not forgotten about the comments on my patches a year ago. I just did not 
yet find the time to do add that GPIO stuff.

Two interfaces have to be added to the driver:

- One for setting the mode (here: switch to synchronous FIFO)
I suggest adding a sysfs property here.

- One for the four CBUS bits
I *still* suggest adding a sysfs property *and* adding GPIO support as well.

I will most probably get back to the stuff in July.


Kind regards

Philipp


--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 21 Jun 2015 21:39:43 +0200
Message-ID: <2b51b85fcdb8e56e7aed929132eba3eb@agner.ch>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <55861FFC.30704@hachti.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55861FFC.30704-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Hachtmann <hachti-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org>
Cc: johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi Philipp,

On 2015-06-21 04:22, Philipp Hachtmann wrote:
> Am 21.06.2015 um 00:12 schrieb Stefan Agner:
>> There are three GPIO modes supported by FTDI devices:
>> 1. Asynchronous Bit Bang Mode (used in Sacha's patch)
>> 2. Synchronous Bit Bang Mode (used in Philipp's patch)
>> 3. CBUS Bit Bang Mode (used in Philipp's patch and this patchset)
> 
> 1. No idea, could be
> 2. wrong
> 3. wrong

The list is taken from FTDI's application note AN_232R-01, which mainly
refers to FT232R:
http://www.ftdichip.com/Support/Documents/AppNotes/AN_232R-01_Bit_Bang_Mode_Available_For_FT232R_and_Ft245R.pdf

However, as far as I understand those three bit bang options are also
available on FT232H (maybe there even more on those device?).

FTDI calls all 3 of them modes, but one can argue whether the third
really is an "operation mode" or just a "functionality" to set the CBUS
pins...

However, regarding option 2, I see now, your patch was about introducing
the option to use the Synchronous _FIFO_ mode which is not the same as
the Synchronous Bit Bang mode, hence this is clearly wrong in my list.
Sorry about that.

> 
> This is more complicated as I remember. The chip (I speak of FT232H
> here, because it's "my" chip) has quite a lot of options.
> 
> Reference:
> http://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232H.pdf
> 
> I did not use a bit bang mode. My patches were about synchronous FIFO
> mode and CBUS control. I'll try to explain.
> 
> There are eight data lines called ADBUS[7:0] and ten "other" lines
> called ACBUS[9:0].

I think we really refer to the same regarding CBUS mode. In the
application note above, this mode is called "CBUS Bit Bang"...

Your patch also uses FTDI_SIO_SET_BITBANG command 11 with the higher
byte set to 0x20 (FTDI_BITMODE_CBUS).


> 
> When the chip is configured (EEPROM!) for UART mode (default), the RX,
> TX and modem status lines are assigned to ADBUS[7:0]. ACBUS7 can be
> used as an USB voltage detect input (and for nothing else in any case
> as it looks).
> The other ACBUS lines can be configured for several tasks like TXLED,
> RXLED, SLEEP, clock output etc.
> The ACBUS5, ACBUS6, ACBUS8 and ACBUS9 can also individually be
> configured to I/O mode which the datasheet calls "ACBUS BitBang".
> These up to four (depending on user's choice) GPIO lines can be
> accessed from the host. They're usable for extra control to attached
> hardware. Controlling these CBUS lines was the intent of my CBUS
> patch.

This is the very same for FT232R devices, just that those devices call
the pins CBUS0-3.

> 
> My usblink board (FT232H plus FPGA etc.) makes use of the FT232H's
> asynchronous and synchronous FIFO modes. The asynchronous FIFO mode
> has to be selected by EEPROM settings. This works out of the box with
> the ftdi_sio driver. The driver doesn't notice anything. Just works.
> Baud rate settings etc. become meaningless, of course :-)
> If you want to get the full USB 2.0 speed you have to use the
> synchronous FIFO mode. For this to work the chip has to be eeprom
> configured to asynchronous FIFO mode and then the driver has to select
> synchronous FIFO mode. This was subject of my other patch.
> 
> The chip has some other more or less cool modes but I have no idea if
> and how they work with the ftdi_sio driver. Two of them are named
> asynchronous and synchronous BitBang mode.
> 
> Conclusion:
> The FTDI chip has different *modes* of operation which can be selected
> by eeprom and/or software. The mode determines the use of the *ADBUS*
> and some ACBUS pins. Two of modes are called bit bang modes.
> 
> ACBUS bit bang is an additional functionality which is *not to be
> confused* with the chip's operation mode!

I agree, the (A)CBUS bit bang "mode" is somewhat different as it doesn't
alter the functionality of the chip beyond the ability to use the
configured CBUS pins..

> 
> The confusion comes from things like FTDI_SIO_SET_BITBANG_REQUEST to
> do anything...
> 
> I have not forgotten about the comments on my patches a year ago. I
> just did not yet find the time to do add that GPIO stuff.
> 
> Two interfaces have to be added to the driver:
> 
> - One for setting the mode (here: switch to synchronous FIFO)
> I suggest adding a sysfs property here.
> 
> - One for the four CBUS bits
> I *still* suggest adding a sysfs property *and* adding GPIO support as well.

The only drawback in using gpiolib compared to sysfs is that some USB
control messages could be avoided since one can control the direction
and values of 4 pins using one byte and one USB control transfer.
However, since this mode is anyway not really meant as a high
performance bit bang mode, I think the overhead of gpiolib is
acceptable. It certainly is for my use case.

> 
> I will most probably get back to the stuff in July.

Ok cool. If that is ok for you, I will still work on this basic CBUS
mode, I guess your patches could easily be rebased on-top of my work.


--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in

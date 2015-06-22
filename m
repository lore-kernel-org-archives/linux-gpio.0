From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Mon, 22 Jun 2015 19:26:10 +0200
Message-ID: <20150622172610.GK483@localhost>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434838377-8042-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org, hachti-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 21, 2015 at 12:12:55AM +0200, Stefan Agner wrote:
> Yet another FTDI GPIO patchset. Yet somewhat different to previous
> implementations...
> 
> There are three GPIO modes supported by FTDI devices:
> 1. Asynchronous Bit Bang Mode (used in Sacha's patch)
> 2. Synchronous Bit Bang Mode (used in Philipp's patch)
> 3. CBUS Bit Bang Mode (used in Philipp's patch and this patchset)
> 
> Previous implementations:
> - Philipp Hachtmann (https://lkml.org/lkml/2014/5/31/181)
> - Sascha Silbe (https://lkml.org/lkml/2014/6/9/406)
> 
> The first two modes allow to control the serial pins and use the USB
> standard data transfer (write/read) to set the GPIO output values. Hence
> these modes interference with the standard serial mode of the devices,
> but are fast. The third option uses the USB control transfer to set
> GPIOs (which makes bit banging slower), and allows to control only 4
> pins. The controllable pins are predefined per device type (in FT232R
> CBUS0-3, in FT232H ACBUS5-9) and are not required for standard
> UART/serial communication. However, the default configuration is set to
> auxiliary functions such as TX/RXLED. Hence to make use of them in CBUS
> Bit Bang mode, the pins need to be reprogrammed to I/O mode first
> (EEPROM). All three modes are supported from userspace by libftdi afaik.

Is there a way to retrieve the settings from eeprom and only register
the gpio chip based on the configuration?

> In my use case I would like to use the additional GPIOs to control an
> embedded board (power off/reset etc.) and use the serial communication
> alongside. Using libftdi to use the CBUS Bit Bang mode is cumbersome,
> since libftdi requires to detach the kernel driver to get access to the
> device. The user needs then to reconnect the serial terminal every time
> a GPIO has been used. Hence, if any of these modes, I see most value in
> supporting the CBUS mode through the kernel's gpiolib API. However,
> since some functions are shared (e.g. set_bitmode to enable the
> different bit modes), this patchset is does some ground work for the
> other modes too, in case anybody wants to do further work on them.

I agree, the usb-serial driver should only provide access to the four
cbus pins if available (and use gpiolib).

> This patchset currently supports FT232R type of devices and has been
> tested using a FT232RL device. I think the FT232H (and probably later)
> types of devices should work too (at least the Table 3.5 in the FT232H
> data sheet mentions the ACBUS Signal Option "I/O mode"). However, I
> don't have such a device to test at my disposal.
> 
> On the implementation side, I created a distinct GPIO driver in
> drivers/gpio and create that platform device directly from within the
> ftdi_sio driver. I understand that the mfd subsystem would be the way to
> go, however it seems to me quite a big change... At least all USB device
> IDs would need to be moved to the mfd core device since the mfd device
> would be registered as a USB driver. I guess the ftdi_sio driver would
> become a platform device and still live under drivers/usb/serial/...?
> 
> I just saw that recent discussion by Grant and Linus did not approve
> this approach...?

Using the platform bus -- directly as you do or via MFD -- allows for
some (arguably contrived) abstraction but I think we should avoid it
nonetheless. USB (serial) does not use it as you already noted, and
there's not much to gain from creating a single-cell-mfd child device to
the USB interface.

Instead, hang the gpio chip directly off the usb interface (not the
port), add a new config option, and keep the gpio implementation under
drivers/usb/serial (possibly in its own file ftdi_sio-gpio.c).

Note that your current implementation fails to remove the gpio chip on
device disconnect, leaks resources in error paths, and lacks locking for
the gpio state.

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in

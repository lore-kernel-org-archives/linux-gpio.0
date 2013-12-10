From: Bruno Randolf <br1@einfach.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 10:18:12 +0000
Message-ID: <52A6EA64.4040307@einfach.org>
References: <1385597895-26418-1-git-send-email-br1@einfach.org> <20131129185606.GK16823@kw.sim.vm.gnt> <529C806F.4000204@einfach.org> <20131205165647.GM16823@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:36217 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849Ab3LJKSX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 05:18:23 -0500
In-Reply-To: <20131205165647.GM16823@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/05/2013 04:56 PM, Simon Guinot wrote:
> Note that this base address is shared between several drivers: 
> watchdog/sch311x_wdt, hwmon/dme1737 and gpio/gpio-sch311x.c. The
> same logical device (0xa) is used.
> 
> Moreover some offsets against this base address are also shared.
> For example, 0x47 is a "valid" offset for both the GPIO and the
> watchdog drivers. I guess that the correct usage for this pin
> depends on how the hardware is wired. Unfortunately, there is no
> way for the drivers to guess that.
> 
> Did you had the opportunity to run all this drivers together ?

My access to the board is limited, but I had a chance to try it.

dme1737 doesn't load because there is another resource conflict:

# modprobe dme1737
FATAL: Error inserting dme1737
(/lib/modules/3.13.0-rc1-wl+/kernel/drivers/hwmon/dme1737.ko): Device
or resource busy

[  181.109897] ACPI Warning: 0x00000670-0x00000671 SystemIO conflicts
with Region \_SB_.PCI0.LPCB.RNTR 1 (20130927/utaddress-251)
[  181.109921] ACPI: If an ACPI driver is available for this device,
you should use it instead of the native driver

I can load and use sch311x_wdt and gpio-sch311x at the same time,
because they reserve different memory regions:

/proc/ioports:
  0647-0647 : sch311x_wdt
  064b-0650 : gpio-sch311x
  0665-0668 : sch311x_wdt

Only when I'd try to request GPIO 60 (offset 0x47) I obviously get a
conflict:

# echo 60 > /sys/class/gpio/export
- -bash: echo: write error: Device or resource busy

[  334.776859] gpio-sch311x gpio-sch311x: Failed to request region 0x0647.

I think this can be expected...

bruno

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSpupkAAoJEE06nu8QSdWBvXYH/jE9AG5YtidekEPJS7REYLNJ
hrAgykvnthDSACSPp6jLZnA4Bh80EG5DZGJ0PwtmXmR701+cOfcqlwwFvsfvHgXk
YHxihi+niwZ8p04njwAk3sWPtODprbcboB+G4USjoVeZwDInKx8gLgiKHho7akbR
PRht6cWm6iwX7UeE1/1/BfSUHisi8L0OBCditDLBApEcw094UXxP1juqQimXz2xV
Tver8mRkOYUl7q0VT7j6WIqIaw2yq+a4QEbjoSarc3YwbYuEMYzOyevI61uczhej
Sq7sXYvkTcos2k8dQMr33oM89uJ+hgBOja9Ir2tInR1ewDjLnbzCtV+n5Q8SJLg=
=E2V6
-----END PGP SIGNATURE-----

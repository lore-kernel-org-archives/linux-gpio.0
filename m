From: Bruno Randolf <br1@einfach.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 12:19:02 +0000
Message-ID: <52A706B6.1030400@einfach.org>
References: <1385597895-26418-1-git-send-email-br1@einfach.org> <20131129185606.GK16823@kw.sim.vm.gnt> <529C806F.4000204@einfach.org> <20131205165647.GM16823@kw.sim.vm.gnt> <52A6EA64.4040307@einfach.org> <20131210114427.GU16823@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:52301 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401Ab3LJMTK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 07:19:10 -0500
In-Reply-To: <20131210114427.GU16823@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/10/2013 11:44 AM, Simon Guinot wrote:
>> dme1737 doesn't load because there is another resource conflict:
>> 
>> # modprobe dme1737 FATAL: Error inserting dme1737 
>> (/lib/modules/3.13.0-rc1-wl+/kernel/drivers/hwmon/dme1737.ko):
>> Device or resource busy
>> 
>> [  181.109897] ACPI Warning: 0x00000670-0x00000671 SystemIO
>> conflicts with Region \_SB_.PCI0.LPCB.RNTR 1
>> (20130927/utaddress-251) [  181.109921] ACPI: If an ACPI driver
>> is available for this device, you should use it instead of the
>> native driver
> 
> You can enforce the driver loading with the kernel parameter 
> acpi_enforce_resources={lax|no}.

Thank you! Yes, this way I can load it and get sensor data. There are
no resource conflicts:

# cat /proc/ioports |grep "sch\|dme"
  0647-0647 : sch311x_wdt
  064b-0650 : gpio-sch311x
  0665-0668 : sch311x_wdt
  0670-0671 : dme1737
    0670-0671 : dme1737

> Yes indeed. I guess this kind of devices with common resources
> could really make use of a mfd driver.

Maybe, but I'm not going to do the work...

bruno

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSpwa2AAoJEE06nu8QSdWBpfoH/3ste3Bn4YixePdu9CMKqaFq
jQEu6MsDm7j96Iq9sk9DMyropcqeyZd0vtM9AlTVYPQCLR4fFU7oEa+HDrFa1OUz
TjphDkgSFl4hHXxirHH4GP9YadBDwCfw/6EF8B/LasdHmM4OeBA8ucFRx/LFbWcH
IfPCCgCz55DizXLvDcEvEUkdgD5nEwXSR4GKjX5djR7+dRNAvSl1Yg8rB9BXw/1p
T/CO6V5N/2US0cV1t/Hqql2+r0ZlrYRwm4e/pnieGxtdivWsQN+BBBpVgRKRhri0
oHi5MV7ZBw9vx2Y70rV48S6CdUzk0j3j6+WQDl4khtjLDjg1VH4e6QsfXf1dK8Q=
=fYLG
-----END PGP SIGNATURE-----

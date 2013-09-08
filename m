From: Daniel Santos <danielfsantos@att.net>
Subject: "Virtual" Interrupts -- Need help please
Date: Sat, 07 Sep 2013 19:19:06 -0500
Message-ID: <522BC27A.5080303@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm4-vm1.access.bullet.mail.bf1.yahoo.com ([216.109.114.112]:36699
	"EHLO nm4-vm1.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750819Ab3IHASs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Sep 2013 20:18:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

I've posted a number of requests for aid on this and have gotten very 
little responses and none that were helpful. I have spent at least 24 
hours of research time on this and just a little direction from somebody 
who knows this subsystem can help me immensely as the IRQ subsystem is 
new to me.

This is for the MCP2210 driver (a USB to SPI/GPIO bridge) and my driver 
is the first of its class for the Linux kernel, giving me less to look 
at as an example.  I intend to use standard drivers for whatever I have 
connected at the other end.  For this to work, I need to supply 
interrupts for some of these drivers to work correctly.  How do I do 
this? Every thing else on this driver is ready to go and my handler 
functions for this are empty and waiting for some code.

So do i create an IRQ domain and then call generic_handle_irq() from my 
URB complete() function? If so, which type of IRQ Domain is appropriate 
for this? Unlike typical platform devices, these are dynamically added 
and removed throughout the life of the kernel, adding to the challenge.  
So, if I understand correctly, my base IRQ number needs to be 
dynamically generated.  How should I manage this?

Finally, if you have any example drivers that are doing something 
similar, that would be SO very helpful as well!

I have some secondary (and less important) questions about how to 
integrate this with device drivers that want a DT / open firmware config 
(which I know almost nothing about at this time), but that can wait.

Any help *greatly* appreciated and thank you in advance!

Daniel

PS: If interested, my current driver here: 
https://github.com/daniel-santos/mcp2210-linux. I  haven't sought review 
yet because I want to finish it first.


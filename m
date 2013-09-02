From: Daniel Santos <danielfsantos@att.net>
Subject: RESEND: Generating interrupts from a USB device driver?
Date: Mon, 02 Sep 2013 17:46:58 -0500
Message-ID: <52251562.5000208@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm13-vm1.access.bullet.mail.gq1.yahoo.com ([216.39.63.11]:48051
	"EHLO nm13-vm1.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759051Ab3IBWqp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2013 18:46:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>

Hello guys.  I didn't get a response the last time so hopefully with 
3.11 out I'll get one this time.

I need to be able to generate interrupts from a USB device driver while 
servicing the complete() function of an interrupt URB. While I realize 
that this may seem strange, the purpose is for a USB to SPI/GPIO bridge 
chip (the MCP2210). When something happens on the remote device where a 
chip is expecting it's interrupt out pin to trigger an interrupt on some 
local (to the board) microcontroller, the MCP2210 instead receives that 
signal and communicates it to the host the next time it's queried. This 
is the interrupt that I need to, in effect propagate locally. Since my 
spi_master and gpio_chip are all functioning now, this is the last step 
to get one of my spi protocol drivers working correctly.

I've been reading up on Documentation/IRQ-domain.txt, but IRQ 
controllers are all new to me and there's a lot for me to learn, so I 
just want to make sure I'm going down the correct path. Is the correct 
method to create an IRQ domain with irq_domain_add_linear() or some 
such? I can figure it out eventually, but if somebody can point me in 
the right direction, it can save me a WHOLE lot of time.

Thanks in advance
Daniel


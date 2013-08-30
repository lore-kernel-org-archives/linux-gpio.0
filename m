From: Daniel Santos <danielfsantos@att.net>
Subject: USB-to-SPI bridge to spi protocol driver w/ interrupts?
Date: Fri, 30 Aug 2013 08:00:37 -0500
Message-ID: <52209775.7020206@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm26-vm10.access.bullet.mail.bf1.yahoo.com ([216.109.115.217]:39560
	"EHLO nm26-vm10.access.bullet.mail.bf1.yahoo.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755560Ab3H3NAZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 30 Aug 2013 09:00:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

So I'm near being finished with my MCP2210 driver (a USB-to-SPI bridge 
with GPIOs) and have started writing an spi protocol driver for one of 
the devices I'll be talking to, the ADNS-9800.  However, this device has 
an interrupt output pin and I can't figure out how to communicate that 
interrupt from the MCP2210 driver to the ADNS-9800 driver.

If the ADNS-9800 were on the same board as the rest of my computer, I 
would just attach this to an interrupt line, but USB is not an 
interrupt-driven interface.  So in the MCP2210 driver, I poll the device 
and am aware of when these interrupts occur on the remote board (the 
MCP2210 actually has a dedicated interrupt counter functionality), but 
how do deal with this on the host? Should I create a softirq? If so, 
where is this documented? Or should I use some other mechanism?

I hope this isn't a situation where there isn't yet a framework in place 
to do this cleanly.  I'm guessing that these cheap "bridge" types of 
chips will become more popular over time, so running drivers on a host 
computer that communicates with devices on the other side of such 
bridges will become more common in the future as well. They are also 
very nice for prototyping.

My current driver is on github: 
https://github.com/daniel-santos/mcp2210-linux/

Daniel



From: Daniel Santos <danielfsantos@att.net>
Subject: What is the correct way to map an input gpio to an irq/event/notifier?
Date: Sat, 24 Aug 2013 15:30:15 -0500
Message-ID: <521917D7.5060801@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm8-vm8.access.bullet.mail.gq1.yahoo.com ([216.39.63.216]:39715
	"EHLO nm8-vm8.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755521Ab3HXUgi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sat, 24 Aug 2013 16:36:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio <linux-gpio@vger.kernel.org>

Hello guys.  I'm new to this list and have been working on a driver for 
the MCP2210 "USB-to-SPI bridge w/GPIO" (my first driver).  I haven't 
implemented the polling of its gpios just yet (I just finished the 
interface where gpio values are retrieved on-demand), but I have another 
issue looming.

In addition to the MCP2210 driver, I'm planning on having an spi 
protocol driver for the ADNS-9800 chip that will be connected to the 
MCP2210, but which also has an interrupt output pin (to tell its host 
that it needs servicing).  I've got all of the SPI stuff worked out, but 
I don't know the proper way to connect that gpio to the ADNS-9800 
driver.  I suppose my options are:

1. Pass the ADNS-9800 the gpio number and let the ADNS-9800 poll it
2. Have my MCP2210 driver poll its gpios its self and notify consumers 
of changes through some interface (soft irqs?)

Thanks in advance!
Daniel Santos

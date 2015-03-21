From: Michael Kaplan <michael_kaplan@inode.at>
Subject: gpio-mcp23s08 irq issue
Date: Sun, 22 Mar 2015 00:04:34 +0100
Message-ID: <1426979074.14991.7.camel@netghost.ehp.lan>
Reply-To: michael_kaplan@inode.at
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from b2bfep16.mx.upcmail.net ([62.179.121.61]:52654 "EHLO
	b2bfep16.mx.upcmail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbbCUXE4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Mar 2015 19:04:56 -0400
Received: from edge11.upcmail.net ([192.168.13.81])
          by b2bfep16.mx.upcmail.net
          (InterMail vM.8.01.05.05 201-2260-151-110-20120111) with ESMTP
          id <20150321230434.FBBV22681.b2bfep16-int.chello.at@edge11.upcmail.net>
          for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2015 00:04:34 +0100
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi!

I am using an MCP23017 on a raspberry pi as GPIO expander.
I am using  this to switch relais on the output side, and for reading
the states of some switches on the input side.

I created a device-tree overlay from the example in
Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt which is
working fine for reading/writing via the sysfs interface.

The problem occurs when I try to enable the interrupt via the edge file.
As soon as I change the state of one of the irq-enabled gpio pins, I get
following in the syslog:

[  214.975538] irq 398: nobody cared (try booting with the "irqpoll"
option)
< many lines of stack trace>
[  215.739630] Disabling IRQ #398

I realize that such an 'IRQ #: nobody cared' message occurs when there
are 100.000 unhandled interrupts.

>From /proc/interrupts I can see that one single interrupt out of 100.001
was handled by the mcp23s08 driver:

398:     100001  pinctrl-bcm2835   4  1-0020
457:          1  gpio-mcp23xxx   9  gpiolib

I could confirm that by adding a printk() into the mcp23s08_irq()
function.

Now when I change my device tree overlay to use IRQ_TYPE_LEVEL_FALLING
instead of IRQ_TYPE_LEVEL_LOW, and additionally use IRQF_TRIGGER_FALLING
instead of IRQF_TRIGGER_LOW in the devm_request_threaded_irq() call
within the function mcp23s08_irq_setup(), it works as expected - one
interrupt for each state change on the gpio pin.

I am using a self built 3.18.9+ kernel from the raspberry pi kernel
repository because the gpio-mcp23s08 driver is not included in the
standard kernel images.

I am aware of some changes that happened to the driver in the kernel
repository since 3.18, but even the newest version is still using
IRQF_TRIGGER_LOW, so I guess it won't work on my side with a newer
driver version either.

So my questions are:

1.) Why exactly is level triggering used instead of edge triggering?

2.) Would it be reasonable to add two more options via the device-tree
interface to make it possible to define IRQ_TYPE_LEVEL_FALLING and
IRQ_TYPE_LEVEL_RISING in an overlay?

3.) Are there any suggestions what I could do to avoid the problem
without patching the driver?


Any help would be appreciated ;-)

regards
Michael Kaplan



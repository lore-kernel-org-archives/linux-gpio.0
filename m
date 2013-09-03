From: Daniel Santos <danielfsantos@att.net>
Subject: Re: RESEND: Generating interrupts from a USB device driver? (USB
 to SPI/GPIO bridge)
Date: Tue, 03 Sep 2013 15:00:51 -0500
Message-ID: <52263FF3.6080409@att.net>
References: <52251562.5000208@att.net> <20130902230738.GA22494@kroah.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm7-vm8.access.bullet.mail.bf1.yahoo.com ([216.109.114.167]:39000
	"EHLO nm7-vm8.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758278Ab3ICUAg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2013 16:00:36 -0400
In-Reply-To: <20130902230738.GA22494@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>

On 09/02/2013 06:07 PM, Greg KH wrote:
> On Mon, Sep 02, 2013 at 05:46:58PM -0500, Daniel Santos wrote:
>> Hello guys.  I didn't get a response the last time so hopefully with
>> 3.11 out I'll get one this time.
>>
>> I need to be able to generate interrupts from a USB device driver while
>> servicing the complete() function of an interrupt URB.
> No you don't :)

Hmm, am I wrong that if I want my gpios to be poll()-able from userspace 
(via /sys/class/gpio/gpio<num>/value), that I must generate an IRQ and 
populate my .to_irq function of gpio_chip? Or is it cleaner to find the 
dirent and directly call sysfs_notify_dirent() to facilitate this 
behavior to userspace?

Of course, this will wont enable drivers that want an irq in the kernel, 
but aside from this ADNS-9800, I don't need that functionality.

Thanks,
Daniel

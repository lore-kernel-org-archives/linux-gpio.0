From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: RESEND: Generating interrupts from a USB device driver?
Date: Mon, 2 Sep 2013 16:07:38 -0700
Message-ID: <20130902230738.GA22494@kroah.com>
References: <52251562.5000208@att.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50585 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759081Ab3IBXFE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2013 19:05:04 -0400
Content-Disposition: inline
In-Reply-To: <52251562.5000208@att.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Santos <daniel.santos@pobox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>

On Mon, Sep 02, 2013 at 05:46:58PM -0500, Daniel Santos wrote:
> Hello guys.  I didn't get a response the last time so hopefully with 
> 3.11 out I'll get one this time.
> 
> I need to be able to generate interrupts from a USB device driver while 
> servicing the complete() function of an interrupt URB.

No you don't :)

> While I realize that this may seem strange, the purpose is for a USB
> to SPI/GPIO bridge chip (the MCP2210). When something happens on the
> remote device where a chip is expecting it's interrupt out pin to
> trigger an interrupt on some local (to the board) microcontroller, the
> MCP2210 instead receives that signal and communicates it to the host
> the next time it's queried. This is the interrupt that I need to, in
> effect propagate locally. Since my spi_master and gpio_chip are all
> functioning now, this is the last step to get one of my spi protocol
> drivers working correctly.

Just pass the data up the spi stack in your interrupt endpoint handler.
No need to try to create a "real" interrupt.  There are other USB SPI
drivers that should give you the idea of how to do it.

thanks,

greg k-h

From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [RFC PATCH 0/7] gpiolib: add bias support
Date: Fri, 15 Dec 2017 07:54:16 +0100
Message-ID: <20171215065416.GE2531@rfolt0960.corp.atmel.com>
References: <20171214142138.23008-1-ludovic.desroches@microchip.com>
 <20171214160625.GG19186@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:43543 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751794AbdLOGyX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Dec 2017 01:54:23 -0500
Content-Disposition: inline
In-Reply-To: <20171214160625.GG19186@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Andrew,

On Thu, Dec 14, 2017 at 05:06:25PM +0100, Andrew Lunn wrote:
> > I have not introduced a gpiod_set_bias() because I think the only place to
> > setup this is in the device tree. It's useless to setup a bias pull up if there
> > is an external pull up on the board.
> 
> Hi Ludovic
> 
> I have a use case where having gpiod_set_bias() would be good. The
> DLN2 is a USB device, which offers GPIO, I2C, and SPI services on its
> pins. It is a hot pluggable device, and i'm using it on Intel
> machines, making it double hard to use with Device Tree.
> 
> It would be good to be able to set the pull up/down on the GPIO pins,
> probably from a small kernel module which calls gpiod_set_bias(), or
> via /sysfs.

Thanks for your feedback. I'll try to keep your need in mind for next
version or rework.

Ludovic

> 
>     Andrew
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

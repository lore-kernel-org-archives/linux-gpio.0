From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH 0/7] gpiolib: add bias support
Date: Thu, 14 Dec 2017 17:06:25 +0100
Message-ID: <20171214160625.GG19186@lunn.ch>
References: <20171214142138.23008-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:32826 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752944AbdLNQG1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Dec 2017 11:06:27 -0500
Content-Disposition: inline
In-Reply-To: <20171214142138.23008-1-ludovic.desroches@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

> I have not introduced a gpiod_set_bias() because I think the only place to
> setup this is in the device tree. It's useless to setup a bias pull up if there
> is an external pull up on the board.

Hi Ludovic

I have a use case where having gpiod_set_bias() would be good. The
DLN2 is a USB device, which offers GPIO, I2C, and SPI services on its
pins. It is a hot pluggable device, and i'm using it on Intel
machines, making it double hard to use with Device Tree.

It would be good to be able to set the pull up/down on the GPIO pins,
probably from a small kernel module which calls gpiod_set_bias(), or
via /sysfs.

    Andrew

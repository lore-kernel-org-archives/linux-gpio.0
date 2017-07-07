From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 3/3] fpga manager: Add FT232H driver for Altera FPP
Date: Fri, 7 Jul 2017 09:34:41 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DD003568E@AcuExch.aculab.com>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-4-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-4-git-send-email-agust@denx.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Anatolij Gustschin' <agust@denx.de>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Anatolij Gustschin
> Sent: 06 July 2017 21:49
> 
> Add FPGA manager driver for loading Altera FPGAs via fast
> passive parallel (FPP) interface using FTDI FT232H chip.

I can't help feeling this is very specific for a particular card.

While all(?) Altera (now Intel) FPGA support FPP programming
it will require extra on-board logic to interface to anything
external - especially something as generic as the FT232H.

Since this isn't a connector that Altera put on any of their
dev boards (not any I've seen anyway), the board manufacturer
has probably picked their own assignments for the pins.

The only standard interface for programming the FPGA is the
JTAG one - and the data formats for that probably require
reverse engineering (has been done).

	David

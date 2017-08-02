From: Eric Schwarz <eas@sw-optimization.com>
Subject: Re: [PATCH 0/3] FPGA Manager support for FPP via FT232H FT245-FIFO
Date: Wed, 02 Aug 2017 17:30:36 +0200
Message-ID: <ff3124e052defa1cc562847b6a65df37@sw-optimization.com>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <42304c20fd460f456ef588df0b97a593@sw-optimization.com>
 <CANk1AXRJJ1seMv0eJmgTrcax+Y-vFyw=XfrQH+8Dd3TGG+jZ0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXRJJ1seMv0eJmgTrcax+Y-vFyw=XfrQH+8Dd3TGG+jZ0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>
Cc: Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-fpga-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello Alan,

many thanks for your response.
Well, I am following the whole discussion from the very start and for my 
taste it is too superficial - don't know whether this is the right 
wording. Please get me right. We need some kind of implementation 
specification or a sample way on how to implement stuff. At some point I 
honestly lost track, thus I was asking for a summary so in the end the 
result is what we want. If it is clear to everyone what shall be done it 
should not be kind of a big deal to quickly sum it up which I/we would 
highly appreciate.

Many thanks
Eric

Am 02.08.2017 16:16, schrieb Alan Tull:

> On Wed, Aug 2, 2017 at 6:36 AM, Eric Schwarz <eas@sw-optimization.com> 
> wrote:
> 
>> Dear all,
>> 
>> DENX Software Engineering develops and brings this driver to mainline 
>> on
>> behalf of us (ARRI*).
>> 
>> Since there was a lot of discussion around this patch series I would 
>> highly
>> appreciate if someone could sum up what needs to be changed in detail 
>> in
>> order to get this driver into the mainline as I am used it from the 
>> other
>> "line-by-line" reviews. I understood that the approach is not generic 
>> enough
>> - please correct me if I am wrong on that point. We somehow need a
>> commitment that if we change it to another way that the whole 
>> discussion
>> does not start from scratch.
>> 
>> Many thanks
>> Eric
> 
> Hi Eric,
> 
> Patchwork collects all email response to patchsets posted on this
> mailing list [1] so that could be helpful for you here.
> 
> Alan
> 
> [1] https://patchwork.kernel.org/project/linux-fpga/list/?submitter=769
> 
> * I am just writing from my private e-mail address since Outlook 
> obviously
> renders all my mails as HTML despite what I am configuring.
> 
> [1]... http://www.arri.com
> 
> Am 06.07.2017 22:49, schrieb Anatolij Gustschin:
> 
> This series adds support for fast passive parallel (FPP) Altera
> FPGA configuration using FTDI FT232H chip in FT245-FIFO mode.
> It has been used to configure Arria 10 FPGAs.
> 
> Patch 1 adds an FT232H MFD driver with common functions that
> can be used for FT232H USB-GPIO/I2C/SPI master adapter drivers.
> Currently it is used for FT232H GPIO support (in patch 2) and
> for FT245 FIFO transfers in FPP FPGA manager driver in patch 3.
> Driver support for FT232H USB-I2C/SPI master adapters can be
> added later.
> 
> Patch 2 adds a simple GPIO driver supporting four FT232H CBUS GPIOs.
> 
> Patch 3 adds an FPGA Manager driver for Altera FPP FPGA configuration
> via FT232H FT245-FIFO interface.
> 
> Anatolij Gustschin (3):
> mfd: Add support for FTDI FT232H devices
> gpio: Add FT232H CBUS GPIO driver
> fpga manager: Add FT232H driver for Altera FPP
> 
> drivers/fpga/Kconfig          |   7 +
> drivers/fpga/Makefile         |   1 +
> drivers/fpga/ftdi-fifo-fpp.c  | 569
> ++++++++++++++++++++++++++++++++++++++++++
> drivers/gpio/Kconfig          |  11 +
> drivers/gpio/Makefile         |   1 +
> drivers/gpio/gpio-ftdi-cbus.c | 251 +++++++++++++++++++
> drivers/mfd/Kconfig           |   9 +
> drivers/mfd/Makefile          |   1 +
> drivers/mfd/ftdi-ft232h.c     | 470 ++++++++++++++++++++++++++++++++++
> include/linux/mfd/ftdi/ftdi.h |  71 ++++++
> 10 files changed, 1391 insertions(+)
> create mode 100644 drivers/fpga/ftdi-fifo-fpp.c
> create mode 100644 drivers/gpio/gpio-ftdi-cbus.c
> create mode 100644 drivers/mfd/ftdi-ft232h.c
> create mode 100644 include/linux/mfd/ftdi/ftdi.h

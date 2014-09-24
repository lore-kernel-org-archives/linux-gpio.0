From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 5/9] gpio: vf610: Extend with wakeup support
Date: Wed, 24 Sep 2014 18:33:03 +0200
Message-ID: <0a182a1652d0271cdd0a262bc9efc945@agner.ch>
References: <cover.1411404079.git.stefan@agner.ch>
 <704b6bb97147b3d0ee1557b43d85ab9376c28666.1411404079.git.stefan@agner.ch>
 <CACRpkdYCiKzyVpg9u-YXn-QMd7PSKR72siXQQWALe0OqTNr-rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.102]:40789 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbaIXQdm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 12:33:42 -0400
In-Reply-To: <CACRpkdYCiKzyVpg9u-YXn-QMd7PSKR72siXQQWALe0OqTNr-rw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, jingchang.lu@freescale.com, Huang Yongcai-B20788 <b20788@freescale.com>, Shawn Guo <shawn.guo@freescale.com>

Am 2014-09-24 11:19, schrieb Linus Walleij:
> On Mon, Sep 22, 2014 at 7:09 PM, Stefan Agner <stefan@agner.ch> wrote:
> 
>> Support Vybrid GPIO's as wakeup source by requesting the parent
>> IRQ as wakeup IRQ.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  drivers/gpio/gpio-vf610.c | 16 ++++++++++++++++
> 
> This driver is not yet upstream. Make wakeup support part
> of the initial driver submission instead, it doesn't hurt.

Ok, will do. 

Just realized that this patch even leads to compile errors when applying
on top of v2 of the GPIO driver; we need the irq in drivers struct here,
and I removed that in v2...  :-)

--
Stefan

From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Mon, 5 Oct 2015 19:11:09 -0400
Message-ID: <5613038D.4050302@gmail.com>
References: <20151001015832.GA11317@sophia>
 <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
 <CAErSpo6F_ShDuR=7VKebhS=T3qtvYfQKxoM2x7C2NGYT=7n8RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:35215 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbbJEXLM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 19:11:12 -0400
In-Reply-To: <CAErSpo6F_ShDuR=7VKebhS=T3qtvYfQKxoM2x7C2NGYT=7n8RA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 10/05/2015 06:47 PM, Bjorn Helgaas wrote:
> I'm really not familiar with PC/104, but wikipedia claims it only uses
> ISA.  Apparently PCI/104-Plus, PCI-104, PCI/104-Express, and PCIe/104
> *do* have PCI and/or PCIe, but it looks like the base PC/104 does not.
> 
> Bjorn
> 

This is correct: PC/104 is only ISA. The ACCES 104-IDIO-16 board is a
PC/104 stackable GPIO board, whose port address is configured via
physical jumper switches on the board; it is not "hotpluggable." For
this reason, the CONFIG_104_IDIO_16_BASE option should be set to the
same port address physically configured on the board.

- William

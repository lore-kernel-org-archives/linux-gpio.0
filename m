From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/3] gpio: zynq: Clear pending interrupt when enabling a
 IRQ
Date: Wed, 23 Jul 2014 10:42:54 -0700
Message-ID: <c1290e0f-b2db-48fb-bc32-aabe1e4ce9ff@BN1BFFO11FD023.protection.gbl>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
 <1405677133-8706-2-git-send-email-lars@metafoo.de>
 <CACRpkda3p3v7o2itkTPRPr6KFhrUO3M8fvn_2S8oYsd_2oaXaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1lp0141.outbound.protection.outlook.com ([207.46.163.141]:30090
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932347AbaGWRnB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Jul 2014 13:43:01 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda3p3v7o2itkTPRPr6KFhrUO3M8fvn_2S8oYsd_2oaXaw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Harini Katakam <harinik@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, 2014-07-23 at 04:31PM +0200, Linus Walleij wrote:
> On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> 
> > The Zynq GPIO controller does not disable the interrupt detection when the
> > interrupt is masked and only disables the propagation of the interrupt. This
> > means when the controller detects an interrupt condition while the interrupt is
> > logically disabled (and masked) it will propagate the recorded interrupt event
> > once the interrupt is enabled. This will cause the interrupt consumer to see
> > spurious interrupts to prevent this first make sure that the interrupt is not
> > asserted and then enable it.
> >
> > E.g. when a interrupt is requested with request_irq() it will be configured
> > according to the requested type (edge/level triggered, etc.) after that it will
> > be enabled. But the detection circuit might have already registered a false
> > interrupt before the interrupt type was correctly configured and once the
> > interrupt is unmasked this false interrupt will be propagated and the interrupt
> > handler for the just request interrupt will called.
> >
> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> 
> Seems like you know what you're doing.
> 
> Patch tentatively applied unless Harini or Soren protests...

All these things look good to me, though I thought I had tested
interrupts on banks other than zero, but it might have slipped through.

Since I'm not subscribed to linux-gpio, I don't have the proper patches
in my mailbox, is there a patchworks instance for linux-gpio? I couldn't
find any :(

	Thanks,
	Soren


From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio:pca953x: add mechanism to simulate open drain outputs
Date: Thu, 24 Sep 2015 15:11:19 -0700
Message-ID: <CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
References: <cover.1443031678.git.hns@goldelico.com>
	<1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33000 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754504AbbIXWLT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 18:11:19 -0400
Received: by oixx17 with SMTP id x17so49256521oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 15:11:19 -0700 (PDT)
In-Reply-To: <1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, eric miao <eric.miao@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marek Belisko <marek@goldelico.com>, Grazvydas Ignotas <notaz@openpandora.org>

On Wed, Sep 23, 2015 at 11:13 AM, H. Nikolaus Schaller
<hns@goldelico.com> wrote:

> 1. add a DT property to specify the list of GPIO pins that are to become
>    "open drain"
> 2. if a pin is configured as "open drain", set value by either outputting a
>    "0" (low level) or switching to input (high impedance)
>
> Tested on OMAP5 uEVM with TCA6424 and some LEDs connected to 5V.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

I understand the approach, but this is the wrong way to do it.
Instead of indicating that a pin on the pin controller should be
open drain, the *consumer* specifying its gpios = <....> should
do this.

I just sent a patch adding the bindings because Tony Lindgren
and Grygorii Strashko approached me similar problems so let's
begin with the bindings.

Implementing it in the kernel requires some elaboration and it's
going to be more complicated than this local approach, but it
will be more generic and reusable so that is what we need to do.

Yours,
Linus Walleij

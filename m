From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] gpiolib: fix/clarify gpiod_direction_output comment
Date: Tue, 07 Jan 2014 12:06:00 +0100
Message-ID: <1389092760.4815.18.camel@pizza.hi.pengutronix.de>
References: <1389089274-26861-1-git-send-email-p.zabel@pengutronix.de>
	 <CAAVeFuLVnETMx1b1wav-aSOR3YmjOdpki3HAVcuGTaYJg+wt=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44752 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbaAGLGF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 06:06:05 -0500
In-Reply-To: <CAAVeFuLVnETMx1b1wav-aSOR3YmjOdpki3HAVcuGTaYJg+wt=w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Am Dienstag, den 07.01.2014, 19:39 +0900 schrieb Alexandre Courbot:
> On Tue, Jan 7, 2014 at 7:07 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > This corrects the gpiod_direction_output description comment
> > and adds clarification about the value parameter being a raw
> > value, not taking into account ACTIVE_LOW status.
> 
> Mmm, that's something I must have missed. I'd say
> gpiod_direction_output() should on the contrary honor the ACTIVE_LOW
> flag, and maybe we should also have gpiod_direction_output_raw() to
> allow control of the raw value?

As I just stumbled over this misinterpreting the gpiod_direction_output
value, I'd lean towards yes. Should then gpio_direction_store and
gpio_request_one use gpiod_direction_output_raw?

regards
Philipp


From: Andreas Werner <andy@wernerandy.de>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Thu, 8 Oct 2015 18:55:41 +0200
Message-ID: <20151008165540.GA2850@linux-rrhd.site>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
 <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:49450 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933722AbbJHQzy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 12:55:54 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>

Hi,
i have an additional question regarding the Open Drain setting.

The register is currently impelemented as a read/write register
which means the pin mode is configurable by software to
Push Pull or Open Drain.

There is also the possiblity (normal way) that the HW (FPGA) configures
each pin to the correct mode.

Is there actually a way to set an output mode from userland or by the gpio API?
I did not find anything about that.


If there is no way, i will implement it without software control. I just
read out the mode configuration and handle the pins as PP or Open Drain.

Regards
Andy

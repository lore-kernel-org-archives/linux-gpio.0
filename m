From: Andreas Werner <andy@wernerandy.de>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Thu, 8 Oct 2015 21:49:26 +0200
Message-ID: <20151008194926.GA10709@linux-rrhd.site>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
 <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:49379 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888AbbJHTti (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 15:49:38 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>

Yet another thing.

if i will implement the open drain support, does it really makes sense to go with the
generic gpio lib?

I need to replace the direction_input and direction_outpu functions
because if the userland set an open drain pin to input i need to
set the pin to High-Z (driver "1") instead of setting the input bit
in the direction register.

So at the end there are just the "set" and "dat"
functions used to drive an output and to get an input state.
Alle other functions needs to be implemented in the driver.

Regards
Andy

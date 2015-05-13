From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] gpio: pinctrl: Initialize Armada-XP GPIO/Pinctrl
 drivers at arch_initcall
Date: Wed, 13 May 2015 09:42:12 +0200
Message-ID: <20150513094212.1f68c0fc@free-electrons.com>
References: <1431398382-1894-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
	<20150512091815.62249e70@free-electrons.com>
	<55527EE1.7010008@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:50841 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752454AbbEMHmP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 03:42:15 -0400
In-Reply-To: <55527EE1.7010008@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>

Joshua,

On Tue, 12 May 2015 22:29:54 +0000, Joshua Scott wrote:

> The driver I'm using that requires access to the GPIO pins is one that 
> I've been working on. It doesn't do much, just drives a single reset 
> line to take other hardware out of reset.
> 
> The hardware that gets taken out of reset includes a few i2c GPIO 
> expanders. The GPIO expanders use the gpio-pca953x.c driver, which uses 
> subsys_initcall.
> 
> One of the things that we found strange: With the code the way it 
> currently is, we have access to external GPIO expanders before we were 
> able to access the CPUs own built-in GPIO pins.

To be honest, it is not very clear (at least to me) what is the policy
of the GPIO subsystem in terms of initialization order. Why is this
gpio-pca953x.c driver using subsys_initcall() instead of the regular
module_i2c_driver() call, which is for example used by gpio-adnp.c or
gpio-adp5588.c.

Linus, do you have any comments/suggestions about this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Mon, 9 May 2016 10:02:45 +0300
Message-ID: <20160509070245.GJ15974@lahna.fi.intel.com>
References: <20160506214917.GA1691@pitrat4.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4361 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750879AbcEIHCw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 May 2016 03:02:52 -0400
Content-Disposition: inline
In-Reply-To: <20160506214917.GA1691@pitrat4.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, rebecca.swee.fun.chang@intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 06, 2016 at 10:49:25PM +0100, Colin Pitrat wrote:
> This fixes the issue descirbe in bug 117531. 

Can you include the oops log in the changelog as well?

> It's a regression introduced in linux 4.5 that causes a Oops at load of
> gpio_sch and prevents powering off the computer.
> 
> The patch consist in reverting commit 737c8fccf1c5b2aae3c6d9a66dce17e35fc39b71 
> (a.k.a 'gpio: sch: use gpiochip data pointer') that causes this regression.
> However, although it does work for me, I'm not sure of the impact of reverting
> only this part of the patch.

What happens here is that after the change we expect that
gpiochip_get_data() returns the correct pointer but that only happens
after devm_gpiochip_add_data() is called, which is the last call in
sch_gpio_probe(). Before that we call sch_gpio_reg_set() couple of times
if the device id is PCI_DEVICE_ID_INTEL_SCH_LPC and that causes NULL
pointer dereference.

I think better fix is to make sch_gpio_reg_get() and sch_gpio_reg_set()
take pointer to struct sch_gpio and use that directly like:

static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio,
			     unsigned reg, int val)
{
	...
}

Neither function actually need gc for anything anyway.

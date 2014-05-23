From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [RFC PATCH 2/2] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Fri, 23 May 2014 09:24:01 +0200
Message-ID: <1649245.20X3Z78qme@pcimr>
References: <1883250.Le7v5oGnod@pcimr> <3728352.HA8JhAoUDB@pcimr> <20140522165418.GP22644@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:45478 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbaEWHYG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 May 2014 03:24:06 -0400
In-Reply-To: <20140522165418.GP22644@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

On Thursday 22 May 2014 18:54:18 Gerhard Sittig wrote:
> On Wed, 2014-05-21 at 15:00 +0200, Rojhalat Ibrahim wrote:
> > 
> > This patch adds a set_multiple function to the MPC8xxx GPIO chip driver.
> > It depends on my previous patch "gpiolib: allow simultaneous setting of
>   ^^^^^^^^^^^^^
> 
> This information is relevant to review and pick up, but is not
> appropriate for the commit message (which ends up in the mainline
> repo where the condition does not apply).  I'd suggest to put it
> into the comment section below the dashes line.
> 
> 

Ok. Will do next time.

Thanks
   Rojhalat



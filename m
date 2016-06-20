From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Mon, 20 Jun 2016 10:46:44 +0300
Message-ID: <20160620074644.GU1739@lahna.fi.intel.com>
References: <20160618180458.GA1425@pitrat4.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:38862 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751896AbcFTHqt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 03:46:49 -0400
Content-Disposition: inline
In-Reply-To: <20160618180458.GA1425@pitrat4.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 18, 2016 at 07:05:04PM +0100, Colin Pitrat wrote:
> This fixes the issue descirbe in bug 117531 
> (https://bugzilla.kernel.org/show_bug.cgi?id=117531).
> It's a regression introduced in linux 4.5 that causes a Oops at load of
> gpio_sch and prevents powering off the computer.
> 
> The issue is that sch_gpio_reg_set is called in sch_gpio_probe before
> gpio_chip data is initialized with the pointer to the sch_gpio struct. As
> sch_gpio_reg_set calls gpiochip_get_data, it returns NULL which causes
> the Oops.
> 
> The patch follows Mika's advice (https://lkml.org/lkml/2016/5/9/61) and
> consists in modifying sch_gpio_reg_get and sch_gpio_reg_set to take a
> sch_gpio struct directly instead of a gpio_chip, which avoids the call to
> gpiochip_get_data.
> 
> Thanks Mika for your patience with me :-)
> 
> Signed-off-by: Colin Pitrat <colin.pitrat@gmail.com>

Looks good now, thanks :)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

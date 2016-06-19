From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Sun, 19 Jun 2016 16:02:38 +0900
Message-ID: <CAAVeFuJq1cxcXjHcdLsOW7qNNBHtM0fgQJBSfGy=5j4vVV3Q1Q@mail.gmail.com>
References: <20160618180458.GA1425@pitrat4.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36686 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbcFSHC7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jun 2016 03:02:59 -0400
In-Reply-To: <20160618180458.GA1425@pitrat4.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jun 19, 2016 at 3:05 AM, Colin Pitrat <colin.pitrat@gmail.com> wrote:
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

Besides fixing the issue, avoiding an upcast from gpio_chip in
functions that are not driver hooks seems a good practice to me.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

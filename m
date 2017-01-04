From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 6/6] pinctrl: intel: Add Intel Gemini Lake pin controller support
Date: Thu, 5 Jan 2017 01:18:19 +0200
Message-ID: <CAHp75Ve2svxG1OBDvjmF_GHeD_19gp7+sWF17T_2Ls7J+WWHtg@mail.gmail.com>
References: <20170104153109.28663-1-mika.westerberg@linux.intel.com> <20170104153109.28663-7-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:33379 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S969664AbdADXTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2017 18:19:08 -0500
In-Reply-To: <20170104153109.28663-7-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 4, 2017 at 5:31 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> This driver adds pinctrl/GPIO support for Intel Gemini Lake SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

SoB but no Author line. Perhaps elaborate what this credit for?

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>


> +/*
> + * Intel Gemini Lake SoC pinctrl/GPIO driver
> + *
> + * Copyright (C) 2017 Intel Corporation
> + * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */


-- 
With Best Regards,
Andy Shevchenko

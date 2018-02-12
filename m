From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 16/21] regulator: wm8994: Pass descriptor instead of GPIO
 number
Date: Mon, 12 Feb 2018 14:58:16 +0000
Message-ID: <20180212145816.qy6nbgjb32ldgomz@dell>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-17-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:37430 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932156AbeBLO6V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 09:58:21 -0500
Received: by mail-wr0-f195.google.com with SMTP id k32so9001722wrk.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 06:58:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180212131717.27193-17-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Charles Keepax <ckeepax@opensource.cirrus.com>

On Mon, 12 Feb 2018, Linus Walleij wrote:

> Instead of passing a global GPIO number for the enable GPIO, pass
> a descriptor looked up from the device tree node or the board file
> decriptor table for the regulator.
> 
> There is a single board file passing the GPIOs for LDO1 and LDO2
> through platform data, so augment this to pass descriptors
> associated with the i2c device as well.
> 
> Cc: patches@opensource.cirrus.com
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: this patch is touching the MFD core driver for WM8994,
> but as with all other patches we just change the regulator
> parts. Would be nice if you could ACK it.

Fine, but any sign of a conflict and I'll need a PR.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

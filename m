From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RFT] gpio: tpic2810: Make sure cached buffer has
 consistent status with h/w status
Date: Mon, 28 Mar 2016 12:30:40 +0900
Message-ID: <CAAVeFuJwbdZyO50yx4pV331=fa7iYV0PFXWHz9yxoxPJzXyH+w@mail.gmail.com>
References: <1458733781.22226.3.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:34458 "EHLO
	mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753508AbcC1DbA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 23:31:00 -0400
Received: by mail-io0-f177.google.com with SMTP id e3so51028324ioa.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2016 20:31:00 -0700 (PDT)
In-Reply-To: <1458733781.22226.3.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Andrew F. Davis" <afd@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 23, 2016 at 8:49 PM, Axel Lin <axel.lin@ingics.com> wrote:
> i2c_smbus_write_byte_data() can fail. To ensure the cached buffer has
> consistent status with h/w status, don't update the cached gpio->buffer
> if write fails.
> Also refactor the code a bit by adding a tpic2810_set_mask_bits() helper
> and use it to simplify the code.

Looks pretty good!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

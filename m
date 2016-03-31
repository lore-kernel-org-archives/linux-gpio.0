From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT] gpio: tpic2810: Make sure cached buffer has
 consistent status with h/w status
Date: Thu, 31 Mar 2016 15:14:31 +0200
Message-ID: <CACRpkdZUBKgq79X=Tc63jBGbHyrOXgEuH_mmBfLKYM3YPqs0OQ@mail.gmail.com>
References: <1458733781.22226.3.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34413 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751654AbcCaNOc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:14:32 -0400
Received: by mail-ob0-f170.google.com with SMTP id kf9so97623139obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:14:31 -0700 (PDT)
In-Reply-To: <1458733781.22226.3.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 23, 2016 at 12:49 PM, Axel Lin <axel.lin@ingics.com> wrote:

> i2c_smbus_write_byte_data() can fail. To ensure the cached buffer has
> consistent status with h/w status, don't update the cached gpio->buffer
> if write fails.
> Also refactor the code a bit by adding a tpic2810_set_mask_bits() helper
> and use it to simplify the code.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Alexandre's review tag.

Yours,
Linus Walleij

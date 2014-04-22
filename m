From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: zevio: Get correct gpio output value
Date: Tue, 22 Apr 2014 14:29:19 +0200
Message-ID: <CACRpkdbFMPLbTfbUHMOX-GDZFAN3xGooy58evn+KEowUoHDn3Q@mail.gmail.com>
References: <1396915179.4729.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:47876 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932415AbaDVM3U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 08:29:20 -0400
Received: by mail-oa0-f46.google.com with SMTP id m1so3636858oag.33
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 05:29:19 -0700 (PDT)
In-Reply-To: <1396915179.4729.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>, Fabian Vogt <fabian@ritter-vogt.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 8, 2014 at 1:59 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Read gpio output value from ZEVIO_GPIO_OUTPUT.
> The spin_lock is required to ensure the direction is not changed before reading
> input/ouput value.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

OK out of patience waiting for ACKs, v2 patch applied.

Yours,
Linus Walleij

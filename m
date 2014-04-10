From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: zevio: Get correct gpio output value
Date: Thu, 10 Apr 2014 19:56:26 +0200
Message-ID: <CACRpkdaxvE_TuHAUH1HHcNFkbHRaN=adPSHhU-SFRv90UhsLUg@mail.gmail.com>
References: <1396915179.4729.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:52207 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932804AbaDJR41 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 13:56:27 -0400
Received: by mail-oa0-f49.google.com with SMTP id o6so4805169oag.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 10:56:27 -0700 (PDT)
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

Waiting for an ACK in this v2 version.

Should it be tagged for stable even?

Yours,
Linus Walleij

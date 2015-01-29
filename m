From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: tz1090-pdc: Use resource_size to fix
 off-by-one resource size calculation
Date: Thu, 29 Jan 2015 10:36:37 +0100
Message-ID: <CACRpkdZkJpxLUnWC-23NGhoRuEaM=9iJke=Wd46YLdFoOTDGEg@mail.gmail.com>
References: <1421805121.9831.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35513 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753477AbbA2Jgj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jan 2015 04:36:39 -0500
Received: by mail-lb0-f181.google.com with SMTP id u10so26008541lbd.12
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2015 01:36:38 -0800 (PST)
In-Reply-To: <1421805121.9831.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 21, 2015 at 2:52 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Acked-by: James Hogan <james.hogan@imgtec.com>
> ---
> Hi Linus,
> Seems this one was missed.

Ooops. Patch applied.

Yours,
Linus Walleij

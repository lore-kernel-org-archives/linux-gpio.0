From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pca953x: return IRQ_NONE when appropriate
Date: Fri, 9 May 2014 12:57:29 +0200
Message-ID: <CACRpkdZ-reqv=cbfqKcJA5VgCAiUDqTQH+hDoryT0tBiLobsbg@mail.gmail.com>
References: <cover.1398844809.git.toby@tismith.id.au>
	<5ca82b7dd4c17ea358a1ea30bb34a3e31828b2b2.1398844809.git.toby@tismith.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:34519 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755919AbaEIK5a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 06:57:30 -0400
Received: by mail-oa0-f48.google.com with SMTP id i4so4626935oah.21
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 03:57:29 -0700 (PDT)
In-Reply-To: <5ca82b7dd4c17ea358a1ea30bb34a3e31828b2b2.1398844809.git.toby@tismith.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, Graeme Smecher <gsmecher@threespeedlogic.com>, Andrew Ruder <andy@aeruder.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Wed, Apr 30, 2014 at 10:01 AM, Toby Smith <toby@tismith.id.au> wrote:

> The irq handler should return IRQ_NONE or IRQ_HANDLED to report
> if we have handled the interrupt.
>
> Signed-off-by: Toby Smith <toby@tismith.id.au>

Patch applied.

Adding some randon pca953x developers to the thread so noone gets
upset.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pca953x: Add support for TI PCA9536
Date: Thu, 26 May 2016 10:42:44 +0200
Message-ID: <CACRpkdbTC6R4Yevdo-GC+EVyrAw_v3wzSA89gUfKSkv50CskOg@mail.gmail.com>
References: <1463640450-16762-1-git-send-email-vigneshr@ti.com>
	<1463640450-16762-2-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34473 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908AbcEZImp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2016 04:42:45 -0400
Received: by mail-oi0-f54.google.com with SMTP id b65so113970605oia.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2016 01:42:45 -0700 (PDT)
In-Reply-To: <1463640450-16762-2-git-send-email-vigneshr@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, May 19, 2016 at 8:47 AM, Vignesh R <vigneshr@ti.com> wrote:

> TI PCA9536 is 4-Bit I2C GPIO expander without interrupt support[1].
> Add support for the same.
>
> [1] TRM: http://www.ti.com/lit/ds/symlink/pca9536.pdf
>
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij

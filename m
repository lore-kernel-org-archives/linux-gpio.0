From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: GPIO: Add generic serializer binding
Date: Tue, 15 Mar 2016 09:55:54 +0100
Message-ID: <CACRpkdZ8RyMMsTJvUDFk3KPFE_=4pnXWs1O_XjQE+dR+ibWMuQ@mail.gmail.com>
References: <1457117924-7014-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35693 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964989AbcCOIzz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 04:55:55 -0400
Received: by mail-ob0-f172.google.com with SMTP id fp4so10377919obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2016 01:55:54 -0700 (PDT)
In-Reply-To: <1457117924-7014-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 4, 2016 at 7:58 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add binding for generic parallel-in/serial-out shift register devices
> used as GPIO.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> The driver was taken but it looks like this might have been lost,
> anyway I've added a dual-string example as requested.

Ah I missed it, mea culpa.

Patch applied, I edited the ngpios text a bit to reflect that this
signifies that you use 0..n-1 offsets.

Yours,
Linus Walleij

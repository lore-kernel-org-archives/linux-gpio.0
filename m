From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: mcp23s08 update binding doc
Date: Wed, 11 Oct 2017 10:03:10 +0200
Message-ID: <CACRpkdYBR3L8s-_vXo+dj372yeHKhauAK=wVfJTUtjnAM_89Ng@mail.gmail.com>
References: <20171009120300.18251-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:43507 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757126AbdJKIDL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 04:03:11 -0400
Received: by mail-it0-f44.google.com with SMTP id k70so9934262itk.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 01:03:11 -0700 (PDT)
In-Reply-To: <20171009120300.18251-1-poeschel@lemonage.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

On Mon, Oct 9, 2017 at 2:03 PM, Lars Poeschel <poeschel@lemonage.de> wrote:

> The mcp23s08 driver moved to pinctrl recently. It accepts the
> bias-pull-up pinctrl property since then. This updates the binding
> doc to reflect that.
> Thanks to Sebastian Reichel for the working example.
>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Patch applied.

Yours,
Linus Walleij

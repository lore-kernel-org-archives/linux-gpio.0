From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 1/2] pinctrl: Add Pistachio SoC pin control binding document
Date: Wed, 6 May 2015 08:35:36 +0200
Message-ID: <CACRpkdbW8WNYy56U-KmsZPatQBFO8xSYAJV8R9BwsPMXnQzbwQ@mail.gmail.com>
References: <1430269982-24129-1-git-send-email-abrestic@chromium.org>
	<1430269982-24129-2-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33130 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbbEFGfg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 02:35:36 -0400
Received: by oica37 with SMTP id a37so379010oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2015 23:35:36 -0700 (PDT)
In-Reply-To: <1430269982-24129-2-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On Wed, Apr 29, 2015 at 3:13 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

> Add a device-tree binding document for the pin controller present
> on the IMG Pistachio SoC.
>
> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> ---
> No changes from v2/v3.
> Changes from v1:
>  - Change compatible string to "img,pistachio-system-pinctrl".
>  - Specify GPIO sub-node names rather than forcing the nodes to be in order.

This binding looks nice.

Patch applied.

Yours,
Linus Walleij

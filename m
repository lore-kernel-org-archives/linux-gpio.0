From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: gpio-vf610: add imx7ulp support
Date: Tue, 1 Aug 2017 14:01:05 +0200
Message-ID: <CACRpkdbc6X7HNdJ3FJN7n6P1Uf3_006EjCDSaJ9Ekua-m_2eow@mail.gmail.com>
References: <1500990438-3894-1-git-send-email-aisheng.dong@nxp.com> <1500990438-3894-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36664 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdHAMBH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 08:01:07 -0400
Received: by mail-it0-f46.google.com with SMTP id 77so6633014itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 05:01:07 -0700 (PDT)
In-Reply-To: <1500990438-3894-2-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Peter Chen <peter.chen@nxp.com>, Dong Aisheng <dongas86@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 25, 2017 at 3:47 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
> on MX7ULP is similar to GPIO on Vibrid, except it has an extra
> Port Data Direction Register (PDDR) used to configure the individual
> port pins for input or output.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Uncontroversial compatible update so patch applied.

Yours,
Linus Walleij

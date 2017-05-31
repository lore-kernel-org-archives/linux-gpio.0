From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: stm32: set pin to gpio input when used as interrupt
Date: Wed, 31 May 2017 02:05:12 +0200
Message-ID: <CACRpkdbp1tbBhhd+ttBYApB0dOKx_N3U42cEb6r7wgVLJdRoyw@mail.gmail.com>
References: <1496074653-2941-1-git-send-email-alexandre.torgue@st.com> <1496074653-2941-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:35449 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbdEaAFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 20:05:14 -0400
Received: by mail-it0-f52.google.com with SMTP id f72so4923184ite.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 17:05:14 -0700 (PDT)
In-Reply-To: <1496074653-2941-2-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Mon, May 29, 2017 at 6:17 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> This patch ensures that pin is correctly set as gpio input when it is used
> as an interrupt.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Nice!

Patch applied.

Yours,
Linus Walleij

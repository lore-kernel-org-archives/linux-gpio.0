From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: stm32: replace device_initcall() with arch_initcall()
Date: Mon, 24 Apr 2017 14:22:23 +0200
Message-ID: <CACRpkdaVeoi-U9Ra9PPASpKsSyd2AC+vfB5wOobu8ur0oPEswg@mail.gmail.com>
References: <1491577811-26989-1-git-send-email-alexandre.torgue@st.com> <1491577811-26989-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37722 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1169704AbdDXMW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 08:22:26 -0400
Received: by mail-it0-f47.google.com with SMTP id x188so52521620itb.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 05:22:25 -0700 (PDT)
In-Reply-To: <1491577811-26989-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, Apr 7, 2017 at 5:10 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> Pinctrl has to be registered earlier. Mainly to register bank irqdomain
> earlier as other devices could use interrupts from those irqdomain.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Yeah I also see that a lot. I guess workarounds like this is
necessary.

Patch applied.

Yours,
Linus Walleij

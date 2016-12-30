From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: activate strict mux mode
Date: Fri, 30 Dec 2016 09:07:30 +0100
Message-ID: <CACRpkdaNTk27t40K=q95Pqk0gv_dt2N3MF6_FsAu7vdb9uHnig@mail.gmail.com>
References: <1481725456-1030-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:35858 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbcL3IHb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:07:31 -0500
Received: by mail-qt0-f174.google.com with SMTP id k15so150828312qtg.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:07:31 -0800 (PST)
In-Reply-To: <1481725456-1030-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Patrice Chotard <patrice.chotard@st.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 14, 2016 at 3:24 PM,  <gabriel.fernandez@st.com> wrote:

> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This activates strict mode muxing for the STM32 pin controllers,
> as these do not allow GPIO and functions to use the same pin
> simultaneously.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>

Patch applied with Patrice's ACK.

Yours,
Linus Walleij

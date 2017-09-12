From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sprd: Restrict PINCTRL_SPRD to ARCH_SPRD or COMPILE_TEST
Date: Tue, 12 Sep 2017 11:21:49 +0200
Message-ID: <CACRpkdYErV7knMmRdaD0rbAxC0_GAd1q_ty+JLDgCN8yiSRzbQ@mail.gmail.com>
References: <1504714085-17731-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:45882 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751214AbdILJVu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 05:21:50 -0400
Received: by mail-it0-f53.google.com with SMTP id v19so21738814ite.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2017 02:21:50 -0700 (PDT)
In-Reply-To: <1504714085-17731-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 6, 2017 at 6:08 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Spreadtrum pinctrl drivers are only useful when building for a
> Spreadtrum platform.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> On top of Arnd's:
>   - pinctrl: sprd: add missing Kconfig dependency
>   - pinctrl: sprd: add CONFIG_OF dependency

Fuzzed on top of Randy's patch and applied.

Yours,
Linus Walleij

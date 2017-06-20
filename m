From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: lp87565: Add support for GPIO
Date: Tue, 20 Jun 2017 13:37:19 +0200
Message-ID: <CACRpkdYg1bEve=m=XNOUY=DHEy8M9Pk0dMEEs67UkVskvOZaUg@mail.gmail.com>
References: <1497508391-2806-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33395 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbdFTLhV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 07:37:21 -0400
Received: by mail-io0-f174.google.com with SMTP id t87so82639502ioe.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 04:37:21 -0700 (PDT)
In-Reply-To: <1497508391-2806-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>

On Thu, Jun 15, 2017 at 8:33 AM, Keerthy <j-keerthy@ti.com> wrote:

> Add driver for lp87565 PMIC family GPIOs. Three GPIOs are supported
> and can be configured in Open-drain output or Push-pull output.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>
> Latest version of mfd patch:
>
> https://patchwork.kernel.org/patch/9783079/
>
> Changes in v2:

Patch applied, thanks for your nice work on this driver!

Yours,
Linus Walleij

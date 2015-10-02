From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio/pca953x: Add TI TCA9539 support
Date: Fri, 2 Oct 2015 14:56:56 -0700
Message-ID: <CACRpkdbc=2u0fzbyCEFD+fcGDx2hDMSCByeD3vguWss=xT52fA@mail.gmail.com>
References: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
	<1443524144-14847-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35741 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429AbbJBV45 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 17:56:57 -0400
Received: by obbzf10 with SMTP id zf10so92188493obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 14:56:56 -0700 (PDT)
In-Reply-To: <1443524144-14847-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 29, 2015 at 3:55 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The TCA9539 is almost identical to the PCA9555 and software-compatible
> with this driver. It exposes 16 general purpose I/O pins in two 8-bit
> configurations.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - update device tree binding documentation

Patch applied.

Yours,
Linus Walleij

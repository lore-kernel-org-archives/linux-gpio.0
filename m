From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Remove unneeded irq_group field
Date: Wed, 2 Aug 2017 14:21:04 +0200
Message-ID: <CACRpkdb2MxfUL-zZZM6u3htr4xPiQw8uM9yOhFHW+e30qhM9dg@mail.gmail.com>
References: <20170720165912.14360-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36642 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753077AbdHBMVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:21:06 -0400
Received: by mail-it0-f48.google.com with SMTP id 77so22799736itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 05:21:05 -0700 (PDT)
In-Reply-To: <20170720165912.14360-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>

On Thu, Jul 20, 2017 at 6:59 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The irq_group field stores a 1:1 mapping. Use the loop variable to
> derive the values instead of storing them in an extra array.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied with Eric's review tag.

Yours,
Linus Walleij

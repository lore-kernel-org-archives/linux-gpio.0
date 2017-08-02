From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: tegra: Use platform_irq_count()
Date: Wed, 2 Aug 2017 14:02:17 +0200
Message-ID: <CACRpkdbeR2+SJXJv-j1_C5bNnc-w5-ebkR_vQ7c=eh-whDrwVQ@mail.gmail.com>
References: <20170720160057.13483-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:33990 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753108AbdHBMCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:02:19 -0400
Received: by mail-io0-f175.google.com with SMTP id o9so19610223iod.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 05:02:19 -0700 (PDT)
In-Reply-To: <20170720160057.13483-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>

On Thu, Jul 20, 2017 at 6:00 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Use platform_irq_count() instead of open-coding the same code sequence.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij

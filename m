From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: tegra: Remove unnecessary check
Date: Wed, 2 Aug 2017 14:15:40 +0200
Message-ID: <CACRpkdZbgpcS-1sRdj9wZnv40UeGXO52-os4=zVyQpA1fTDptw@mail.gmail.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:35256 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753102AbdHBMPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:15:41 -0400
Received: by mail-it0-f48.google.com with SMTP id h199so22745424ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 05:15:41 -0700 (PDT)
In-Reply-To: <20170724145508.7388-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 24, 2017 at 4:55 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> of_device_get_match_data() can never return NULL, therefore the check
> for NULL values is unnecessary.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied with Jon's ACK.

Yours,
Linus Walleij

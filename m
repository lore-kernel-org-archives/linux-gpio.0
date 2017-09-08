From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgene-sb: Tidy up fwnode usage
Date: Fri, 8 Sep 2017 14:54:20 +0200
Message-ID: <CACRpkdbdL5OrfWAJyrC_BCmfTWJC=r4oGzzssmCPt96b_Q=Agg@mail.gmail.com>
References: <2ccfa46003fb5cf5970dc5cd8771953d375fed77.1503594687.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35698 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755119AbdIHMyV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2017 08:54:21 -0400
Received: by mail-oi0-f54.google.com with SMTP id z73so10928524oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Sep 2017 05:54:20 -0700 (PDT)
In-Reply-To: <2ccfa46003fb5cf5970dc5cd8771953d375fed77.1503594687.git.robin.murphy@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Y Vo <yvo@apm.com>, Quan Nguyen <qnguyen@apm.com>

On Thu, Aug 24, 2017 at 7:24 PM, Robin Murphy <robin.murphy@arm.com> wrote:

> Since f94277af03ea ("of/platform: Initialise dev->fwnode appropriately"),
> of_platform_device_create() already initialises dev->fwnode to that of
> the appropriate device_node, so within the driver we shouldn't need to
> care whether we probed via DT or ACPI.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>
> Not tested, just an opportunity I happened to spot whilst looking
> at something else.

No replies so applied for v4.15 (next merge window).

Yours,
Linus Walleij

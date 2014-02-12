From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpio/omap: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 13:24:38 +0900
Message-ID: <CAAVeFuJCdo1wjQx0_7DgD3Ax2wweYgESVGCbmP9MXBCAZr6rJw@mail.gmail.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:53384 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751108AbaBLEY6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2014 23:24:58 -0500
Received: by mail-vc0-f169.google.com with SMTP id hq11so6643410vcb.14
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2014 20:24:58 -0800 (PST)
In-Reply-To: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>

On Wed, Feb 12, 2014 at 11:51 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because the value is checked by devm_ioremap_resource().
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Got to like it when code becomes simpler.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

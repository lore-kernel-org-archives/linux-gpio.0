From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: x-gene: fix devm_ioremap_resource() check
Date: Tue, 7 Apr 2015 11:47:39 +0200
Message-ID: <CACRpkdYVVLzGBL1wPopT298ce246YK6P+sL=srxAwUSP=_OejQ@mail.gmail.com>
References: <1427596640-13319-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:35331 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbbDGJrk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:47:40 -0400
Received: by ierf6 with SMTP id f6so41707646ier.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:47:39 -0700 (PDT)
In-Reply-To: <1427596640-13319-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 29, 2015 at 4:37 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> devm_ioremap_resource() returns IOMEM_ERR_PTR() and it never
> returns NULL, fix the check to prevent access to invalid
> virtual address.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied.

Yours,
Linus Walleij

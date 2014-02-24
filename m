From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pl061: Use devm_ioremap_resource()
Date: Mon, 24 Feb 2014 13:16:08 +0100
Message-ID: <CACRpkdZj3vMnvWA1-Byq2nYwsaVtM4CBz=XcEskGO6FM=oe0ZQ@mail.gmail.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
	<000101cf279d$acf1f300$06d5d900$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:58945 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752140AbaBXMQJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 07:16:09 -0500
Received: by mail-oa0-f53.google.com with SMTP id o6so1809209oag.26
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 04:16:09 -0800 (PST)
In-Reply-To: <000101cf279d$acf1f300$06d5d900$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Haojian Zhuang <haojian.zhuang@linaro.org>

On Wed, Feb 12, 2014 at 3:53 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use devm_ioremap_resource() in order to make the code simpler.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

I rebased this with some manual intervention and applied, thanks!

Yours,
Linus Walleij

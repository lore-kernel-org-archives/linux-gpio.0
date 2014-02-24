From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio/omap: Use devm_ioremap_resource()
Date: Mon, 24 Feb 2014 14:45:42 +0100
Message-ID: <CACRpkdaqf7K4yO-GSGiFRZ13XvmKsdAqMhqwM7S92_qUE6SGjg@mail.gmail.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:50059 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbaBXNpo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 08:45:44 -0500
Received: by mail-ob0-f169.google.com with SMTP id wn1so1972067obc.14
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 05:45:42 -0800 (PST)
In-Reply-To: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>

On Wed, Feb 12, 2014 at 3:51 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because the value is checked by devm_ioremap_resource().
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied with all ACKs.

Yours,
Linus Walleij

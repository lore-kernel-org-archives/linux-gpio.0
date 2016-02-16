From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: add devm_ apis for gpio_chip_add and remove
Date: Tue, 16 Feb 2016 16:03:26 +0100
Message-ID: <CACRpkdYGS1DogPDnY87HsN2PzDVHw-h6Y15Gv8qhLzgKrkMJtQ@mail.gmail.com>
References: <1455542246-16761-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34757 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932880AbcBPPDz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:03:55 -0500
Received: by mail-ob0-f174.google.com with SMTP id wb13so262839990obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 07:03:55 -0800 (PST)
In-Reply-To: <1455542246-16761-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 15, 2016 at 2:17 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Add device managed APIs devm_gpiochip_add_data() and
> devm_gpiochip_remove() for the APIs gpiochip_add_data()
> and gpiochip_remove().
>
> This helps in reducing code in error path and sometimes
> removal of .remove callback for driver unbind.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

I like the looks of this.

One comment: you must also patch
Documentation/driver-model/devres.txt

Will you also follow up with a massive patch set making use of
this new API? I feel bad about merging an API if it's not used.

Thanks for only supporting this for the new _data() function.

Yours,
Linus Walleij

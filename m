From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: fix "gpio-line-names" property retrieval
Date: Wed, 20 Dec 2017 09:21:01 +0100
Message-ID: <CACRpkda3-E2eZpgtPUx6tK9SEEDwYnCNjvCb9aUhpF1BfseDZg@mail.gmail.com>
References: <20171215140233.804E768968@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:38520 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753760AbdLTIVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 03:21:02 -0500
Received: by mail-io0-f194.google.com with SMTP id 87so12273346ior.5
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 00:21:02 -0800 (PST)
In-Reply-To: <20171215140233.804E768968@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, stable <stable@vger.kernel.org>

On Fri, Dec 15, 2017 at 3:02 PM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> Following commit 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
> to use device property accessors"), "gpio-line-names" DT property is
> not retrieved anymore when chip->parent is not set by the driver.
> This is due to OF based property reads having been replaced by device
> based property reads.
>
> This patch fixes that by making use of
> fwnode_property_read_string_array() instead of
> device_property_read_string_array() and handing over either
> of_fwnode_handle(chip->of_node) or dev_fwnode(chip->parent)
> to that function.
>
> Fixes: 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names() to use device property accessors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

This v2 patch applied with Mika's ACK.

Yours,
Linus Walleij

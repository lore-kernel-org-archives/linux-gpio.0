From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix aspeed_gpio_banks array size check
Date: Thu, 28 Dec 2017 13:53:27 +0100
Message-ID: <CACRpkdas9VK2rUJ699GYrA6ETC-eZhnNcHCLYcnFBKk5Vgf9bw@mail.gmail.com>
References: <1513871710-13765-1-git-send-email-gomonovych@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36373 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751411AbdL1Mx2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Dec 2017 07:53:28 -0500
Received: by mail-io0-f173.google.com with SMTP id i143so18147332ioa.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2017 04:53:28 -0800 (PST)
In-Reply-To: <1513871710-13765-1-git-send-email-gomonovych@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vasyl Gomonovych <gomonovych@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 21, 2017 at 4:55 PM, Vasyl Gomonovych <gomonovych@gmail.com> wrote:

> The test should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().
>
> Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>

Patch applied.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: davinci: Add the missing of-node pointer in the
 irq_domain_add_legacy function call
Date: Wed, 10 Feb 2016 11:00:01 +0100
Message-ID: <CACRpkdaO+SmOTFNkcte+ByUeiU+zk7+7xONX_27oYvRjCkt-8g@mail.gmail.com>
References: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
	<1453988331-17111-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34789 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757267AbcBJKAB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 05:00:01 -0500
Received: by mail-ob0-f177.google.com with SMTP id wb13so20185472obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 02:00:01 -0800 (PST)
In-Reply-To: <1453988331-17111-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>

On Thu, Jan 28, 2016 at 2:38 PM, Keerthy <j-keerthy@ti.com> wrote:

> Currently the first parameter of irq_domain_add_legacy is NULL.
> irq_find_host function returns NULL when we do not populate the of_node
> and hence irq_of_parse_and_map call fails whenever we want to request a
> gpio irq. This fixes the request_irq failures for gpio interrupts.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied for fixes with Grygorii's review tag.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pca935x: fix of-only probed devices
Date: Wed, 9 Dec 2015 08:07:23 +0100
Message-ID: <CACRpkdZ-sAW6tJKa_6hiBgd==X-AbqxdTmmsnBYiJYaJ2r6uaw@mail.gmail.com>
References: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
	<1449569966-16816-3-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35081 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862AbbLIHHY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 02:07:24 -0500
Received: by oige206 with SMTP id e206so22211960oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2015 23:07:23 -0800 (PST)
In-Reply-To: <1449569966-16816-3-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Dec 8, 2015 at 11:19 AM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> If the pca953x device is probed from OF using the proper OF probing then
> the i2c-client will be NULL and the device probe will fail as id is NULL
> and it isn't an ACPI device (previous drivers would simply OOPS out).
>
> Add support for the of_device_id table having the same data as the others
> so that the correct paths will be taken when registering a device.
>
> An example of current valid of node which did not work:
>
>         gpio@38 {
>                 compatible = "onsemi,pca9654", "nxp,pca9534";
>                 reg = <0x38>;
>                 interrupt-parent = <&gpio5>;
>                 interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
>         };
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Patch applied.

Yours,
Linus Walleij

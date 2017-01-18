From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 4/5] pinctrl: mvebu: switch drivers to generic simple mmio
Date: Wed, 18 Jan 2017 09:57:20 +0100
Message-ID: <CACRpkdZCkZCV6F1XakGwB8Udz98r0svKW6eepZ5n79cP1SDubA@mail.gmail.com>
References: <20170113110240.GA29164@n2100.armlinux.org.uk> <E1cRzdq-0002Yl-Lv@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:33344 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751312AbdARI5W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 03:57:22 -0500
Received: by mail-qk0-f178.google.com with SMTP id s140so6585862qke.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 00:57:21 -0800 (PST)
In-Reply-To: <E1cRzdq-0002Yl-Lv@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 13, 2017 at 12:03 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> Move the mvebu pinctrl drivers over to the generic simple mmio
> implementation, saving a substantial number of lines of code in
> the process.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Very nice patch applied.

Yours,
Linus Walleij

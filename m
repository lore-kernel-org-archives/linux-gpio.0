From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 1/5] pinctrl: mvebu: constify mvebu_mpp_ctrl structures
Date: Wed, 18 Jan 2017 09:53:57 +0100
Message-ID: <CACRpkdYuWsK=AVh8QEe8f9gJEmB++G39y8RJ4FWD+7QtSD1d2w@mail.gmail.com>
References: <20170113110240.GA29164@n2100.armlinux.org.uk> <E1cRzdb-0002YP-8q@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:33174 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751859AbdARIx6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 03:53:58 -0500
Received: by mail-qt0-f179.google.com with SMTP id v23so5730935qtb.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 00:53:57 -0800 (PST)
In-Reply-To: <E1cRzdb-0002YP-8q@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 13, 2017 at 12:03 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> As the mvebu_mpp_ctrl structures contain function pointers, it is
> preferable for these to be made read-only to prevent the function
> pointers being modified.  So make these const.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Patch applied.

Yours,
Linus Walleij

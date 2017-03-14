From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ti: The IODelay driver is a DRA7xxx feature so
 depend on that SoC
Date: Tue, 14 Mar 2017 16:05:26 +0100
Message-ID: <CACRpkdawVCHcTbXqOa3DTOUn-xbdBX6HhWkub+8Vh9uU38fzww@mail.gmail.com>
References: <20170302174636.6662-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:36766 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752985AbdCNPF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 11:05:28 -0400
Received: by mail-io0-f182.google.com with SMTP id l7so1120610ioe.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 08:05:27 -0700 (PDT)
In-Reply-To: <20170302174636.6662-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 2, 2017 at 6:46 PM, Peter Robinson <pbrobinson@gmail.com> wrote:

> As the IODelay driver is a hardware feature of the  DRA7xxx SoC
> depend on that SoC and compile test.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Patch applied for fixes with Tony's ACK.

Yours,
Linus Walleij

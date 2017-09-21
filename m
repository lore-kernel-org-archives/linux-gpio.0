From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: tb10x: Handle return value of devm_kasprintf
Date: Thu, 21 Sep 2017 14:14:38 +0200
Message-ID: <CACRpkdbWvi6La21jND3qy=h9fZMfr-d6ZY343ceTvNeD24D-Aw@mail.gmail.com>
References: <1505891589-6632-1-git-send-email-arvind.yadav.cs@gmail.com> <1505891589-6632-3-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:53107 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbdIUMOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 08:14:39 -0400
Received: by mail-io0-f181.google.com with SMTP id i197so10284488ioe.9
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 05:14:39 -0700 (PDT)
In-Reply-To: <1505891589-6632-3-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 20, 2017 at 9:13 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> devm_kasprintf() can fail here and we must check its return value.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Patch applied.

Yours,
Linus Walleij

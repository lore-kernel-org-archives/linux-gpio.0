From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: brcmstb: Handle return value of devm_kasprintf
Date: Thu, 21 Sep 2017 14:13:41 +0200
Message-ID: <CACRpkdaXfVJrYcG12RPA-RHU+72X4quNOCL7M2Ppb-P8Tw=Pwg@mail.gmail.com>
References: <1cfed20c00d642a34d8f93c5e9591412d387fa2a.1505970542.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:47602 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbdIUMNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 08:13:42 -0400
Received: by mail-it0-f46.google.com with SMTP id 85so379456ith.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 05:13:42 -0700 (PDT)
In-Reply-To: <1cfed20c00d642a34d8f93c5e9591412d387fa2a.1505970542.git.arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 21, 2017 at 7:14 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> devm_kasprintf() can fail here and we must check its return value.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
> changes in v2 :
>                 Set return 'err' to -ENOMEM.

Patch applied.

Yours,
Linus Walleij

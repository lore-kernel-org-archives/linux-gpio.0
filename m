From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Configure GPIO register using BIOS settings
Date: Tue, 13 Sep 2016 10:24:33 +0200
Message-ID: <CACRpkdZCOJaJ-mLmxf0rdoDFVPu6+9Fay338+rSFa7iVnERdoA@mail.gmail.com>
References: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35661 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756048AbcIMIYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:24:34 -0400
Received: by mail-oi0-f51.google.com with SMTP id d191so154366620oih.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:24:34 -0700 (PDT)
In-Reply-To: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Cc: "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 9, 2016 at 5:18 PM, Agrawal, Nitesh-kumar
<Nitesh-kumar.Agrawal@amd.com> wrote:

> In the function amd_gpio_irq_set_type, use the settings provided by
> the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to configure
> the GPIO registers. Ignore the settings from client.
>
> Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>

Thanks! It turns out I left a partly resolved commit in the tree
so applied parts of this patch as a fixup.

Sorry for my screw-ups.

Yours,
Linus Walleij

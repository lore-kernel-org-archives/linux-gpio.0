From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Tue, 8 Nov 2016 10:41:49 +0100
Message-ID: <CACRpkdbLPKYjQg=X4XBa3Jy5UETygiMu=qJQ-=XJJ5g59x7=ng@mail.gmail.com>
References: <MWHPR12MB1357A3E7488C15C8E6E6BE45A0A20@MWHPR12MB1357.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:36243 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752558AbcKHJlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 04:41:50 -0500
Received: by mail-qk0-f174.google.com with SMTP id n21so98733571qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 01:41:50 -0800 (PST)
In-Reply-To: <MWHPR12MB1357A3E7488C15C8E6E6BE45A0A20@MWHPR12MB1357.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, "Wang, Annie" <annie.wang@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

On Fri, Nov 4, 2016 at 4:46 AM, Shah, Nehal-bakulchandra
<Nehal-bakulchandra.Shah@amd.com> wrote:

> This patch provides support for additional GPIO devices and also provides IRQ sharing for AMD's GPIO devices and set
> IRQCHIP_SKIP_SET_WAKE flag.
>
> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

Patch applied.

Every time there is a patch to the AMD driver it comes from a new
person inside AMD, how do you actually manage this? It is better
for building trust in the long run if a person steps up as maintainer
and take a bit of long term responsibility.

Yours,
Linus Walleij

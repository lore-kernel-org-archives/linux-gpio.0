From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Remove the default de-bounce time
Date: Thu, 4 Aug 2016 10:51:30 +0200
Message-ID: <CACRpkdaWNYRjGEg2=T14++SetcwU9CTG4YmcrdB7fX087D7YWw@mail.gmail.com>
References: <CY1PR12MB0042DD8942D0CC3A19FA01B4DC040@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33304 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754097AbcHDIwm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2016 04:52:42 -0400
Received: by mail-oi0-f47.google.com with SMTP id j185so313433524oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2016 01:51:31 -0700 (PDT)
In-Reply-To: <CY1PR12MB0042DD8942D0CC3A19FA01B4DC040@CY1PR12MB0042.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Cc: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Xue, Ken" <Ken.Xue@amd.com>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 1, 2016 at 8:38 AM, Agrawal, Nitesh-kumar
<Nitesh-kumar.Agrawal@amd.com> wrote:

> In the function amd_gpio_irq_enable and amd_gpio_direction_input, remove the code which is setting the default de-bounce time to 2.75ms.
>
> The driver code shall use the same settings as specified in BIOS.
> Any default assignment impacts TouchPad behaviour when the LevelTrig is set to EDGE FALLING.
>
> Reviewed-by:  Ken Xue <Ken.Xue@amd.com>
> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>

Patch applied for fixes and tagged for stable.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: don't depend on CONFIG_ARM
Date: Wed, 6 Nov 2013 10:42:13 +0100
Message-ID: <CACRpkdZbVAyd9FRr39xLVVp4bmKmkGL=AUUB=sF+wSksdLcnGw@mail.gmail.com>
References: <1383708422-20374-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:47663 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755961Ab3KFJmN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2013 04:42:13 -0500
Received: by mail-oa0-f42.google.com with SMTP id l6so1912226oag.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2013 01:42:13 -0800 (PST)
In-Reply-To: <1383708422-20374-1-git-send-email-robherring2@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 6, 2013 at 4:27 AM, Rob Herring <robherring2@gmail.com> wrote:

> From: Rob Herring <rob.herring@calxeda.com>
>
> The pl061 driver has no real dependency on ARM, so remove the kconfig
> dependency.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied. Let's throw it at the autobuilder and see what
happens :-)

Yours,
Linus Walleij

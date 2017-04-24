From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: DT bindings, move tca9554 from pcf857x to pca953x
Date: Mon, 24 Apr 2017 18:31:23 +0200
Message-ID: <CACRpkdYeML4D6evQZ+H4H5XeSE6MdJLRKy7RQ=d7dO13bb_QZQ@mail.gmail.com>
References: <20170421124631.19269-1-anders@chargestorm.se> <20170421124631.19269-2-anders@chargestorm.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:32956 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S972782AbdDXQbZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 12:31:25 -0400
Received: by mail-oi0-f47.google.com with SMTP id y11so109064492oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 09:31:25 -0700 (PDT)
In-Reply-To: <20170421124631.19269-2-anders@chargestorm.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anders Darander <anders@chargestorm.se>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

On Fri, Apr 21, 2017 at 2:46 PM, Anders Darander <anders@chargestorm.se> wrote:

> The TCA9554 is similar to the PCA9554. Update the DT binding docs.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>

Patch applied. Seems like this component was misqualified at some point,
let's repair it.

yours,
Linus Walleij

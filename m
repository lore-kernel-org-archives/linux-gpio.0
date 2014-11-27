From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 05/16] gpio: mvebu: add suspend/resume support
Date: Thu, 27 Nov 2014 14:29:47 +0100
Message-ID: <CACRpkdb5S7Fv4+Ck2btLPTYWaWr_E-iMcQGeATB4NMwx_T-4GA@mail.gmail.com>
References: <1415978496-9334-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1415978496-9334-6-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:40960 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101AbaK0N3r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Nov 2014 08:29:47 -0500
Received: by mail-ig0-f171.google.com with SMTP id z20so4473228igj.16
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2014 05:29:47 -0800 (PST)
In-Reply-To: <1415978496-9334-6-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 14, 2014 at 4:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This commit adds the implementation of ->suspend() and ->resume()
> platform_driver hooks in order to save and restore the state of the
> GPIO configuration. In order to achieve that, additional fields are
> added to the mvebu_gpio_chip structure.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Do you want me to merge the patch or is it dependent on other patches?

Yours,
Linus Walleij

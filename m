From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 7 Jan 2015 10:41:04 +0100
Message-ID: <CACRpkdYFtqzO5Kr9jyQfbjxvT21REeOprWNve_che1cNDCzwFA@mail.gmail.com>
References: <1418809634.15005.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:63712 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995AbbAGJlF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jan 2015 04:41:05 -0500
Received: by mail-ig0-f176.google.com with SMTP id a13so2409225igq.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2015 01:41:05 -0800 (PST)
In-Reply-To: <1418809634.15005.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Baluta <daniel.baluta@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Octavian Purdila <octavian.purdila@intel.com>

On Wed, Dec 17, 2014 at 10:47 AM, Axel Lin <axel.lin@ingics.com> wrote:

> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
> Also make dln2_gpio_pin_set_out_val return int, so we can check the error value.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Tested-by: Daniel Baluta <daniel.baluta@intel.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Octavian Purdila <octavian.purdila@intel.com>
> ---
> v2: Address Octavian's comment.

This v2 patch applied for fixes.

Yours,
Linus Walleij

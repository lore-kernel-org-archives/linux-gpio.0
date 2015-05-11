From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: moxart: get value of output gpio from generic driver
Date: Mon, 11 May 2015 11:52:29 +0200
Message-ID: <CACRpkdaQc4Udg6mbzF23sapnPDRvRhLX_=4hjvtJpbmXO4_g-A@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-4-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34576 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbEKJw3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 05:52:29 -0400
Received: by oiko83 with SMTP id o83so100183120oik.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2015 02:52:29 -0700 (PDT)
In-Reply-To: <1430321701-13758-4-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Jonas Jensen <jonas.jensen@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 29, 2015 at 5:35 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> Adding a BGPIOF_READ_OUTPUT_REG_SET initialization flag to GPIO
> generic MMIO driver makes possible to remove a private get() value
> function from the driver.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied, unless Jonas has a problem with it.
Always CC: Jonas Jensen whenever patching Moxart stuff pls.

Yours,
Linus Walleij

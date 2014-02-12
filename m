From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] gpio: ich: Add output levels cache support
Date: Wed, 12 Feb 2014 16:12:47 +0100
Message-ID: <CACRpkda-FnRB4fDH6fatq+=Y__AkrwWvzfTbcfhdz5uNbs=89g@mail.gmail.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
	<1391779267-27084-5-git-send-email-vdonnefort@lacie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:39028 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751284AbaBLPMt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 10:12:49 -0500
Received: by mail-ob0-f175.google.com with SMTP id wn1so10572073obc.34
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 07:12:48 -0800 (PST)
In-Reply-To: <1391779267-27084-5-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, Feb 7, 2014 at 2:21 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:

> From: Vincent Donnefort <vdonnefort@gmail.com>
>
> This patch allows GPIO driver to cache GPIO_LVL output registers. The aim is to
> support chipsets on which GPIO_LVL value can't be read for output pins.
>
> Caching output levels implies the first output values reading as 0. The driver
> so can't be aware of set values GPIOs by bootloader or BIOS.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

Patch applied.

Yours,
Linus Walleij

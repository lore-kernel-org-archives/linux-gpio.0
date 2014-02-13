From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Fix gpio_base may not default to -1
Date: Thu, 13 Feb 2014 14:04:53 +0100
Message-ID: <CACRpkdbu7CTf3tRxLprjAv8H2ZPFEWX98x-rD019AP3L0NVOAw@mail.gmail.com>
References: <430364938.125965.1391822577770.JavaMail.zimbra@xes-inc.com>
	<284331514.125966.1391822584020.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:64938 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753910AbaBMNEy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2014 08:04:54 -0500
Received: by mail-oa0-f51.google.com with SMTP id h16so12699674oag.10
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2014 05:04:53 -0800 (PST)
In-Reply-To: <284331514.125966.1391822584020.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Sierra <asierra@xes-inc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 8, 2014 at 2:23 AM, Aaron Sierra <asierra@xes-inc.com> wrote:

> If no device tree node existed for a device when CONFIG_OF_GPIO was
> defined, then gpio_base would not default to -1.
>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Patch applied.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [gpio:for-next 67/67] pch_gbe_main.c:undefined reference to `devm_gpio_request_one'
Date: Wed, 30 Oct 2013 11:21:38 -0700
Message-ID: <CACRpkdZM8BBR6NAUTuSpEErZe2541-CvuwFSe13FDfxOBnnygA@mail.gmail.com>
References: <52691c0b.BIIOKlR6F81qU+tE%fengguang.wu@intel.com>
	<20131025044027.GA27083@localhost>
	<CACRpkdaJVE44UGRAZ0tnQSArrs+DuVFhVssW6riWmdp8-6E6BQ@mail.gmail.com>
	<1382696677.4970.40.camel@dvhart-mobl4.amr.corp.intel.com>
	<CACRpkdYvOMiBOXRi61LjemMSoafR6kv3XoY=A5E90hwMumdw9A@mail.gmail.com>
	<CACRpkdYDUKK-jAeeHECfRcKM+-MDuyarDMGDP0p39U_-WLgd8w@mail.gmail.com>
	<526AE0EB.4020602@linux.intel.com>
	<526AE1E2.9080909@linux.intel.com>
	<1382819615.23829.16.camel@dvhart-mobl4.amr.corp.intel.com>
	<1382822142.23829.46.camel@dvhart-mobl4.amr.corp.intel.com>
	<526CA546.7040406@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:57703 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751698Ab3J3SVj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 14:21:39 -0400
Received: by mail-ob0-f180.google.com with SMTP id wo20so1827785obc.25
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 11:21:38 -0700 (PDT)
In-Reply-To: <526CA546.7040406@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 26, 2013 at 10:31 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:

> Maybe if GPIOLIB has the static inline stubs returning -ENODEV we could
> use a patch similar to the one attached here.

I've added stubs returning -EINVAL just like all siblings there, if you
like to have this changed, send a patch changing it to -ENODEV
and this patch on top as 2/2 please.

Yours,
Linus Walleij

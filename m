From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.1
Date: Tue, 14 Apr 2015 18:06:03 -0700
Message-ID: <CA+55aFxTPnGD0mQgc9D0ZAeHc7zxj8vW-ZhczurcESm6Vy6A0g@mail.gmail.com>
References: <CACRpkdZguXCBnTeAnmQBRo+Bs-8AO6u8aOPtd4uumfet-cfn1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:35431 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754885AbbDOBGE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2015 21:06:04 -0400
In-Reply-To: <CACRpkdZguXCBnTeAnmQBRo+Bs-8AO6u8aOPtd4uumfet-cfn1Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 14, 2015 at 7:57 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Hi Linus,
>
> here is the big pull request for v4.1 pin control changes.

It is very clearly broken:

  warning: (PINCTRL_AT91 && PINCTRL_MESON && PINCTRL_NOMADIK &&
PINCTRL_MTK_COMMON && GPIO_TB10X) selects OF_GPIO which has unmet
direct dependencies (GPIOLIB && OF)

and you'll need to add the proper "depends on OF && GPIOLIB".

I pulled it because it still ends up working for my normal test-cases,
but it's wrong.

                          Linus

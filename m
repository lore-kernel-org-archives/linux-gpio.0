From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before
 querying its direction"
Date: Thu, 31 Aug 2017 09:04:11 +0200
Message-ID: <CACRpkdZAPJVNBwro3ddoOZVDr=qzRc_5v1+wmRNYX7r1b8q8YA@mail.gmail.com>
References: <20170830112424.7a3a7c36@windsurf.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36286 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751336AbdHaHEN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 03:04:13 -0400
Received: by mail-oi0-f43.google.com with SMTP id t75so68672844oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 00:04:12 -0700 (PDT)
In-Reply-To: <20170830112424.7a3a7c36@windsurf.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Timur Tabi <timur@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@free-electrons.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

On Wed, Aug 30, 2017 at 11:24 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Commit "gpiolib: request the gpio before querying its
> direction" (108d23e322a247d9f89ba2e2742520ead0944cc9) is causing a
> regression on Marvell platforms, and potentially other platforms as
> well. With this commit applied, we lose the serial console. Reverting
> this commit makes the serial console functional again.

I have reverted this patch for now.

Yours,
Linus Walleij

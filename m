From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] pinctrl: meson: Add a bunch more pins
Date: Wed, 11 May 2016 10:57:21 +0200
Message-ID: <CACRpkdY99HWOQ4fhuYuPZ4JpwK6s75TXYpaBaBxhLLJFRLCd6w@mail.gmail.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34891 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400AbcEKI5W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 04:57:22 -0400
Received: by mail-oi0-f45.google.com with SMTP id x19so57042999oix.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 01:57:22 -0700 (PDT)
In-Reply-To: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, linux-meson <linux-meson@googlegroups.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, May 6, 2016 at 4:21 PM, Kevin Hilman <khilman@baylibre.com> wrote:

> Add support for several more devices, both in the EE domain and in the
> AO domain.  Also, add the pins to the corresponding DTS files.
>
> Tested on odroid-c2 and Amlogic P200 boards, and verified with working
> ethernet.
>
> Depends on the initial GXBB pinctrl support from Carlo[1].  Also
> available in my git tree[2] with all the dependencies included.

Carlo can you review Kevin's patches? I'd like to apply them if
nothing's controversial about them.

Yours,
Linus Walleij

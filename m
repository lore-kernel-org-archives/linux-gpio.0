From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/2] Last step to working Allwinner R40 pinctrl
Date: Mon, 31 Jul 2017 15:52:02 +0200
Message-ID: <CACRpkdamz2C=_NhKqCzmr-4QfEhrd7XcMPBHBOzup8edSKe7_w@mail.gmail.com>
References: <20170722025054.32645-1-icenowy@aosc.io> <57922ac75d55aef45ae8d09df76418ea@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:35743 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750979AbdGaNwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:52:04 -0400
Received: by mail-it0-f52.google.com with SMTP id h199so125731238ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:52:04 -0700 (PDT)
In-Reply-To: <57922ac75d55aef45ae8d09df76418ea@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Jul 30, 2017 at 7:26 AM,  <icenowy@aosc.io> wrote:
> =E5=9C=A8 2017-07-22 10:50=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> This patchset contains only two patches.
>>
>> The first one is a minor fix for the A10 pinctrl driver, add a function
>> of a pin, which used to be missing in A10/A20 pinctrl driver. Thanks for
>> Chen-Yu for discovering it when reviewing my R40 pinctrl patchset.
>>
>> The second one is the real R40 pinctrl part, with fixes suggested by
>> Chen-Yu and Maxime.
>>
>> Icenowy Zheng (2):
>>   pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
>>   pinctrl: sunxi: add support of R40 to A10 pinctrl driver
>
>
> Ping...
>
> Can anyone process this patchset?

Sorry, I was on vacation.

Looking at the backlog now.

Yours,
Linus Walleij

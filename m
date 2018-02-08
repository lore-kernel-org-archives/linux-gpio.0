From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [ANNOUNCE] libgpiod v1.0
Date: Thu, 8 Feb 2018 18:22:10 +0100
Message-ID: <CAMRc=Me-0YCiU36pG8HBjYtonJ9ubNFTgTcLS2AU_xcCLwU2OQ@mail.gmail.com>
References: <CAMRc=MeEMu8cm=6F_7GEgGcJZgavYnsum+BuriOP1B8bkYbWAQ@mail.gmail.com>
 <5942081F7727964D830FC876E62CA8560119E23097@MHQMBX02.moxa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:41105 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbeBHRWL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Feb 2018 12:22:11 -0500
Received: by mail-oi0-f45.google.com with SMTP id m83so4040284oik.8
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2018 09:22:11 -0800 (PST)
In-Reply-To: <5942081F7727964D830FC876E62CA8560119E23097@MHQMBX02.moxa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?U1ogTGluICjmnpfkuIrmmbop?= <SZ.Lin@moxa.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Clemens Gruber <clemens.gruber@pqgruber.com>, Linus Walleij <linus.walleij@linaro.org>

2018-02-08 17:30 GMT+01:00 SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <SZ.Lin@mox=
a.com>:
> Hi,
>
> Thank you for your great efforts!
>
> By the way, the tarball in [1] is not consistence with [2]. For example, =
the Doxyfile file is not existed in [1] but in [2] and m4 folder is existed=
 in [1] but not in [2].
> Would you please have a look at this?
>
>
> [1] https://www.kernel.org/pub/software/libs/libgpiod/libgpiod-1.0.tar.gz
> [2] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tag/?h=3Dv1=
.0
>
> Best regards,
>
> SZ Lin
>

That's a bug in the build files - Doxygen is not included in the dist
package. Thanks for spotting that, I'll fix it.

Best regards,
Bartosz Golaszewski

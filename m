From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: drivers/gpio/gpio-stmpe.c:412: bad if test ?
Date: Tue, 18 Oct 2016 14:32:47 +0200
Message-ID: <CACRpkdaZfhtUN3dspGne8QkkTKsrWsk9CQU1yR_HRRAHu4TtoQ@mail.gmail.com>
References: <VI1PR08MB1022FEB07B283A740340D49C9CD00@VI1PR08MB1022.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34369 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753329AbcJRMcs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 08:32:48 -0400
Received: by mail-qk0-f176.google.com with SMTP id f128so277045867qkb.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2016 05:32:48 -0700 (PDT)
In-Reply-To: <VI1PR08MB1022FEB07B283A740340D49C9CD00@VI1PR08MB1022.eurprd08.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Binderman <dcb314@hotmail.com>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

I think this need to be discussed with Patrice.

Sorry for top-posting.

Yours,
Linus Walleij

On Mon, Oct 17, 2016 at 1:21 PM, David Binderman <dcb314@hotmail.com> wrote=
:
> Hello there,
>
> drivers/gpio/gpio-stmpe.c:412:34: warning: logical =E2=80=98or=E2=80=99 o=
f collectively exhaustive tests is always true [-Wlogical-op]
>
> Source code is
>
>         if (stmpe->partnum !=3D STMPE801 || stmpe->partnum !=3D STMPE1600=
 ||
>             stmpe->partnum !=3D STMPE1801) {
>
> Maybe better code
>
>         if (stmpe->partnum !=3D STMPE801 && stmpe->partnum !=3D STMPE1600=
 &&
>             stmpe->partnum !=3D STMPE1801) {
>
> Regards
>
> David Binderman
>
>
>
>

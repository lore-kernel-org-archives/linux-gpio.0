From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: syscon: do not use raw "set" callback in syscon_gpio_dir_out
Date: Fri, 22 Sep 2017 15:42:52 +0200
Message-ID: <CACRpkdbj072oeH3nQWyski7spgfeeuYsvTOiiZiUQtArNVKh5Q@mail.gmail.com>
References: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
 <CACRpkdayo0Upfx21q7FJbVRRiqWTuHGfF=vYUpZHd+17TDUQbQ@mail.gmail.com> <1505994978.366886647@f249.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:45265 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752210AbdIVNmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 09:42:53 -0400
Received: by mail-io0-f181.google.com with SMTP id g32so3128392ioj.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 06:42:53 -0700 (PDT)
In-Reply-To: <1505994978.366886647@f249.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Vladimir Murzin <vladimir.murzin@arm.com>

On Thu, Sep 21, 2017 at 1:56 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
>>=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 21 =D1=81=D0=B5=D0=BD=D1=82=
=D1=8F=D0=B1=D1=80=D1=8F 2017, 14:23 +03:00 =D0=BE=D1=82 Linus Walleij <lin=
us.walleij@linaro.org>:
>>
>>I really need Alexander Shiyan to look at this patch.
>>
>>The way i percieve it, .set is NULL if the chip does not
>>support output.
>>
>>We should print the right error messages and bail out
>>if the user is anyway trying to set a line like that.
>
> Hello.
>
> Using "chip->set", instead of "priv->data->set", is more proper way on my=
 opinion.
> However, if the driver is not configured for output, the any errors shoul=
d not occur in any case.

Is that an Acked-by?

Yours,
Linus Walleij

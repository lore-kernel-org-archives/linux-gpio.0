From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio: add gpio util to get or set gpio lines
Date: Mon, 7 Aug 2017 14:33:53 +0200
Message-ID: <CACRpkdbn5daKVUU7-5P_x==KmBQix7EQ667STKC8ncOhAySdYg@mail.gmail.com>
References: <20170724143218.8510-1-mnhu@prevas.dk> <CACRpkdYMfaZDd3Tp-MfdtEpYLYWFJgGVKzwhjp1-swoufuzWrQ@mail.gmail.com>
 <B76AFF4C-51DC-4FC5-85C4-4F9D4404C8A5@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36943 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753222AbdHGMdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 08:33:55 -0400
Received: by mail-it0-f49.google.com with SMTP id 76so1730693ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 05:33:54 -0700 (PDT)
In-Reply-To: <B76AFF4C-51DC-4FC5-85C4-4F9D4404C8A5@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin.hundeboll@prevas.dk>
Cc: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 3, 2017 at 10:31 AM, Martin Hundeb=C3=B8ll
<martin.hundeboll@prevas.dk> wrote:

>>Maybe it should be two tools? One fo setting and one for getting a
>>line?
>
> Correct. I can update the patch into two utils, but with libgpiod in the =
mix, we can just drop this?

I would like Bartosz library to be used widely so let's drop this.

Yours,
Linus Walleij

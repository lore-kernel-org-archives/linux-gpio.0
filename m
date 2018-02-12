From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] pull_up and pull_down resistors
Date: Mon, 12 Feb 2018 14:11:51 +0100
Message-ID: <CAMRc=Mf2rmt7X62VJohjFzaH_sBvMaYRGuoK_QTgzKD71a58Kw@mail.gmail.com>
References: <CAH_Y6Mbf+f_=OVBhdfi18FMwDyHY6OyVOE56Fybt0XV42gftRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f181.google.com ([74.125.82.181]:45869 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933166AbeBLNLw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 08:11:52 -0500
Received: by mail-ot0-f181.google.com with SMTP id 73so13926812oti.12
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 05:11:52 -0800 (PST)
In-Reply-To: <CAH_Y6Mbf+f_=OVBhdfi18FMwDyHY6OyVOE56Fybt0XV42gftRQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?0JLQsNGB0LjQu9C40Lkg0JDQuNGC0L7Qsg==?= <smile.vasily@gmail.com>
Cc: linux-gpio@vger.kernel.org

2018-02-11 21:15 GMT+01:00 =D0=92=D0=B0=D1=81=D0=B8=D0=BB=D0=B8=D0=B9 =D0=
=90=D0=B8=D1=82=D0=BE=D0=B2 <smile.vasily@gmail.com>:
> Hi, many thanks for your work!
> I got libgpiood working on orange pi one board
>
> I have a question about pull_up and pull_down conmmands when line is
> in input directions.
>
> I don`t found anything in your code about pull_up_down commands(
> please tell something about it
>

The library only supports features that are exposed by the kernel over
the chardev interface. What is your use case exactly?

Best regards,
Bartosz Golaszewski

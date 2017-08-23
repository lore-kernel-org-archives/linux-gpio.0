From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Wed, 23 Aug 2017 10:23:48 +0200
Message-ID: <CACRpkdbBjfi-=oEu+pXgqy_kcVaP85Dy=C6_VnwNjBe89yXFMg@mail.gmail.com>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
 <CACRpkdaXreebGTf_cxrttwmdcRqYfaHx8WrQ64KA+o3AijBYfQ@mail.gmail.com> <1503446048.7266.28.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36576 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753471AbdHWIXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 04:23:49 -0400
Received: by mail-oi0-f43.google.com with SMTP id g131so9832990oic.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2017 01:23:48 -0700 (PDT)
In-Reply-To: <1503446048.7266.28.camel@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Yong Li <sdliyong@gmail.com>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 23, 2017 at 1:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2017-08-22 at 14:52 +0200, Linus Walleij wrote:
>> > On Tue, Aug 15, 2017 at 6:21 PM, Yong Li <sdliyong@gmail.com> wrote:
>>
>> > On AST2500, the hardware strap register(SCU70) only accepts write =E2=
=80=981=E2=80=99,
>> > to clear it to =E2=80=980=E2=80=99, must set bits(write  =E2=80=981=E2=
=80=99) to SCU7C
>> >
>> > Signed-off-by: Yong Li <sdliyong@gmail.com>
>>
>> Patch applied with Andrew's review/test tags.
>
> I realised after I sent the tags on v3 that I'd made a mistake: There's a
> slightly awkward to test bug in the v3 implementation. I followed up on v=
3 with
> this:
>
>         https://lkml.org/lkml/2017/8/16/905
>
> And Yong sent out a corresponding v4:
>
>         https://patchwork.ozlabs.org/patch/802946/

Ah. I got confused and picked the wrong version.

> I see you've pushed Yong's v3 in pinctrl/devel - can we revert/remove tha=
t and
> apply v4?

No I would have to revert the patch.

Can't we simply make a small fixup patch?

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-sx150x.c broken in 4.11
Date: Fri, 12 May 2017 11:29:52 +0200
Message-ID: <CACRpkdYJFgWKPwpPF0uqnj=gAak8QXqy+pMgUFEFRRoFq8AUZg@mail.gmail.com>
References: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
 <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
 <20170511151647.GT3489@atomide.com> <252b379a-d3fe-8020-5209-f1de43004b08@cogentembedded.com>
 <20170511163615.GU3489@atomide.com> <7f79af49-2aae-2bd2-4b85-e65220cb27e8@cogentembedded.com>
 <20170511175106.GV3489@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170511175106.GV3489@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 11, 2017 at 7:51 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Nikita Yushchenko <nikita.yoush@cogentembedded.com> [170511 10:01]:

>> Well that's exactly what patch from my first mail in this thread does.
>> This indeed fixes my case, but I don't know if it is correct in generic
>> case.
>
> OK, yeah I just looked it up as I was not in cc.
>
>> Should I submit it? Do you ack?
>
> Yeah please submit a proper patch. I assume you already checked
> that this change only affects the pinctrl hogs only, not regular
> device pins? I'd assume so as it's in create_pinctrl()..

Thanks for sorting this out, both of you.
Much appreciated!

Yours,
Linus Walleij

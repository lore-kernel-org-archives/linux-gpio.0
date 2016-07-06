From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: be more careful when forcing IRQ line to input
Date: Wed, 6 Jul 2016 10:34:54 +0200
Message-ID: <CACRpkdZpF7fNMULDkMK60xh_=+X8PJ5+fyPoDJtA2vTDwiakhw@mail.gmail.com>
References: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org> <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 5, 2016 at 7:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 07/05/2016 05:15 PM, Linus Walleij wrote:
>
>> We need to convince the IRQ line to become input unless there
>> is a reason for. Also fixes up reference counting on the
>
>
>    For what?

Module refcount in its kobject. I'll update the commitlog.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: reinstate generic compat string
Date: Mon, 14 Aug 2017 14:59:09 +0200
Message-ID: <CACRpkdYai2x3hD+cm2SvZXtuiw7ZHyvi0+CTvHZKMm0EeYZCbg@mail.gmail.com>
References: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au> <20170810080624.GF16647@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170810080624.GF16647@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2017 at 10:06 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Aug 09, 2017 at 10:21:06AM +0200, Simon Horman wrote:
>> commit d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility
>> strings") deprecated the generic compat string, renesas,gpio-rcar. After
>> further discussion this appears not to have been desirable as that compa=
t
>> string is compatible with all R-Car SoCs supported in upstream.
>>
>> This commit partially reverts that commit, and updates related
>> documentation and examples.
>>
>> Fixes: d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility st=
rings")
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> Hi Linus,
>
> I believe Geert is on holidays at the moment (maybe you are to=E2=80=BD).

Nah neither of us are as it seems :)

I wait for the two of you to figure this out before applying anything.

Yours,
Linus Walleij

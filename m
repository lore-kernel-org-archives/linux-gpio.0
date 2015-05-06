From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Wed, 6 May 2015 11:10:57 +0200
Message-ID: <CAGhQ9VzSzver3G5cPdmo-GtmeyqTehSO6Yh3oiUcRpGPQR5pMg@mail.gmail.com>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>
List-Id: linux-gpio@vger.kernel.org

On 6 May 2015 at 10:02, Valentin Rothberg <valentinrothberg@gmail.com> wrote:
> Hi Joachim,
>
> there are two of your commits [1, 2] in today's linux-next (i.e.,
> next-20150506).  Both of them add Kconfig options that depend on
> ARCH_LPC18XX, which is not defined in Kconfig, see:
>
> +       depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
>
> Is there a patch queued somewhere to add ARCH_LPC18XX ?

Currently it's only on the mail list.

See: http://marc.info/?l=linux-arm-kernel&m=143016894704253&w=2

Some drivers are going upstream before the base support.

regards,
Joachim Eastwood

> I detected this issue with ./scripts/checkkconfigsymbols.py by diffing
> yesterday's and todays' linux-next trees.
>
> Kind regards,
>  Valentin
>
> [1] 13a43fd9e905 ("gpio: add lpc18xx gpio driver")
> [2] 3aba09daf3d4 ("pinctrl: add lpc18xx pinctrl driver")

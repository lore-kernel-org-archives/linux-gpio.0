From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Tue, 12 May 2015 14:06:34 +0200
Message-ID: <CACRpkdbKfVrAb3inBrPBaC4p=A-4OAOnKd-zB6bXj=JXkdF1ZA@mail.gmail.com>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
	<CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
	<CAD3Xx4LQOR=W6iXkFsGJMfXLrdM39HwUphqX7j=S=EPzUz73yw@mail.gmail.com>
	<CACRpkdaeJKsrZrn4o0BAyCWREUg-QuJ5LGF39bca8YuzM95f0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaeJKsrZrn4o0BAyCWREUg-QuJ5LGF39bca8YuzM95f0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 12, 2015 at 2:03 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> - (B) Creating an immutable branch pulled into both trees, which
>   is better since it means the same hash is in both trees

PS: This may seem idea but it's not. It means several
subsystem-disparate patches will appear in several pull requests
and you have to explain why it's so to Linus (the big penguin,
not me). So again, orthogonal trees are preferred, if
possible.

Yours,
Linus Walleij

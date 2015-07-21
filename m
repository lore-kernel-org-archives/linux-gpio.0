From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control fixes for the v4.2 series, take one
Date: Tue, 21 Jul 2015 15:29:03 -0700
Message-ID: <CA+55aFwFkXM5ZoVJfetX5puYzc8efXQKzYpjYcxjBM2J_iPohQ@mail.gmail.com>
References: <CACRpkdafhMgGtR5OS=6TMXnnsBht9AQefMAHWUfvcuXf_ymmiw@mail.gmail.com>
	<20150721184733.GH9981@pengutronix.de>
	<CACRpkdYz-a0A7i1sMj7=OZ1Vu8MnZEWtnD-ikQ1+HO5Cn_-DGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYz-a0A7i1sMj7=OZ1Vu8MnZEWtnD-ikQ1+HO5Cn_-DGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2015 at 2:25 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Ah, how could I miss that. Selective vision or something.
> Well let's see if Linus (the big penguin) want to fix it up, I
> can for one live with it.

Not the first time it has happened, and fixing it up generally is more
pain than it's worth.

We have worse examples of nasty crap. See for example commit
c6d409cfd0fd.  That was supposed to be a "cleanup".

Oh well.

Mistakes happen. I don't get upset about occasionally screwed up
commit logs. If it becomes a _pattern_, now that is when I might start
getting annoyed.

                 Linus

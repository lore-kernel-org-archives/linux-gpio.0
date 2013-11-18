From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] Documentation: gpiolib: document new interface
Date: Mon, 18 Nov 2013 10:34:20 +0100
Message-ID: <CACRpkdZc0DWHe6AmawYp=SY=5==SUuJUHDETUTDw-6PbhR3tUg@mail.gmail.com>
References: <1384605261-8682-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1384605261-8682-1-git-send-email-acourbot@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Rob Landley <rob@landley.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 16, 2013 at 1:34 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The first version received zero feedback, hopefully this one will get more
> attention. :) Not much changes, just some more proofreading and the fixes
> and improvements that came from it. It looks ok as far as I am concerned.

Sorry I was swamped with other stuff...

> Linus, I hope this can be merged during the -rc cycle of 3.13, since the
> gpiod_ interface is going to be introduced there. It would not make much
> sense for it to come without its documentation.

You're right of course. I'll read through it and apply fixes on top
(or squash into your patch.)

Formal stuff:
Don't we need an 00-INDEX file?
(Maybe Rob can tell whether this is desirable.)

I don't like double spaces after periods. I will just go and remove
all of them from the new documentation unless you convince me
otherwise. Reference:
https://en.wikipedia.org/wiki/Sentence_spacing

Linus

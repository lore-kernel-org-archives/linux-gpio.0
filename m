From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch v3 2/2] tracing: gpio: add Kconfig option for
 enabling/disabling trace events
Date: Sat, 6 Apr 2019 00:25:19 +0700
Message-ID: <CACRpkdY62aXDOZm7cK4ND-RSnr9Ynz0DxS8-PHSF7i7diRG=WA@mail.gmail.com>
References: <CAFDyS3Nuq8FPx4z5GW1Ht+NBGd+8O9rjPZ+DaMU1XU1QYgA=2g@mail.gmail.com>
 <1438432079-11704-1-git-send-email-tal.shorer@gmail.com> <1438432079-11704-4-git-send-email-tal.shorer@gmail.com>
 <20190327161158.GA26067@taurus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327161158.GA26067@taurus.defre.kleine-koenig.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Tal Shorer <tal.shorer@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 27, 2019 at 11:12 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> It happened a few times to me since this patch was merged (in 4.4-rc1)
> that I worked on a system with tracing enabled but
> /sys/kernel/debug/tracing/events/gpio were missing because of
> CONFIG_TRACING_EVENTS_GPIO=3Dn. This is annoying and I wonder what is the
> motivating purpose of allowing to disable gpio events. There is no other
> event type that can be disabled with kconfig symbols. Theoretically the
> overhead should be so small, that having these events enabled
> unconditionally should be fine, shouldn't it?

You have a good point. We should not do anything special.

I guess by the time this was merged I believed it was customary
for trancepoints to live behind a Kconfig option.

I guess it is not.

I happily merge  a patch removing this again if no case
can be made for it.

Yours,
Linus Walleij

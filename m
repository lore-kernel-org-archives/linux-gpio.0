From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PULL gpio-for-next] gpio: make flags mandatory for gpiod_get functions
Date: Wed, 15 Jul 2015 15:39:24 +0900
Message-ID: <CAAVeFuKTwuO6O106oq0=f6eWAaa1NTiOJZ8Pw-VRG_i0E+4g+w@mail.gmail.com>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150706090759.GS11824@pengutronix.de> <20150708105138.GD1426@pengutronix.de>
 <20150715062825.GC1426@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34287 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032AbbGOGjo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 02:39:44 -0400
Received: by obre1 with SMTP id e1so20578845obr.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 23:39:43 -0700 (PDT)
In-Reply-To: <20150715062825.GC1426@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Wed, Jul 15, 2015 at 3:28 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello Linus, hello Alexandre,
>
> On Wed, Jul 08, 2015 at 12:51:38PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
>> On Mon, Jul 06, 2015 at 11:07:59AM +0200, Uwe Kleine-K=C3=B6nig wrot=
e:
>> > now that all patches that were in next hit Linus Torvalds' tree an=
d
>> > v4.2-rc1 is out here comes the promised pull request that makes us=
age of
>> > the flags parameter mandatory for gpiod_get et al:
>> >
>> > The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5=
d7d4f0754:
>> >
>> >   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
>> >
>> > are available in the git repository at:
>> >
>> >   git://git.pengutronix.de/git/ukl/linux.git tags/gpiod-flags-for-=
4.3
>> >
>> > for you to fetch changes up to b17d1bf16cc72a374a48d748940f700009d=
40ff4:
>> >
>> >   gpio: make flags mandatory for gpiod_get functions (2015-07-06 1=
0:39:24 +0200)
>> gentle ping!
> the (or at least my) plan was to get this into next early after the
> merge window for 4.2 closes. Now we're already at -rc2. Can you pleas=
e
> comment?
>
> As of next-20150715 there don't seem to be any new users of gpiod
> without flags btw.

I'm all for taking this into -next ASAP then. Linus has control over
the tree though, so his action is required.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

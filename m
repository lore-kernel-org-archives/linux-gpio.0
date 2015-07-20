From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PULL gpio-for-next] gpio: make flags mandatory for gpiod_get functions
Date: Mon, 20 Jul 2015 09:41:09 +0200
Message-ID: <CACRpkdYaY3vMjACCALwk9HNw-XV86Rm1anpCW3wb1Y0-FWwd=A@mail.gmail.com>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<20150706090759.GS11824@pengutronix.de>
	<20150708105138.GD1426@pengutronix.de>
	<20150715062825.GC1426@pengutronix.de>
	<CAAVeFuKTwuO6O106oq0=f6eWAaa1NTiOJZ8Pw-VRG_i0E+4g+w@mail.gmail.com>
	<CACRpkdbDtg=Ssod4K881juitv4fu3iPO8TkE+ZqEALKMqeTwDA@mail.gmail.com>
	<20150720065605.GP7013@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:36429 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755936AbbGTHlK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 03:41:10 -0400
Received: by obnw1 with SMTP id w1so96913361obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2015 00:41:09 -0700 (PDT)
In-Reply-To: <20150720065605.GP7013@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Mon, Jul 20, 2015 at 8:56 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello Linus,
>
> On Fri, Jul 17, 2015 at 02:28:25PM +0200, Linus Walleij wrote:
>> On Wed, Jul 15, 2015 at 8:39 AM, Alexandre Courbot <gnurou@gmail.com=
> wrote:
>> > I'm all for taking this into -next ASAP then. Linus has control ov=
er
>> > the tree though, so his action is required.
>>
>> I am pushing it today.
>>
>> I finally found this message in my messy inbox. I'm a bit up over my
>> ears in patches...
> This somehow failed.  My tag is merged in your devel branch, but this
> contains several commits missing in your for-next. Is this intended?

No ... :(

I just pulled it in. If anything is to blame, I hope it's not me, I jus=
t
issued git pull.

commit 2563606ce45314bfeae811edfa9984b1921fff06
Merge: 015403145a65 b17d1bf16cc7
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Fri Jul 17 13:44:15 2015 +0200

    Merge tag 'gpiod-flags-for-4.3' of
git://git.pengutronix.de/git/ukl/linux into devel

    The last patch in this series makes the flags parameter for the var=
ious
    gpiod_get* functions mandatory and so allows to remove an ugly cpp =
hack
    introduced in commit 39b2bbe3d715 (gpio: add flags argument to gpio=
d_get*()
    functions) for v3.17-rc1.

    The other nine commits fix the last remaining users of these functi=
ons that
    don't pass flags yet. (Only etraxfs-uart wasn't fixed; this
driver's use of the
    gpiod functions needs fixing anyhow.)


Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

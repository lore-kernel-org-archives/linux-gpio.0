From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: s3c64xx: Tidy up handling of regulator GPIO lookups
Date: Mon, 14 May 2018 07:54:22 +0200
Message-ID: <CACRpkdahS9VGvRKKedfgAqa8zpDj3ASGa3atwtF=BY794ne5tw@mail.gmail.com>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-17-linus.walleij@linaro.org> <20180213111147.kr4kecqbhmcoq6w2@localhost.localdomain>
 <CACRpkdZVoYsdWy6GwnnSfaSc2_wycEse3JswqufqDoz=GFb5FQ@mail.gmail.com> <20180419150119.5yhf3uupdolg3cnv@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419150119.5yhf3uupdolg3cnv@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, patches@opensource.cirrus.com, Lee Jones <lee.jones@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 19, 2018 at 5:01 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Rather than unconditionally registering the GPIO lookup table only do so
> for devices that require it.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Do you have any objections to the following?
>
> If we are lucky I might be able to find time to test these early
> next week. Well at least there is reasonable chance I can test
> the 5102 stuff when you resend, not sure I have a device to
> test the wm1277 but will have a look. Also I haven't run up
> Cragganmore in a little while so might depend a little on how
> much people have broken it since last I did :-)

I folded this in on top of my series, also adding the table entries
for wm5102 and wm5102 reva.

Sorry for the delay, I was sidetracked...

Yours,
Linus Walleij

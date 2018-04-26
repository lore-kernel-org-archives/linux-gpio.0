From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] gpio: eic: Add edge trigger emulation for EIC
Date: Thu, 26 Apr 2018 10:29:51 +0200
Message-ID: <20180426082951.rfnyyd3d6ux65ld5@pengutronix.de>
References: <bdaaa8823cc3aef44352ee867fb6274278f2a2a9.1522392153.git.baolin.wang@linaro.org>
 <CACRpkdY+rbEqk3CqkrD09WEO=zLsD4VK1P56K4o=k_4gATaS0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY+rbEqk3CqkrD09WEO=zLsD4VK1P56K4o=k_4gATaS0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Baolin Wang <baolin.wang@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hello Linus,

On Thu, Apr 26, 2018 at 10:10:11AM +0200, Linus Walleij wrote:
> On Fri, Mar 30, 2018 at 9:02 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> 
> > The Spreadtrum debounce EIC and latch EIC can not support edge trigger,
> > but most GPIO users (like gpio-key driver) only use the edge trigger,
> > thus the EIC driver need add some support to emulate the edge trigger
> > to satisfy this requirement.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> 
> Patch applied.
> 
> The patch is fine and in line with other kernel drivers doing edge
> trigger emulation and we do not hold back on useful features.
> 
> But I want to take this opportunity to ping Uwe Kleine-König about
> his ideas for an edge trigger emulation library in the gpiolib core,
> and whether this also follows the pattern.

up to now it's still only this: an idea.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

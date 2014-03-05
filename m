From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpio: clamp returned values to the boolean range
Date: Tue, 04 Mar 2014 18:04:47 -0800
Message-ID: <1393985087.3271.21.camel@joe-AO722>
References: <1393378800-7220-1-git-send-email-acourbot@nvidia.com>
	 <CACRpkdY-oBdxxWhsGraEU31qyu+RWJAiRA+KEip6QNW3jRwGUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY-oBdxxWhsGraEU31qyu+RWJAiRA+KEip6QNW3jRwGUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2014-03-05 at 09:49 +0800, Linus Walleij wrote:
> On Wed, Feb 26, 2014 at 9:40 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> 
> > Nothing prevents GPIO drivers from returning values outside the
> > boolean range, and as it turns out a few drivers are actually doing so.
> > These values were passed as-is to unsuspecting consumers and created
> > confusion.
> >
> > This patch makes the internal _gpiod_get_raw_value() function return a
> > bool, effectively clamping the GPIO value to the boolean range no
> > matter what the driver does.
> 
> No, that will not be the semantic effect of this patch, bool is just
> another name for an int, maybe some static checkers will be able
> to use it however.

No, a bool is not an int.

It's really different.
include/linux/types.h:typedef _Bool                     bool;

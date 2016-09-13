From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning garbage
Date: Tue, 13 Sep 2016 14:31:29 +0200
Message-ID: <18457294.js4cyg49EU@wuerfel>
References: <20160909083154.26442-1-colin.king@canonical.com> <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com> <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Colin King <colin.king@canonical.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tuesday, September 13, 2016 12:04:00 PM CEST Phil Reid wrote:
> On 12/09/2016 21:40, Linus Walleij wrote:
> > On Fri, Sep 9, 2016 at 10:31 AM, Colin King <colin.king@canonical.com> wrote:
> >
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> ret is not initialized so it contains garbage.  Ensure garbage
> >> is not returned in the case that pdata && pdata->teardown is false
> >> by initializing ret to 0.
> >>
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >
> > Patch applied.
> G'day Linus,
> 
> 
> I believe this does the same as Arnd Bergmanns patch from 26 Aug.
> [PATCH 1/5] gpio: pca954x: fix undefined error code from remove
> 
> IMO Colin's is the cleaner solution.
> Arnd's could be removed.
> 

Please try to avoid adding initializations in the local variable
declaration, they just hide otherwise useful warnings when
you get a function that actually does something incorrect
in some code paths.

See also https://rusty.ozlabs.org/?p=232

	Arnd

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761F3033E1;
	Mon, 19 Oct 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410823; cv=none; b=Q3HCm5XaI9NNUlS5ZWb23lhzfvjH+mCOeananx8PQl5Wlk3Htb5joj8L9iDotRhoSHPm03sN4Jbq9347SUR9cAxQvCmmpeupMgZh042FaFZOfFrGe4q/28F0subi2u5Vheyg9xvw0lPdFwmShuuuZyuEmXA9oKzK2P31/BgWH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410823; c=relaxed/simple;
	bh=WO8I8gsUTHx7nGmRFchX98HflI/BujQaa2lfqRnpumg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5Lal/BzDAqVCgTnO4M3+8tUvGMonYtrOeVbeM9aYf6IgrWDEua5zXSz48avXHtGKz+T7MGYarQQUwHzN8Tn7USa7IuP9ppgZhoRygSlsbnFrx0I4yGqsjL2d85MBTTNLunOQ9yOK7rb2tI0I9hSl9h5YVZc3C1FPeCNgZncRYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I18NT16Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I18NT16Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63511F000C4;
	Mon, 19 Oct 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410822;
	bh=Uulu/pFR6TQ2nQroeZuZ08cEaxl3wwmZOTJHIKOgCjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I18NT16Q3FPIxzl0Pu2UdmzJVlmdMUBbwCNYRPih6wXPJcai2soRss1XnzUSncY+l
	 FXLyuCanwqkOn5sgmfS4rzSdytRuAh2ZPBzs/S5Loc8HjDGR8S/zoiE4t4I32wViuV
	 Oz4Reb25CAcKUKtZG7FpfXbabefAVKrrIio7TTo8UOFtDhdqDeRyXSZz/iLosTYhNY
	 RvGogpG5ROttGiFV3tewhEZ6FzqJQOarjFeOdTAI4KtU88yO0n58buW9vWe+SZWS/4
	 5a6pV1+9YASvJcPiMn2L2S8n2u0MtpE0NVgIblXiD7mASDc9JNonatmzwkYPSUieF9
	 b9iwZH2/dUwaQ==
Date: Mon, 19 Oct 2026 11:53:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v14 5/5] reset: Leverage revocable for accessing struct
 reset_controller_dev
Message-ID: <atYEwbTCcuYa5ShB@google.com>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-6-tzungbi@kernel.org>
 <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>

On Thu, Oct 15, 2026 at 05:49:11AM -0400, Bartosz Golaszewski wrote:
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 38e189d04d09..788a235c3965 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -24,8 +24,8 @@
> >  #include <linux/property.h>
> >  #include <linux/reset.h>
> >  #include <linux/reset-controller.h>
> > +#include <linux/revocable.h>
> >  #include <linux/slab.h>
> > -#include <linux/srcu.h>
> >
> >  static DEFINE_MUTEX(reset_list_mutex);
> >  static LIST_HEAD(reset_controller_list);
> > @@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
> >
> >  /**
> >   * struct reset_control - a reset control
> > - * @rcdev: a pointer to the reset controller device
> > - *         this reset control belongs to
> > - * @srcu: protects the rcdev pointer from removal during consumer access
> > + * @rev: revocable handle for accessing the reset controller device
> 
> Please call it "revocable". The name "rev" does not indicate what it is at all.
> Same elsewhere if you call it the same.

Ack, I initially used "rev" to keep the lines shorter with the revocable
APIs, but "rev" alone can indeed be confusing.  On the other hand, I feel
"revocable" is a bit verbose and doesn't indicate which target object it
protects.  How about calling it "rcdev_rev"?

> Otherwise looks good to me and nicely shrinks the code! We still don't know
> what the fate of that series will be though, right?

Yes, that is also what I would like to check before sending v15.

Greg, Danilo, Rafael, Johan,

Since the revert in February, the API and lifetime model have been
redesigned, and the series now has concrete in-kernel users for both
embedded allocation (gpiolib in patch 3) and dynamic allocation (reset in
patch 5).

Do you think this series is heading in a direction that driver-core can
accept, or do you still have fundamental concerns with the approach?  I
would appreciate your thoughts on whether we should continue working on
this series.

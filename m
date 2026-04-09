Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1943AEF49;
	Thu,  9 Apr 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742306; cv=none; b=PKX9bNwXO6vee/YZlrgPC+I7+1t95kNEifleEtAZOTTiJa5fO3FqoicDw7WJL2fO/iv6ihEJokbC8CoPnPIgi9urGn0Uaif+yvoYJshA1SKuoKU8JwszuFW+DqrqE//1LbtIiu3XBTwZAkJNbn+1Ph45s6JHxoeRDR/A4bHTjQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742306; c=relaxed/simple;
	bh=6dRUAhC8/mvyKO38uwwRaE9X7jdo56Yb5n69llY3DWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7PR95uEzeyneyWQSV+TgtOff+wAp+BSlOrVPEC3sv/zvUquy9EdwdL9Q1KYYUdZqYz2jNvKeMw1GasRmmUXUxEPJN8gWaaQzg4jpqH0fJrqm4Tx+MbzahfNOckCxp33TZUALu5RVcFJdAbVwPBY5HOehrr3U/tVoBgE//coWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3E8/C+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3E8/C+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30611C4CEF7;
	Thu,  9 Apr 2026 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775742305;
	bh=6dRUAhC8/mvyKO38uwwRaE9X7jdo56Yb5n69llY3DWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3E8/C+1fWYfsTRfGWwnb/p94ZFizjX1LmC+s9KZZRQTgvw0iZ5VDRunoDpMVHHNR
	 BL9EwSA8w9X4MObFa+lnkHPGgIOD1NOaYIVf0cFUShYxttgsd1O+mNLjkM1MasLey2
	 7BtOUWW6kzy4sGjHcCKGIyYKNP9IKe4AsbKqHHS01kDNm3TJCJlabuv/EqFhWjU2T2
	 t86BDTuXrEFb3PKa0ClkXSRey/OXIRuFhi8e8zOeCZq4QodwdXBTMRLnEHtBqTSXMZ
	 AYVoD7KRF36RV15cb53y/kMs1PTIbnfcG0SFO6Xhj7y1xHYeYrqAz6Vozj3GyLywkV
	 NgmVFyFvADYNg==
Date: Thu, 9 Apr 2026 14:45:01 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into
 the driver
Message-ID: <20260409134501.GE3290953@google.com>
References: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
 <177574072110.3341478.15028296329332074230.b4-ty@b4>
 <20260409132041.GC3290953@google.com>
 <CAMRc=McV_fsxVK8VBJOZSV0=Pw-WzZhqSVU00LfWUENqpKVP4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McV_fsxVK8VBJOZSV0=Pw-WzZhqSVU00LfWUENqpKVP4A@mail.gmail.com>

On Thu, 09 Apr 2026, Bartosz Golaszewski wrote:

> On Thu, 9 Apr 2026 15:20:41 +0200, Lee Jones <lee@kernel.org> said:
> > On Thu, 09 Apr 2026, Lee Jones wrote:
> >
> >> On Fri, 27 Mar 2026 11:49:07 +0100, Bartosz Golaszewski wrote:
> >> > This symbol is only used inside the timberdale MFD driver. Move into
> >> > the .c file as there's no need for it to be exposed in a header.
> >>
> >> Applied, thanks!
> >>
> >> [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
> >>       commit: 13f5997f2bbaee976e1a4a6873d6bd40df9b2637
> >
> > Ignore this - I actually plan to take the whole set after -rc1.
> >
> > --
> > Lee Jones [李琼斯]
> >
> 
> Should I resend it rebased on top of v7.1-rc1 once it's out?

If it doesn't apply cleanly, you will.

-- 
Lee Jones [李琼斯]

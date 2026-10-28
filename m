Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189482;
	b=QOrpnw+J901Xsv/Az5F6heJx2AIAi59icTNoGiIFO3p8/b2mqad8hgFPw413CdihelRZ
	 v1gKggCPi73t5yt+sEjZFDl5EPQwSkUF/4ht5rBXn9+G5Tf/Q7pC56edYh8ETI/KdNaoQ
	 6r1TKdSLe3hFpR4jvxtYLXp7qdYSQ4NgOLmnCYKl1qclnOn10IW2sI/I39t0XIBTGfHQ3
	 I3Z0f6UMYxcR+uIQKGMoY45+WmxOPgR87D9TWSgFjipbvgVEiUHcB/XOvQQnuZZ6psgoR
	 Re0PzUWSUySHFytrHQkUDAVf20RjT1IF2E6RRbaYZts6GrVHmqH2I1sikXvlmMTPTdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189482;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jFp3hE6kdnKwI+OVKk4TyPsmWn3kllMvQ4D/xPqwvN4=;
	b=FNzGSaThcsgSL9sApYRyXYVChD+qarWIE01Z2dBJspzyU+6pdVpVIgh3QZ3Av6+Z6NN7
	 jyt2OAw/Lyclj+GmrnUYI38J6j75+QhnOGCK3CquW7BF+Y0UHJOlJtezL+IKOm51bbsM4
	 +h9fhPpLskM1lOf8PJOqXx5Z7gOSIBXmQNEMrVMo+CudnQbcXDw6JquG7IsyLc2QwhNcV
	 pRwIJaMnAsiRnPiDgrwriXnszobyTxM1o092dz7ZBCr2SQllMhr1sMkutK+pyCF1Mz7V1
	 ivRymGakrEztbJSlYHoo/ZKHJDJwEi4m7VOUaU32rQpB+tnYuXBv7lNZ7wZeLvUrc3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1L1OPmZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E4C606A31C;
	Wed, 28 Oct 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1L1OPmZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACAA1F01825;
	Wed, 28 Oct 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189481;
	bh=jFp3hE6kdnKwI+OVKk4TyPsmWn3kllMvQ4D/xPqwvN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b1L1OPmZlis0ynVvH14hToOnAQdWKPvzxEhhBHQexyu6fBbXr7XoEIQH6iHY4zUVi
	 7tSYmaP/0oCLvhhgqTJ74OzqCgZeDu2fbK0zdBe2/v4D+wHhXBW3VUMR/+mCIXSBw+
	 5saKrS6gFXMdmWOGBIJ3sNnp8WCqrUU2+u3m+0Q/m+z6jsVWPTE1Lx6dTZstHcuuj+
	 dgEt1L1rSfYFoMbAGkbd4EsarOVGyUfCmuKaiocCgXxuNT/BdK/4BoUR2ip1F16h1c
	 JI32qho8rQSrvsJ26bQs7DjCFr9qg9UEUI64yeGbgM/Tbi0tw38b0Ik75PNgI+ZlCn
	 +PZ4xa4fqeRgA==
Date: Wed, 28 Oct 2026 12:11:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v14 5/5] reset: Leverage revocable for accessing struct
 reset_controller_dev
Message-ID: <auHmZhhB9MZj_2ch@google.com>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-6-tzungbi@kernel.org>
 <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
 <atYEwbTCcuYa5ShB@google.com>
 <709ddfbbc57ce8f666fc8ebd7fe48dafed39ef33.camel@pengutronix.de>
 <CAMRc=MePpaTMC2k8C3B5ue+QtYQQK9vX63n=v18J+fnaX4=0xQ@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MePpaTMC2k8C3B5ue+QtYQQK9vX63n=v18J+fnaX4=0xQ@mail.gmail.com>

On Mon, Oct 19, 2026 at 04:05:21PM +0200, Bartosz Golaszewski wrote:
> On Mon, 19 Oct 2026 14:41:47 +0200, Philipp Zabel <p.zabel@pengutronix.de> said:
> > On Mo, 2026-10-19 at 11:53 +0000, Tzung-Bi Shih wrote:
> >> On Thu, Oct 15, 2026 at 05:49:11AM -0400, Bartosz Golaszewski wrote:
> >> > >  /**
> >> > >   * struct reset_control - a reset control
> >> > > - * @rcdev: a pointer to the reset controller device
> >> > > - *         this reset control belongs to
> >> > > - * @srcu: protects the rcdev pointer from removal during consumer access
> >> > > + * @rev: revocable handle for accessing the reset controller device
> >> >
> >> > Please call it "revocable". The name "rev" does not indicate what it is at all.
> >> > Same elsewhere if you call it the same.
> >>
> >> Ack, I initially used "rev" to keep the lines shorter with the revocable
> >> APIs, but "rev" alone can indeed be confusing.  On the other hand, I feel
> >> "revocable" is a bit verbose and doesn't indicate which target object it
> >> protects.  How about calling it "rcdev_rev"?
> >
> > I strongly associate "rev" with "revision".
> >
> > I'd be fine with "rcdev_revocable" (in struct reset_control and
> > "revocable" in struct reset_controller_device).
> >
> 
> I think "revocable" in both cases is fine. After all: we know what type the
> dereferenced variable is.

Ack, will rename them to `rcdev_revocable` (in `struct reset_control`) and
`revocable` (in `struct reset_controller_dev`).

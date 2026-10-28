Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189462;
	b=Qrq+XYg4aZq5yUJ/2JHHKOl4iU56wh9riHT91EETpckZEVtHktUlAZGLTwMj5UekFDb9
	 348SnFJRuP8ECa3c3oMnam7D6/6gibmuqp9Zo5Er0WcHCYiDtmt+QTPrVMOnJI2XBucSF
	 lfhsVrsCtgUcHN7rfvmYI6kIITaFpn/zJqcnTgCgXE2Zp3IrAsgmpIPfI2Z8SBpGdX17G
	 xwzNeZOyYu5St4GN7pqdm/TjYMPBLz4XcSJcGzGeuEAoCZaK4Cxbj3CTP9xPViVVeG8XH
	 AIok70s4w+GFimzYgtcrDGqmJORoXfWoriu+kRfvyW5bhnpF2/X9MPE1C8XLHWNJdaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189462;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YH8exneAUOKvBRopo/qKSgKRlif0KWcuV1FHtfBKY8Q=;
	b=0IQRQA5qR6xYCcK8CeKf+z3yknTsCHfXk6GXM4aXdz+AikGaou428q7OkCfyQSvWrf/H
	 lwEHc55S1R0oHQsbBln+ne2HNB3dyBJbNeq5P3acmvLyOp53EQ1ncB1+gIVAoFlIQMFr9
	 WNDGi3e4ONbquLG4cpVAX57/l4kckONW83MB5c4Yeg6GVrRlEOCJ730Lo3ERqzmxcBMvG
	 T5V7J/aivIaIFhVkMXPa0MzLNYn/YewjVTUI6bKyPJm95dOTLC0tlBi/D9J1FDBW/0vI3
	 wzwsXElQ5tH8DkrVj/sXt97gxEviWgeOXcXxkaOmyJETYSKsvhbvd2hXnwwLZu1xQyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DOBr/23h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1AD606A31C;
	Wed, 28 Oct 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOBr/23h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F231F01825;
	Wed, 28 Oct 2026 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189461;
	bh=YH8exneAUOKvBRopo/qKSgKRlif0KWcuV1FHtfBKY8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DOBr/23hmCjh4wM2ot7hpLjiW5OPK242RMuA7tPtbu7BaF3zojrlh+H6jDUj6eCR3
	 p4G7wLlsFHqgiTEpyvOA5cZC0cr0jh1Hfl30heUHA1iiw6bbbWsIOQe1EpQycsVeKO
	 zFGcn3wMkCPUJaGd6FXoyz9c79jVEetuLg6M7BxJBZx+wIjIZscRQkYy/C/Cc01Obd
	 V7T/eXY7IE9bQfe0RJvOOHD+Hic+gET50gFDnKZpqepumxIa8+iEfaZevujjdjYDJr
	 T3uh4Uih+lLu7qRsBJpHb4mSIu1nKSG9SSIKtQadJ5ZI7y3GoBg1G6zdUpmntaTy3N
	 cauCHtT0FOWlA==
Date: Wed, 28 Oct 2026 12:10:57 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v14 4/5] reset: Add KUnit test cases
Message-ID: <auHmUVsSCbZI7V4e@google.com>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-5-tzungbi@kernel.org>
 <986d1b636fc7a96b3c2e05e8725a693a496d2f62.camel@pengutronix.de>
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
In-Reply-To: <986d1b636fc7a96b3c2e05e8725a693a496d2f62.camel@pengutronix.de>

On Mon, Oct 19, 2026 at 03:32:12PM +0200, Philipp Zabel wrote:
> On So, 2026-10-11 at 20:12 +0800, Tzung-Bi Shih wrote:
> > Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
> > nodes"), reset suppliers and consumers can be wired up using software
> > nodes without requiring Device Tree or hardware devices.  Leverage this
> > to add KUnit test cases for the reset controller framework.
> > 
> > The test cases cover the following scenarios:
> > 
> > - Basic: Verifies that a consumer can acquire a reset control via
> >   fwnode and perform reset, assert, deassert, status, release, and
> >   acquire operations.
> > - Use After Unregister: Verifies that after the supplier unregisters
> >   the reset_controller_dev while a consumer still holds a reset_control
> >   handle, subsequent consumer operations fail safely with -ENODEV.
> > - Concurrent Unregister: Verifies that unregistering the
> >   reset_controller_dev concurrently with an in-flight reset operation
> >   waits for the active operation to complete before returning.
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> It looks like the Kunit tests are independent from the reset of the
> series and could be sent individually.
> 
> Is there any dependency that I am missing?

No, but I was using it to verify if [PATCH v14 5/5] breaks anything.  I'll
send it out independently.

> > +static int reset_test_init(struct kunit *test)
> > +{
...
> > +	ctx->rcdev.ops = &reset_test_ops;
> > +	ctx->rcdev.nr_resets = 1;
> > +	ctx->rcdev.fwnode = ctx->supp_fwnode;
> > +
> > +	ret = reset_controller_register(&ctx->rcdev);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	ctx->rstc = __fwnode_reset_control_get(ctx->cons_fwnode, NULL, 0,
> > +					       RESET_CONTROL_EXCLUSIVE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->rstc);
> > +
> > +	test->priv = ctx;
> 
> The rcdev and rstc could be cleaned up in .exit for the error cases.

Ack, will add a .exit() callback to clean up `rstc` and `rcdev`.

> > +static void reset_test_basic(struct kunit *test)
> > +{
...
> > +	reset_control_release(rstc);
> > +	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), 0);
> > +
> > +	reset_control_put(rstc);
> > +	reset_controller_unregister(&ctx->rcdev);
> 
> Could be cleaned up by .exit.

Ack, will let .exit() handle them.

> > +static void reset_test_use_after_unregister(struct kunit *test)
> > +{
> > +	struct reset_test_context *ctx = test->priv;
> > +	struct reset_control *rstc = ctx->rstc;
> > +
> > +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 0);
> > +	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), 0);
> > +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> > +
> > +	/* Unregister supplier while consumer still holds rstc. */
> > +	reset_controller_unregister(&ctx->rcdev);
> 
> If you allocate rcdev on its own instead of embedding it in the
> context, you could
> 
> 	reset_controller_unregister(ctx->rcdev);
> 	ctx->rcdev = NULL;
> 
> here and still have normal cleanup if not NULL in .exit.

The `reset_control_ops` callbacks use `container_of(...)` to obtain `ctx`,
so keeping `rcdev` embedded in `ctx` is convenient.  Will add a bool flag
so .exit() only unregisters `rcdev` if it is still registered.

> > +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> > +	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), -ENODEV);
> > +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> > +
> > +	KUNIT_EXPECT_EQ(test, reset_control_assert(rstc), -ENODEV);
> > +	KUNIT_EXPECT_EQ(test, reset_control_deassert(rstc), -ENODEV);
> > +	KUNIT_EXPECT_EQ(test, reset_control_status(rstc), -ENODEV);
> > +
> > +	reset_control_release(rstc);
> > +	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), -ENODEV);
> > +
> > +	reset_control_put(rstc);
> 
> This would not be required either.

Ack, will let .exit() handle it.

> > +static void reset_test_concurrent_unregister(struct kunit *test)
> > +{
> > +	struct reset_test_context *rtc = test->priv;
> > +	struct test_concurrent_unregister_context *ctx;
> > +	int i, ret, val;
> > +
> > +	rtc->rcdev.ops = &reset_test_concurrent_unregister_ops;
> > +
> > +	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> > +
> > +	for (i = 0; i < 3; ++i) {
> > +		ctx[i].test = test;
> > +		init_completion(&ctx[i].started);
> > +		init_completion(&ctx[i].enter);
> > +
> > +		if (i == 0) {
> > +			ctx[i].thread = kthread_run(
> > +				test_concurrent_unregister_supplier, ctx + i,
> > +				"supplier%d", i);
> > +		} else {
> > +			init_completion(&ctx[i].entered);
> > +			init_completion(&ctx[i].exit);
> > +
> > +			ctx[i].thread = kthread_run(
> > +				test_concurrent_unregister_consumer, ctx + i,
> > +				"consumer%d", i);
> > +		}
> > +		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
> 
> Isn't this missing kthread cleanup in the error cases?

Correct, will fix it.

> > +	/* Subsequent access must see -ENODEV. */
> > +	KUNIT_EXPECT_EQ(test, reset_control_reset(rtc->rstc), -ENODEV);
> > +	reset_control_put(rtc->rstc);
> 
> reset_control_put() could be done by .exit.

Ack, will let .exit() handle it.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413813A258
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791721531; cv=none; b=hdUPUG64BUQK4whSrolb07zoF+LGaFE3TIxhPeNTNpwHAU/JiDir+0RQblc952FYTR3JRojp8MA90C8Su9x643awnMSwU/0D/LT5Yls2lGAmhZEdsNWzYkYOY92VGY5zs7S9XY9jZckeBMR0+wB9Kq4KCtjfYJkoqABdVgcbps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791721531; c=relaxed/simple;
	bh=5INobcra1z4Zonkn/iKlc07WXdTyc3hM0vNR5ACgDck=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NDNI6+F7B4B4MNnnVqbY+dMz27hCpPHuKYB+E9vpH00/bCWkWIKgDRm92BGpRUlvk5OfX0mfBLPcCt9zjHBuvzNYKKgOuLM8wl84OrCrQtyUF3DeLrtqtSxD5Y28F7xfaMkj4Xpd9nD7c+uxJYH/zVgQ6tKtlMFIWYFwAPSSS/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYmcxRvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYmcxRvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D41E1F0089B;
	Sun, 11 Oct 2026 12:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791721528;
	bh=j8UFL+b5VYFX4CqiCLXPQLzqX3Rw3cyazLWcEGqF3Dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYmcxRvQhmdxONVFAtaX2IYJDSemM59/6TpJRMrJ8bdgz/NSMGidqA9Ow54RfZ5N0
	 xjlYS/fX0uL5chVDzuoMSxaYz0hFne24aYjMstno7KfJzAjFPlhIngHgJxaVBlzVYz
	 4Zc+wFpZa9GO1qySnjwhG28HJYTD1htWqY+UaT5kRllYHjhd1CcxuuNVIUb8Lomlv/
	 4U89bB4UeANFGsp2Js6E3pQO2gFsRCJqY15i7sCkYefsPhHf9Vegc4u8ekcbHSVn71
	 qvGaMNg2F/qtXdK4PJrUdKAjSJ0Cyz8xfmfHsSpgWh/yMXFwA6YBZT44HqTlBtbtlu
	 0DdUyf3PepO8A==
Message-ID: <sashiko-outbox-167222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/5] reset: Add KUnit test cases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261011121246.162759-5-tzungbi@kernel.org>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-5-tzungbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:25:27 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] reset: test: KUnit assertion failures cause UAF and unkillable thr=
ead leaks
--

commit 222c19f0c2d0f6b0dadf93fc51cab0de65a40955
Author: Tzung-Bi Shih <tzungbi@kernel.org>

reset: Add KUnit test cases

Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
nodes"), reset suppliers and consumers can be wired up using software
nodes without requiring Device Tree or hardware devices.  Leverage this
to add KUnit test cases for the reset controller framework.

> diff --git a/drivers/reset/core-test.c b/drivers/reset/core-test.c
> new file mode 100644
> index 0000000000000..834556322b236
> --- /dev/null
> +++ b/drivers/reset/core-test.c

[ ... ]

> +static int reset_test_init(struct kunit *test)
> +{

[ ... ]

> +	ctx->rcdev.ops =3D &reset_test_ops;
> +	ctx->rcdev.nr_resets =3D 1;
> +	ctx->rcdev.fwnode =3D ctx->supp_fwnode;
> +
> +	ret =3D reset_controller_register(&ctx->rcdev);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ctx->rstc =3D __fwnode_reset_control_get(ctx->cons_fwnode, NULL, 0,
> +					       RESET_CONTROL_EXCLUSIVE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->rstc);

[Severity: High]
If __fwnode_reset_control_get() fails and triggers this assertion, the test
will abort immediately without unregistering ctx->rcdev. Since ctx was
allocated with kunit_kzalloc(), it will be automatically freed.

Could this leave a dangling pointer in the global reset_controller_list,
leading to memory corruption?

Would using a deferred cleanup action via kunit_add_action() be appropriate
immediately after registering the controller?

[ ... ]

> +static void reset_test_concurrent_unregister(struct kunit *test)
> +{
> +	struct reset_test_context *rtc =3D test->priv;
> +	struct test_concurrent_unregister_context *ctx;
> +	int i, ret, val;
> +
> +	rtc->rcdev.ops =3D &reset_test_concurrent_unregister_ops;
> +
> +	ctx =3D kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	for (i =3D 0; i < 3; ++i) {
> +		ctx[i].test =3D test;
> +		init_completion(&ctx[i].started);
> +		init_completion(&ctx[i].enter);
> +
> +		if (i =3D=3D 0) {
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_unregister_supplier, ctx + i,
> +				"supplier%d", i);
> +		} else {
> +			init_completion(&ctx[i].entered);
> +			init_completion(&ctx[i].exit);
> +
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_unregister_consumer, ctx + i,
> +				"consumer%d", i);
> +		}
> +		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));

[Severity: High]
If thread 1 or 2 fails to spawn, this assertion will abort the test
immediately. However, previously spawned threads might still be waiting on
synchronization variables (like ctx[0].enter) inside the test-managed memor=
y.

When KUnit frees ctx on abort, will those still-running threads access
freed memory, resulting in a use-after-free?

> +		get_task_struct(ctx[i].thread);
> +
> +		wait_for_completion(&ctx[i].started);
> +	}
> +
> +	rtc->priv =3D &ctx[1];
> +	ctx[1].expected_ret =3D 0x12345678;
> +	/* consumer1 enters reset(). */
> +	KUNIT_EXPECT_EQ(test, rtc->reset_count, 0);
> +	complete(&ctx[1].enter);
> +	wait_for_completion(&ctx[1].entered);
> +	KUNIT_EXPECT_EQ(test, rtc->reset_count, 1);
> +
> +	/* supplier0 unregisters. */
> +	complete(&ctx[0].enter);
> +	ret =3D read_poll_timeout(reset_control_status, val, val =3D=3D -ENODEV,
> +				1000, 100000, false, rtc->rstc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

[Severity: High]
If the poll times out, this assertion aborts the test without stopping the
spawned concurrent kthreads.

Since kthread_stop_put() is skipped, does this result in thread leaks and a
use-after-free when KUnit cleans up the test memory while threads are still
active?

> +	/* supplier0 can't exit.  It's waiting for all consumers. */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011121246.1627=
59-1-tzungbi@kernel.org?part=3D4

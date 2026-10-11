Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A84483A4
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791721347; cv=none; b=tZhaSRt+XZTi9Emq7vgFqouzO+DmQizgVoXl31e+EupXExO/8GdYu6enAOcheDY70EpNuoEx4d8jIFz7I9ozlg4zs1l1wJytLbOSbtfHByGVyIVWbmSi7kDIetvhyeNHTI/J4h9ns5nYY3fkXOwsjOqXvZvGR4nhP9RdbztxhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791721347; c=relaxed/simple;
	bh=nOLxF0uJg/JZHTCyKL8cGoJCZV92ip2NM6nNkiCqJec=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Tt/BAslDOTrHhkjnHPC3Ox+7dRKFpfGl+XYYZ2s7cb7ibt3xPP9dk8BxHHgDZGQqRNqGfSFegTgN7U/m8bcvD23QlqKd0ZBmVvY6201JT78px6FF+2zOL59OseQ2ewcyufhVLICCoHBVGBPcBGXv+go78pcSGv1jzkUbd4bFiQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgfRDSGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgfRDSGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5FD1F0089B;
	Sun, 11 Oct 2026 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791721341;
	bh=98YDGFY50mL7IriU0jsIJ8GGE4+7Tpbg1vxliC1BU8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YgfRDSGueN2XTmUoqRG8zmuyWLpaqLRkJlHQWgIVDYXWOqqhUilUzjKagizS8YnlG
	 /jTMae3nsny6lsX3c9AvfqFnZvB7C9pXR4qm+c2UwvxHycRdN9/2h9vX1fRn7Tgc3A
	 PFvQ6JgRZeqAwzgQjr4AEMvLGbohi9Dl+8IDVFhaVcUttDAyG8+2pfardbEC3pEmg3
	 c8vzDvoWfJpVhFzVCg9/ovqa8N9w8vZ7sOYhoJCkyHHZEgALHbT0MYjb/VzmiZ+7pV
	 VhryMYsnEWkfWP/m6RKVnAW4dhP2bUO5uOjPAr3AIkLmYOATqw6KV3YyedsBQ5vOjj
	 cx9mwZQ5FUlGw==
Message-ID: <sashiko-outbox-167219@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/5] revocable: Add KUnit test cases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261011121246.162759-3-tzungbi@kernel.org>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-3-tzungbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:22:21 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kunit: leaked kthreads and UAF on KUNIT_ASSERT_* failure in conc=
urrent test
--

commit 5bce09dba3407560b819288b85de7f22b1f0a604
Author: Tzung-Bi Shih <tzungbi@kernel.org>

revocable: Add KUnit test cases

This commit adds KUnit test cases for the revocable API. The tests cover
basic functionality, revocation, macro helpers, and concurrent access.

> diff --git a/drivers/base/test/revocable-test.c b/drivers/base/test/revoc=
able-test.c
> new file mode 100644
> index 0000000000000..10472303c01c3
> --- /dev/null
> +++ b/drivers/base/test/revocable-test.c
> @@ -0,0 +1,560 @@
[ ... ]
> +static struct test_concurrent_access_context *
> +revocable_test_concurrent_access_prepare(struct kunit *test,
> +					 struct revocable *rev, bool dynamic)
> +{
> +	struct test_concurrent_access_context *ctx;
> +	int i;
> +
> +	ctx =3D kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	for (i =3D 0; i < 3; ++i) {
> +		init_completion(&ctx[i].started);
> +		init_completion(&ctx[i].enter);
> +
> +		if (i =3D=3D 0) {
> +			ctx[i].rev =3D rev;
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_access_provider, ctx + i,
> +				"provider%d", i);
> +		} else {
> +			ctx[i].test =3D test;
> +			init_completion(&ctx[i].entered);
> +			init_completion(&ctx[i].exit);
> +			revocable_handle_init(rev, &ctx[i].rh);
> +			if (dynamic)
> +				KUNIT_EXPECT_EQ(test, get_refcount(rev), 1 + i);
> +
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_access_consumer, ctx + i,
> +				"consumer%d", i);
> +		}
> +		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));

[Severity: Medium]
If this assertion fails (for instance, if a later kthread_run() call fails),
the KUnit framework will immediately abort the test.

Because the test is aborted, the manual kthread_stop_put() teardown loops
found in the caller functions will be bypassed. Does this leave the previou=
sly
spawned kthreads running indefinitely against the ctx array that KUnit
automatically frees?

[ ... ]
> +static void revocable_embedded_test_concurrent_access(struct kunit *test)
> +{
> +	struct revocable rev_on_stack, *rev =3D &rev_on_stack;
> +	void *real_res =3D (void *)0x12345678, *res;
> +	struct test_concurrent_access_context *ctx;
> +	int ret, i;
> +
> +	ret =3D revocable_init(rev, real_res);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_FALSE(test, rev->dynamic);
> +
> +	ctx =3D revocable_test_concurrent_access_prepare(test, rev, false);
> +
> +	ctx[1].expected_res =3D real_res;
> +	/* consumer1 enters read-side critical section. */
> +	complete(&ctx[1].enter);
> +	wait_for_completion(&ctx[1].entered);
> +
> +	/* provider0 revokes the resource. */
> +	complete(&ctx[0].enter);
> +	ret =3D read_poll_timeout(rcu_access_pointer, res, !res, 1000, 100000,
> +				false, rev->res);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

[Severity: Medium]
If read_poll_timeout() reaches its timeout, ret will be non-zero and
KUNIT_ASSERT_EQ() will abort the test.=20

Will this bypass the kthread_stop_put() teardown loop below, resulting in a
use-after-free when the still-running kthreads attempt to access the freed =
ctx
array or the rev_on_stack variable that goes out of scope?

> +	/* provider0 can't exit.  It's waiting for the grace period. */
> +
> +	ctx[2].expected_res =3D NULL;
> +	/* consumer2 enters read-side critical section. */
> +	complete(&ctx[2].enter);
> +	wait_for_completion(&ctx[2].entered);
> +
> +	/* consumer{1,2} exit read-side critical section. */
> +	for (i =3D 1; i < 3; ++i) {
> +		complete(&ctx[i].exit);
> +		kthread_stop_put(ctx[i].thread);
> +		revocable_handle_destroy(&ctx[i].rh);
> +	}
> +
> +	/* provider0 exits as all readers exit their critical section. */
> +	kthread_stop_put(ctx[0].thread);
> +
> +	revocable_destroy(rev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011121246.1627=
59-1-tzungbi@kernel.org?part=3D2

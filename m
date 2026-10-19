Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D54F93C3;
	Mon, 19 Oct 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416738; cv=pass; b=pR8iETJhtDzjf41yC//DNdi4d+ZWV3fenSstorYiOq9ZmYBBOqzbis1Kxqnk+t6qLDLbdAvDKt9ibdM1bjbrpgl3TZ0iICX6Mra6kVW14+90EamAVutIm1ysGrCVJuqCO38R9GekL/q3aQ3rUwaZsGP0eKJqVeZV8UHlpoVPwAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416738; c=relaxed/simple;
	bh=Z34OsUah1XNFr8R6siYV6fJrHjFDYpAmcCLrnJCpRJI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OX28aaZQDjYQTG4yL8fApM5tiE1ittuqKtaJfW3t3ZhJlFezgPL0XlBhbAkh0HuSvYL0Cm20raKXUCf5hAljen7DdB01CZIOie+jmSOxSnsWFxOBtf9blMWYpMuBDyqmuFg4cepUGVxn3CHDFz7/wb74O41A61v3oTzGnOQBxlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=J5+Uw9Ee; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="J5+Uw9Ee"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 829C9201EF3;
	Mon, 19 Oct 2026 15:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792416732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXw4IQiaWZagKS1ZKGBBWhMRb0ktPwfh7kNQCe4QztY=;
	b=J5+Uw9EeJsNMl16Ml+L/u45LquJnBIPkykWa/BcTbvi2lds5quLtDe/cY9y73dkRCD2FCL
	+EZIqzg5h6HUs3vVMNg8TbUy3pICPEMpDXvX0PEHPD2PCGc+l5EXefRyp65NlAHe0JkjTH
	xkOfSz3uHpY1lXluGYrOlpIOntFTj45pyoE7gUx5FfwPZts+uNrbANxMtX4CNBGW8DOJ5H
	Qov5qDn/ICNtuHhg0a3LbjqFf822eUHgzwIdHxaW9H1owJsKT4YSMQjirOVU2fVdQp+0Sw
	sBpHYPWM4VfsltabzE57T/FbT2Zolsr5P+QTkzbu0VMBr9ArO1ua1lxKaoQPNQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792416732; a=rsa-sha256;
	cv=none;
	b=Plo//zXe2s2vTi0FDMykb4ydUSftN9baIRXUV1koyiG/b5H1rX3cChDHf7uopxJcsonnjl
	Fjftbea3J5jPoz0AaB5YXjWD3CoL6IsASF0JlM/awrIWy7zolOK6omUWnE/jgdQ/fmA8dt
	9N+dp9rVt5wyeC0N3CsmQ0Tf4LNDs1kVN5ZntogLkvgkPbIY/+vww2mYT7RRNas5AxgckW
	sagRVz2lG+TWScXo8gJSSW8OlwcA8UYKmDYETrjfKyv1VqK/XrSOnMn1FyG4A5EQ+585zG
	VpROdDyrx+u2SJXTs1VwvEoIzecEQxXil0HKbXJFovnthAF6GI9rf9rm5C8H/g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792416732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXw4IQiaWZagKS1ZKGBBWhMRb0ktPwfh7kNQCe4QztY=;
	b=F8N0jTdnj/CPNhGhTVPhApspWMGNq3KzWIuPK8IQUPpzLqlK2DvyFL/IWWVmyhufGATzuU
	ZD3efx+Ni0kGgpdco04xv86dNJfMLYQv0l0dB6z9be6h1nMkTQd70D+STUY4FkAGE3aALh
	DkDs/1ZKMOwPolUvJDFHkm3VbnNW04C+tnrDEpOzhIsAnfyOxHIrrN9s16DK1G5bbYmPBy
	jGJP8xPRX/pdlILD0uy40GqLOPiyFnB+vmJjh95qQuMGEOhq/i3UrgIR79SoBazkOEnikq
	oWoOWDhArBVHS94XG4oYnQrEkhz1iwl12nynv2D9K6lol9PlDuV1XwMZ/F88vQ==
Message-ID: <986d1b636fc7a96b3c2e05e8725a693a496d2f62.camel@pengutronix.de>
Subject: Re: [PATCH v14 4/5] reset: Add KUnit test cases
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich
	 <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 19 Oct 2026 15:32:12 +0200
In-Reply-To: <20261011121246.162759-5-tzungbi@kernel.org>
References: <20261011121246.162759-1-tzungbi@kernel.org>
	 <20261011121246.162759-5-tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On So, 2026-10-11 at 20:12 +0800, Tzung-Bi Shih wrote:
> Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
> nodes"), reset suppliers and consumers can be wired up using software
> nodes without requiring Device Tree or hardware devices.  Leverage this
> to add KUnit test cases for the reset controller framework.
>=20
> The test cases cover the following scenarios:
>=20
> - Basic: Verifies that a consumer can acquire a reset control via
>   fwnode and perform reset, assert, deassert, status, release, and
>   acquire operations.
> - Use After Unregister: Verifies that after the supplier unregisters
>   the reset_controller_dev while a consumer still holds a reset_control
>   handle, subsequent consumer operations fail safely with -ENODEV.
> - Concurrent Unregister: Verifies that unregistering the
>   reset_controller_dev concurrently with an in-flight reset operation
>   waits for the active operation to complete before returning.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

It looks like the Kunit tests are independent from the reset of the
series and could be sent individually.

Is there any dependency that I am missing?

> ---
> Test:
> $ ./tools/testing/kunit/kunit.py run \
>         --kconfig_add CONFIG_RESET_CONTROLLER=3Dy \
>         --kconfig_add CONFIG_RESET_KUNIT_TEST=3Dy \
>         reset_test
>=20
> $ ./tools/testing/kunit/kunit.py run \
>         --kconfig_add CONFIG_RESET_CONTROLLER=3Dy \
>         --kconfig_add CONFIG_RESET_KUNIT_TEST=3Dy \
>         --kconfig_add CONFIG_PROVE_LOCKING=3Dy \
>         --kconfig_add CONFIG_DEBUG_KERNEL=3Dy \
>         --kconfig_add CONFIG_KASAN=3Dy \
>         --arch=3Dx86_64 \
>         reset_test
> ---
> v14:
> - New to the series.
> ---
>  drivers/reset/Kconfig     |   5 +
>  drivers/reset/Makefile    |   2 +
>  drivers/reset/core-test.c | 329 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
>  create mode 100644 drivers/reset/core-test.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index eda9c698a95f..c7dceec8f58c 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -457,4 +457,9 @@ source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
> =20
> +config RESET_KUNIT_TEST
> +	tristate "KUnit tests for reset controller" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +
>  endif
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3..bb01198d495b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -55,3 +55,5 @@ obj-$(CONFIG_RESET_UNIPHIER) +=3D reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) +=3D reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) +=3D reset-zynq.o
>  obj-$(CONFIG_RESET_ZYNQMP) +=3D reset-zynqmp.o
> +
> +obj-$(CONFIG_RESET_KUNIT_TEST) +=3D core-test.o
> diff --git a/drivers/reset/core-test.c b/drivers/reset/core-test.c
> new file mode 100644
> index 000000000000..834556322b23
> --- /dev/null
> +++ b/drivers/reset/core-test.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 Google LLC
> + *
> + * KUnit tests for the reset controller.
> + *
> + * The test cases cover the following scenarios:
> + *
> + * - Basic: Verifies that a consumer can acquire a reset control via
> + *   fwnode and perform reset, assert, deassert, status, release, and
> + *   acquire operations.
> + *
> + * - Use After Unregister: Verifies that after the supplier unregisters
> + *   the reset_controller_dev while a consumer still holds a reset_contr=
ol
> + *   handle, subsequent consumer operations fail safely with -ENODEV.
> + *
> + * - Concurrent Unregister: Verifies that unregistering the
> + *   reset_controller_dev concurrently with an in-flight reset operation
> + *   waits for the active operation to complete before returning.
> + */
> +
> +#include <kunit/fwnode.h>
> +#include <kunit/test.h>
> +
> +#include <linux/completion.h>
> +#include <linux/fwnode.h>
> +#include <linux/iopoll.h>
> +#include <linux/kthread.h>
> +#include <linux/property.h>
> +#include <linux/reset-controller.h>
> +#include <linux/reset.h>
> +#include <linux/sched/task.h>
> +
> +struct reset_test_context {
> +	struct fwnode_handle *supp_fwnode;
> +	struct fwnode_handle *cons_fwnode;
> +	struct reset_controller_dev rcdev;
> +	struct reset_control *rstc;
> +
> +	int reset_count;
> +	int assert_count;
> +	int deassert_count;
> +	int status_count;
> +
> +	void *priv;
> +};
> +
> +static int reset_test_op_reset(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct reset_test_context *ctx =3D container_of(rcdev, typeof(*ctx), rc=
dev);
> +
> +	ctx->reset_count++;
> +	return 0;
> +}
> +
> +static int reset_test_op_assert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct reset_test_context *ctx =3D container_of(rcdev, typeof(*ctx), rc=
dev);
> +
> +	ctx->assert_count++;
> +	return 0;
> +}
> +
> +static int reset_test_op_deassert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct reset_test_context *ctx =3D container_of(rcdev, typeof(*ctx), rc=
dev);
> +
> +	ctx->deassert_count++;
> +	return 0;
> +}
> +
> +static int reset_test_op_status(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct reset_test_context *ctx =3D container_of(rcdev, typeof(*ctx), rc=
dev);
> +
> +	ctx->status_count++;
> +	return 0;
> +}
> +
> +static const struct reset_control_ops reset_test_ops =3D {
> +	.reset =3D reset_test_op_reset,
> +	.assert =3D reset_test_op_assert,
> +	.deassert =3D reset_test_op_deassert,
> +	.status =3D reset_test_op_status,
> +};
> +
> +static int reset_test_init(struct kunit *test)
> +{
> +	static const struct property_entry supp_props[] =3D {
> +		PROPERTY_ENTRY_U32("#reset-cells", 1),
> +		{}
> +	};
> +	static const struct software_node supp_swnode =3D {
> +		.name =3D "reset-test-supplier",
> +		.properties =3D supp_props,
> +	};
> +	static const struct software_node_ref_args refs[] =3D {
> +		SOFTWARE_NODE_REFERENCE(&supp_swnode, 0),
> +	};
> +	static const struct property_entry cons_props[] =3D {
> +		PROPERTY_ENTRY_REF_ARRAY("resets", refs),
> +		{}
> +	};
> +
> +	struct reset_test_context *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	ctx->supp_fwnode =3D kunit_software_node_register(test, &supp_swnode);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->supp_fwnode);
> +
> +	ctx->cons_fwnode =3D kunit_fwnode_create_software_node(test, cons_props=
,
> +							     NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->cons_fwnode);
> +
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
> +
> +	test->priv =3D ctx;

The rcdev and rstc could be cleaned up in .exit for the error cases.

> +	return 0;
> +}
> +
> +static void reset_test_basic(struct kunit *test)
> +{
> +	struct reset_test_context *ctx =3D test->priv;
> +	struct reset_control *rstc =3D ctx->rstc;
> +
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 0);
> +	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> +
> +	KUNIT_EXPECT_EQ(test, ctx->assert_count, 0);
> +	KUNIT_EXPECT_EQ(test, reset_control_assert(rstc), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->assert_count, 1);
> +
> +	KUNIT_EXPECT_EQ(test, ctx->deassert_count, 0);
> +	KUNIT_EXPECT_EQ(test, reset_control_deassert(rstc), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->deassert_count, 1);
> +
> +	KUNIT_EXPECT_EQ(test, ctx->status_count, 0);
> +	KUNIT_EXPECT_EQ(test, reset_control_status(rstc), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->status_count, 1);
> +
> +	reset_control_release(rstc);
> +	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), 0);
> +
> +	reset_control_put(rstc);
> +	reset_controller_unregister(&ctx->rcdev);

Could be cleaned up by .exit.

> +}
> +
> +static void reset_test_use_after_unregister(struct kunit *test)
> +{
> +	struct reset_test_context *ctx =3D test->priv;
> +	struct reset_control *rstc =3D ctx->rstc;
> +
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 0);
> +	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> +
> +	/* Unregister supplier while consumer still holds rstc. */
> +	reset_controller_unregister(&ctx->rcdev);

If you allocate rcdev on its own instead of embedding it in the
context, you could

	reset_controller_unregister(ctx->rcdev);
	ctx->rcdev =3D NULL;

here and still have normal cleanup if not NULL in .exit.

> +
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> +	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), -ENODEV);
> +	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
> +
> +	KUNIT_EXPECT_EQ(test, reset_control_assert(rstc), -ENODEV);
> +	KUNIT_EXPECT_EQ(test, reset_control_deassert(rstc), -ENODEV);
> +	KUNIT_EXPECT_EQ(test, reset_control_status(rstc), -ENODEV);
> +
> +	reset_control_release(rstc);
> +	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), -ENODEV);
> +
> +	reset_control_put(rstc);

This would not be required either.

> +}
> +
> +struct test_concurrent_unregister_context {
> +	struct kunit *test;
> +	struct completion started, enter;
> +	struct task_struct *thread;
> +
> +	/* Used by test consumer. */
> +	struct completion entered, exit;
> +	int expected_ret;
> +};
> +
> +static int test_concurrent_unregister_supplier(void *data)
> +{
> +	struct test_concurrent_unregister_context *ctx =3D data;
> +	struct reset_test_context *rtc =3D ctx->test->priv;
> +
> +	complete(&ctx->started);
> +
> +	wait_for_completion(&ctx->enter);
> +	reset_controller_unregister(&rtc->rcdev);
> +
> +	return 0;
> +}
> +
> +static int test_concurrent_unregister_consumer(void *data)
> +{
> +	struct test_concurrent_unregister_context *ctx =3D data;
> +	struct reset_test_context *rtc =3D ctx->test->priv;
> +	int ret;
> +
> +	complete(&ctx->started);
> +
> +	wait_for_completion(&ctx->enter);
> +
> +	ret =3D reset_control_reset(rtc->rstc);
> +	KUNIT_EXPECT_EQ(ctx->test, ret, ctx->expected_ret);
> +
> +	return 0;
> +}
> +
> +static int
> +reset_test_concurrent_unregister_op_reset(struct reset_controller_dev *r=
cdev,
> +					  unsigned long id)
> +{
> +	struct reset_test_context *rtc =3D container_of(rcdev, typeof(*rtc), rc=
dev);
> +	struct test_concurrent_unregister_context *ctx =3D rtc->priv;
> +
> +	rtc->reset_count++;
> +	complete(&ctx->entered);
> +
> +	wait_for_completion(&ctx->exit);
> +	return ctx->expected_ret;
> +}
> +
> +static const struct reset_control_ops reset_test_concurrent_unregister_o=
ps =3D {
> +	.reset =3D reset_test_concurrent_unregister_op_reset,
> +};
> +
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

Isn't this missing kthread cleanup in the error cases?

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
> +	ret =3D read_poll_timeout(reset_control_status, val, val =3D=3D -ENODEV=
,
> +				1000, 100000, false, rtc->rstc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	/* supplier0 can't exit.  It's waiting for all consumers. */
> +
> +	ctx[2].expected_ret =3D -ENODEV;
> +	/* consumer2 must see -ENODEV. */
> +	complete(&ctx[2].enter);
> +	kthread_stop_put(ctx[2].thread);
> +
> +	/* consumer1 exits reset(). */
> +	complete(&ctx[1].exit);
> +	kthread_stop_put(ctx[1].thread);
> +	kthread_stop_put(ctx[0].thread);
> +
> +	/* Subsequent access must see -ENODEV. */
> +	KUNIT_EXPECT_EQ(test, reset_control_reset(rtc->rstc), -ENODEV);
> +	reset_control_put(rtc->rstc);

reset_control_put() could be done by .exit.

regards
Philipp

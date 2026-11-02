Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793642568;
	b=3gI3Pl+HqqA/cjvuH8BMrb+7ZXnrZwvlg7iewFOE5HDh6bdtzHaCREpHdJhiKAgbpjeA
	 4+rRcUBWOtEa9utG6WOY0iHlfzG5gWGY/rbEqn2j9uijtWZIC9+YOvT/iDueCpR1kv/wg
	 DJzitbyXXpZXowvl8TIBdx8F0ihE/rx9GMhukJd8HjI/7Sbn3G0ZdnBq8TkF1JL5jX9CB
	 4S3w71W/XxTEBf9G87g4TBQ1raHsxREBuePPO2yHp/T+n1DgGG5wlXYKBKHSFnmFzUe6M
	 QZlkLU+oJMfworF1K7leU2QWxoSK64cqe+u4thGxw3Fj7Yvp4SBV267f5B45jy74cpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642568;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=PIg74deYMNeH2uyI22W0tkLBfg6WDMIMX19eNqa4i5A=;
	b=3meJtx+1i5/r4OlPyQQCB9uCSRiEYbuax3GdD1s4OwMOJWsnpUgKuagOaajUd9xnTmQs
	 JblAPxg52Udb0Iox2mLi5axu7Y3yix6SPS//b2kKOjld3yPQYeOd8RimUTDEmE4B8w476
	 /YdQlRovzfGEEsFbcxyeiV54nTOuE9n5PnzEBdIdazaseLj6X63t2TsgYtn2ss3sHr8lW
	 b5ZNVTqBAJXNdsHjcYKtqkgAMC6mc1rQm6Yfaj5H3kt+9sI+Js4mAw+CJDqTo3BYaZXZO
	 SFmKuqfQz4Qe7CkRHhVE8OGX3DwZ6hYo1S61wX5ANsPrgTfYrrQHMix0NlVHVQfROew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gkcj3PQJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AC606A92A;
	Mon,  2 Nov 2026 18:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864AC606A92A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gkcj3PQJ
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 84C7B2008BB;
	Mon, 02 Nov 2026 19:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793642560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIg74deYMNeH2uyI22W0tkLBfg6WDMIMX19eNqa4i5A=;
	b=gkcj3PQJmUFSDjWPyRU6MKkp+4/UtcNQBbAlGfO38HvSZnbbmrzTzBFyQaSla6OlRLwOm2
	VuI/plDsWKmUdTBPlkBLMyr9YG6WJh/8mlYZmct91flXAtfQwDCJI1yrYkwdNhCO34khu9
	4mvn0xNxOGFzqi9wvUgfGRrtvrpnU/780Qj6r8Io4HiiLKentc7C8rz70x1Eg/GHDbBdNK
	boqbrTnbzFK9YWxzqvsdl+Kyf7VnhGBmkDvEWau98bEMw7JR5sy53DafnlB+Hh2e9SqwEI
	XpAmNc66lnaWNCyABpdsiHiKklAvYAGr5yvwTaDt57cp5H4BM9/IWpBuFs8Waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793642560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIg74deYMNeH2uyI22W0tkLBfg6WDMIMX19eNqa4i5A=;
	b=YT5Die8iwYVlB5Q1w6cE4y7Mb9K4z5FPOZ2mAizEoMoYtPAVPR8hKZiTTaQam6Sh5f0mN1
	NTqklNDCvOe7ULvX8scfoX07rD6O0kXQHC5AHnjVd2lgXjLx8YaR9SBvBujkAMbZyBoa3p
	UnEuZ3ZMvwHBosRWhiYXjWrJrdaOc+ZzwXFT8S89W9c74Mj86woyKSxveWDA+qRxKWTZZp
	kxhkiHWs99O5mk006yIW1YK4kGOjFPh6buBXmQzfy+JfJgmgaTe6hX3B7EGIQ6xqjqYq0G
	NTjNjM0OKD1aE4NtgIACohBMMfhifZKwYFrH9HN+PEg7rv7SC9LDgUY35eHbAQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793642560; a=rsa-sha256;
	cv=none;
	b=JZXxzrhrY62vu3pm2TMwijJSkwzRyw4MoVvchvapzUkQVcKdgVliyxT84pNbE1+h9FTVib
	dmqEAHOr+4m5YvOHovHK7KBecF4hQjSom8oGBBDidraPZOCcj2B/F1E3MUTr4e+zA4156Y
	6CIdgRj2aOqlJ1utjeptojFf7qgmC8ofdWoiARs37wZncgljo2OPWoDRNfaSh4SS8ovOlK
	B9FL5XEX/a38uhHrpEyTfLNYAaH5GLeIsaSNtnb45J4hqpv+b7RFm1KCNyf4Ea/8aKuMIm
	GlzU8afa76lFXWH125cwFKwRmFu1ghAjjY/GQt+tTgSol+hU4fA90Y/cfobDFQ==
Message-ID: <3abe1332fa65f8b901c5e7f66598c46764152f27.camel@pengutronix.de>
Subject: Re: [PATCH v15 4/4] reset: Leverage revocable for accessing struct
 reset_controller_dev
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
Date: Mon, 02 Nov 2026 19:02:40 +0100
In-Reply-To: <20261102161710.24076-5-tzungbi@kernel.org>
References: <20261102161710.24076-1-tzungbi@kernel.org>
	 <20261102161710.24076-5-tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-03 at 00:17 +0800, Tzung-Bi Shih wrote:
> Commit 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
> protected the `rcdev` pointer in `struct reset_control` with SRCU so
> that the reset core can handle suppliers unbinding while consumers still
> hold reset control handles.
>=20
> Because `struct reset_control` handles can outlive `rcdev`, each of the
> N handles had to embed its own `srcu_struct` and call synchronize_srcu()
> on release, and reset_controller_unregister() had to call
> synchronize_srcu() N times in a loop.
>=20
> Leverage dynamic revocable to allocate a single reference-counted
> `struct revocable` for `rcdev` shared across all N `struct reset_control`
> handles (1-to-N).  This reduces N `srcu_struct` instances per controller
> to 1, drops synchronize_srcu() from reset_control_put_internal(), and
> replaces the N synchronize_srcu() calls on unregistration with a single
> revocable_revoke().
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Applied after https://lore.kernel.org/all/20261102155840.20376-1-tzungbi@=
kernel.org
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
>         --raw_output=3Dall \
>         reset_test
> ---
> v15:
> - Rename:
>   - "rev" -> "revocable" in struct reset_controller_dev.
>   - "rev" -> "rcdev_revocable" in struct reset_control.
>=20
> v14: https://lore.kernel.org/all/20261011121246.162759-6-tzungbi@kernel.o=
rg
> - New to the series.
> ---
>  drivers/reset/core.c             | 125 ++++++++++---------------------
>  include/linux/reset-controller.h |   3 +
>  2 files changed, 42 insertions(+), 86 deletions(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index a36a4d6ff445..c699e7550cf5 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -24,8 +24,8 @@
>  #include <linux/property.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> +#include <linux/revocable.h>
>  #include <linux/slab.h>
> -#include <linux/srcu.h>
> =20
>  static DEFINE_MUTEX(reset_list_mutex);
>  static LIST_HEAD(reset_controller_list);
> @@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
> =20
>  /**
>   * struct reset_control - a reset control
> - * @rcdev: a pointer to the reset controller device
> - *         this reset control belongs to
> - * @srcu: protects the rcdev pointer from removal during consumer access
> + * @rcdev_revocable: revocable handle for accessing the reset controller=
 device
>   * @list: list entry for the rcdev's reset controller list
>   * @id: ID of the reset controller in the reset
>   *      controller device
> @@ -54,8 +52,7 @@ static DEFINE_IDA(reset_gpio_ida);
>   * @lock: serializes the internals of reset_control_acquire()
>   */
>  struct reset_control {
> -	struct reset_controller_dev __rcu *rcdev;
> -	struct srcu_struct srcu;
> +	struct revocable *rcdev_revocable;
>  	struct list_head list;
>  	unsigned int id;
>  	struct kref refcnt;
> @@ -141,6 +138,10 @@ int reset_controller_register(struct reset_controlle=
r_dev *rcdev)
>  			return -EINVAL;
>  	}
> =20
> +	rcdev->revocable =3D revocable_alloc(rcdev);
> +	if (!rcdev->revocable)
> +		return -ENOMEM;
> +
>  	if (rcdev->of_xlate)
>  		rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells;
> =20
> @@ -160,14 +161,20 @@ int reset_controller_register(struct reset_controll=
er_dev *rcdev)
>  }
>  EXPORT_SYMBOL_GPL(reset_controller_register);
> =20
> -static void reset_control_put_internal(struct reset_control *rstc);
> -

See what I said about the fix series that just introduced this.

>  static void reset_controller_remove(struct reset_controller_dev *rcdev,
>  				    struct reset_control *rstc)
>  {
>  	lockdep_assert_held(&rcdev->lock);
> =20
> -	list_del(&rstc->list);
> +	/*
> +	 * reset_control_put_internal() may observe a non-NULL rcdev before
> +	 * revocable_revoke() runs, and then wait on rcdev->lock while
> +	 * reset_controller_unregister() already detaches rstc.
> +	 */
> +	if (list_empty(&rstc->list))
> +		return;
> +	list_del_init(&rstc->list);
> +

See also what I said about the fix series. If this were split into
list_del() and module_put()/put/device() parts already, this wouldn't
be necessary.

>  	module_put(rcdev->owner);
>  	put_device(rcdev->dev);
>  }
> @@ -179,38 +186,22 @@ static void reset_controller_remove(struct reset_co=
ntroller_dev *rcdev,
>  void reset_controller_unregister(struct reset_controller_dev *rcdev)
>  {
>  	struct reset_control *rstc, *pos;
> -	LIST_HEAD(reset_control_head);
> =20
>  	scoped_guard(mutex, &reset_list_mutex)
>  		list_del(&rcdev->list);
> =20
>  	scoped_guard(mutex, &rcdev->lock) {
> -		/*
> -		 * Numb but don't free the remaining reset control handles that are
> -		 * still held by consumers.
> -		 *
> -		 * Hold a temporary reference on rstc before clearing rstc->rcdev:
> -		 * once rstc->rcdev is NULL, a concurrent reset_control_put_internal()
> -		 * will not acquire rcdev->lock and could otherwise free rstc.
> -		 */
> -		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) =
{
> -			kref_get(&rstc->refcnt);
> -			rcu_assign_pointer(rstc->rcdev, NULL);
> +		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list)
>  			reset_controller_remove(rcdev, rstc);
> -			list_add(&rstc->list, &reset_control_head);
> -		}
>  	}
> =20
>  	/*
> -	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
> +	 * Run revocable_revoke() outside rcdev->lock to avoid a circular
>  	 * locking dependency with paths that acquire rcdev->lock inside
> -	 * the rstc->srcu read-side critical section.
> +	 * the revocable read-side critical section.
>  	 */
> -	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
> -		list_del(&rstc->list);
> -		synchronize_srcu(&rstc->srcu);
> -		reset_control_put_internal(rstc);
> -	}
> +	revocable_revoke(rcdev->revocable);
> +	revocable_put(rcdev->revocable);
> =20
>  	mutex_destroy(&rcdev->lock);
>  }
> @@ -401,11 +392,7 @@ int reset_control_reset(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_reset(rstc_to_array(rstc));
> =20
> -	guard(srcu)(&rstc->srcu);
> -
> -	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -	if (!rcdev)
> -		return -ENODEV;
> +	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
> =20
>  	if (!rcdev->ops->reset)
>  		return -ENOTSUPP;
> @@ -522,11 +509,7 @@ int reset_control_assert(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_assert(rstc_to_array(rstc));
> =20
> -	guard(srcu)(&rstc->srcu);
> -
> -	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -	if (!rcdev)
> -		return -ENODEV;
> +	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
> =20
>  	if (rstc->shared) {
>  		if (WARN_ON(atomic_read(&rstc->triggered_count) !=3D 0))
> @@ -618,11 +601,7 @@ int reset_control_deassert(struct reset_control *rst=
c)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_deassert(rstc_to_array(rstc));
> =20
> -	guard(srcu)(&rstc->srcu);
> -
> -	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -	if (!rcdev)
> -		return -ENODEV;
> +	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
> =20
>  	if (rstc->shared) {
>  		if (WARN_ON(atomic_read(&rstc->triggered_count) !=3D 0))
> @@ -698,11 +677,7 @@ int reset_control_status(struct reset_control *rstc)
>  	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
>  		return -EINVAL;
> =20
> -	guard(srcu)(&rstc->srcu);
> -
> -	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -	if (!rcdev)
> -		return -ENODEV;
> +	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
> =20
>  	if (rcdev->ops->status)
>  		return rcdev->ops->status(rcdev, rstc->id);
> @@ -750,11 +725,7 @@ int reset_control_acquire(struct reset_control *rstc=
)
>  	if (rstc->acquired)
>  		return 0;
> =20
> -	guard(srcu)(&rstc->srcu);
> -
> -	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -	if (!rcdev)
> -		return -ENODEV;
> +	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
> =20
>  	scoped_guard(mutex, &rcdev->lock) {
>  		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
> @@ -850,7 +821,6 @@ __reset_control_get_internal(struct reset_controller_=
dev *rcdev,
>  	bool shared =3D flags & RESET_CONTROL_FLAGS_BIT_SHARED;
>  	bool acquired =3D flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
>  	struct reset_control *rstc;
> -	int ret;
> =20
>  	lockdep_assert_held(&rcdev->lock);
> =20
> @@ -881,19 +851,13 @@ __reset_control_get_internal(struct reset_controlle=
r_dev *rcdev,
>  	if (!rstc)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	ret =3D init_srcu_struct(&rstc->srcu);
> -	if (ret) {
> -		kfree(rstc);
> -		return ERR_PTR(ret);
> -	}
> -
>  	if (!try_module_get(rcdev->owner)) {
> -		cleanup_srcu_struct(&rstc->srcu);
>  		kfree(rstc);
>  		return ERR_PTR(-ENODEV);
>  	}
> =20
> -	rcu_assign_pointer(rstc->rcdev, rcdev);
> +	revocable_get(rcdev->revocable);
> +	rstc->rcdev_revocable =3D rcdev->revocable;
>  	list_add(&rstc->list, &rcdev->reset_control_head);
>  	rstc->id =3D index;
>  	kref_init(&rstc->refcnt);
> @@ -909,17 +873,9 @@ static void __reset_control_release(struct kref *kre=
f)
>  {
>  	struct reset_control *rstc =3D container_of(kref, struct reset_control,
>  						  refcnt);
> -	struct reset_controller_dev *rcdev;
> -
> -	lockdep_assert_held(&rstc->srcu);
> -
> -	rcdev =3D rcu_replace_pointer(rstc->rcdev, NULL, true);
> -	if (rcdev) {
> -		lockdep_assert_held(&rcdev->lock);
> -		reset_controller_remove(rcdev, rstc);
> -	}
> =20
>  	mutex_destroy(&rstc->lock);
> +	revocable_put(rstc->rcdev_revocable);

I think now we can move the kfree(rstc) back in here?

>  }
> =20
>  static void reset_control_put_internal(struct reset_control *rstc)
> @@ -930,22 +886,19 @@ static void reset_control_put_internal(struct reset=
_control *rstc)
>  	if (IS_ERR_OR_NULL(rstc))
>  		return;
> =20
> -	scoped_guard(srcu, &rstc->srcu) {
> -		rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> -		if (rcdev) {
> -			guard(mutex)(&rcdev->lock);
> -			ret =3D kref_put(&rstc->refcnt, __reset_control_release);
> -		} else {
> -			/* Already detached from rcdev. */
> -			ret =3D kref_put(&rstc->refcnt, __reset_control_release);
> -		}
> +	revocable_try_access_with(rstc->rcdev_revocable, rcdev);
> +	if (rcdev) {
> +		guard(mutex)(&rcdev->lock);
> +		ret =3D kref_put(&rstc->refcnt, __reset_control_release);
> +		if (ret)
> +			reset_controller_remove(rcdev, rstc);
> +	} else {
> +		/* Already detached from rcdev. */
> +		ret =3D kref_put(&rstc->refcnt, __reset_control_release);

If I am not mistaken, this is all that is actually needed from the
reset_control_put_internal() call in reset_controller_unregister(),
just call it directly.

>  	}
> =20
> -	if (ret) {
> -		synchronize_srcu(&rstc->srcu);
> -		cleanup_srcu_struct(&rstc->srcu);
> +	if (ret)
>  		kfree(rstc);

This could be moved back into __reset_control_release().

regards
Philipp

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292735;
	b=DZjg8TDzTjJwg9TknqaGsyuRb/FsB6D6H6TTMoSB7Xe5kw2CNek9UTULwwN6d25G2f7Q
	 5XVPWPdrvMxgVwVIaBr2thG8fJXKAx9GiGSXoMtzY81NPl5pcwacHyfZnhplLCWZv4HJp
	 ytHZSovsEU0wLLFg0E0nYhvADfdW5Vp1h+hBF6rNyqyluZ9QJAMLW9njtk2pVtZZ+xGre
	 ibCWwNoI+LaFfcZLnkiDd7SW5DldCxKgNFQhqtb07vwwJsZ3m5/6AocNhzzvNC2HPazJI
	 J9Bxw25GQqiFkVx6hRPzkFxhiwt0kI0O8D47yEpoChqJImv+kT6gXVT2XpILAHO3ZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=COx1EMgDropvI6Y+yj0hvPZvNLgyLFr/ZposXdUPgT8=;
	b=cJEqk/BZld2iJx4Mtni0yDZzmovXsWijlDAqyqRZp7bcUIjP64lQSYdmyxOv/JYFU7Ie
	 PvVe+DOgjYBSLKMBdkS2M1TFyETaCF+ZHIjTUVUOYhYg0SzFi4e4p2UmqvylxVd+Tj/6t
	 3aUxvsxKNOrCufTSyw1dSmnnJwxbYYve8rngM18CrCCewmDMgotqoMPAfoVqIowiAmeoJ
	 NQjz0AHlo18b0pWLUjqF1LK9CU38GgLL3hlpvc9lhekuop1HPPHXwYiHBxGjwFdb/SzJu
	 GHE8WYpZY8O5J19RB4RaAY162zFFsQ3fLx52IQVRFAfAdpfKaiInyYCwvkmBUTkb5mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsAJCCJl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC28606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsAJCCJl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFB61F01816;
	Thu, 29 Oct 2026 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292735;
	bh=COx1EMgDropvI6Y+yj0hvPZvNLgyLFr/ZposXdUPgT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsAJCCJlYOyZsELlnvbdZRa3KtaYvJZwl+px+SuTM0Y9dJH2h2DB0n8x2M3K9Lt+M
	 mVoPTbMf6QzcUN+1Rf4Mxv7xdtrQMz1ZPo0WHb4lXWf1s4EqDUV3gRBU07IUX8nEJe
	 bn4B+Hz3keNQCsG+l5N9XUejyHoDELBv/iwwEbDdRrLDNEarON0jrV76kZAayoPvYb
	 DaMgMJWhpr3HuRJ1xhRJItkStyp48QLeS6ZA8+LR9P0LhbI+n9K7Qj+0QztLX3DFir
	 FGn5iEdOXg9+F9qtsqled10r2hkFFCKpWkh/eU2tyaF0kgqCX+pyc6EzYnClFiYfnU
	 QWHA4NJZ/h3Ew==
Message-ID: <sashiko-outbox-189687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-3-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
 <20261029-gpio-shared-fwnode-lookup-v8-3-d15d75cd560f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:52:14 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: mix of scoped_guard() and goto cleanup in gpio_shared_setup_e=
ntry()
--

commit 2481d0c90c9615bb803575d8a0c1c3449eb188b0
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: unwind partial failures in gpiochip_setup_shared()

This patch updates gpio_shared_setup_entry() and gpiochip_setup_shared() to
unwind previously registered auxiliary devices and completed entries when a
partial failure occurs during setup.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 47b434db72f1e..043d5daba7a73 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip=
 *gc,
>  			 ref->con_id ?: "(none)");
> =20
>  		ret =3D gpio_shared_make_adev(gdev, entry, ref);
> -		if (ret) {
> -			gpiod_free_commit(desc);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_out;
>  	}
> =20
>  	return 0;
> +
> +err_out:
> +	gpiod_free_commit(desc);
> +	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
> +		gpio_shared_remove_adev(&ref->adev);
> +
> +	return ret;
> +}

[Severity: Low]
This isn't a bug since the scoped_guard() block has already exited before t=
he
loop, but include/linux/cleanup.h advises against mixing goto error handling
and scope-based cleanup helpers in the same function:

drivers/gpio/gpiolib-shared.c:gpio_shared_setup_entry() {
	...
	scoped_guard(mutex, &entry->lock) {
		...
	}

	list_for_each_entry(ref, &entry->refs, list) {
		...
		ret =3D gpio_shared_make_adev(gdev, entry, ref);
		if (ret)
			goto err_out;
	}
}

Since err_out only has a single caller when gpio_shared_make_adev() fails,
could the cleanup be kept inline inside the if (ret) block instead of addin=
g a
goto label?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-gpio-share=
d-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com?part=3D3

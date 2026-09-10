Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE535676A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025574; cv=none; b=o0Uk8LxaB1+rmQA9OIpcBA8a1jFz+VcobZTwix1xWRCIcxpc/0ys045DxwoaGN8ezONiLqIKYxHw2M3KRPYCmxhNxqg1swUGXc/ILTzlSs0rvWp806WxD2jfuvpGY5T+33NOUEDsS844bzbFs1i76K95MUGn25iZeyKx2vIRYtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025574; c=relaxed/simple;
	bh=tqGDeeCw0ZZ0kOz2Y27wv+jzBY8TUXJeH9q+uOekUdw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNRXqdApXhrxv/38mtHCv5DHl/FWc4Fn2TXvN0YTX2n8HhPeoWhSOZxo4MN5uhb6Cumepok962rWKVsXvCrye42dvGZXY0ceVoKi7blF5P1UhJctuQTdyGe//QJ1yx8JQSCVJpxvkJvjHG2jfrimOfBftLX3pSAtkK5qIYlKDcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjFh76Mm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjFh76Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AE21F0089E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025572;
	bh=LGLu7zrAyz0OUeB1ZyR3Xf9SNjyg8yVsXY4ZJ78eRTw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XjFh76MmF+pl+g1urQmrJle8LzlKKcvg/rd4qf/TX7u1TVVtavOwVpayMbBQcmvJJ
	 sGp9FR2GA/TxPwzRsTZ3QDO3XtBEjmLdGNeQzDDnJ3FFZkel4Ls0VKMPll4ClxX88g
	 AnijTvBK4HMm8pF2HLI8n4cSKhRvkt9WQ6x2bVorNk38hMLPAH9Xwqxpx+MauXKM4N
	 kf48lXlo+80D9R2n8oFvU2qS075qu4xliAy/45ES9ieVjc7UZwIjSl6U1/zGm3J1Ed
	 LNDOJY5uNtuIB13xaVb65mstkQcgATcGi4Cit+/hSh7/HPTMD39pN/2kNM0Ac7NuGz
	 8sSzPF4tRG4qg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so9092531fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 00:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7OpIaf+PGfYjL88rW2N4ME2aO1AQy4bLcT9Zi1M7UZY12uttKPnZANS/zOs/UbjZjYgYF+aN7VS3B@vger.kernel.org
X-Gm-Message-State: AFuF++n5pUE5XEf25BXTa9cEG7LpRXSVcYRkudDKb1p+twdlihSeND7i
	ln+Ym+uO2vSSmx6G9Lo3NI+yUkwCeLuFf+or0x++WO0e1T4wIFKaGpUVCK++obv1fbNbQsl0hqJ
	NAzwUwQTiaBKkFwrGUbZ6Vi4Cv4kEXEH20iVXORYmZQ==
X-Received: by 2002:a05:651c:a206:20b0:3a1:aab7:9bdf with SMTP id
 38308e7fff4ca-3a58d33cfcemr4662881fa.5.1789025570943; Thu, 10 Sep 2026
 00:32:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:32:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:32:48 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260908134223.13638-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908134223.13638-1-tzungbi@kernel.org> <20260908134223.13638-4-tzungbi@kernel.org>
Date: Thu, 10 Sep 2026 00:32:48 -0700
X-Gmail-Original-Message-ID: <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>
X-Gm-Features: AcwNN1Um9M2zEZd0yculW6bylHE5dCGPQd89AongUiHY1k1rNNzEAmN8GFshh4w
Message-ID: <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] gpio: Leverage revocable for accessing struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sep 2026 15:42:23 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Leverage revocable for accessing
> the struct gpio_chip and remove the `gdev->srcu`.
>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Could you address the following issue pointed out by sashiko?

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 66d2325bfae87..a7d3c4d9018c8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -898,10 +897,10 @@ static void gpiodev_release(struct device *dev)
>  	synchronize_srcu(&gdev->desc_srcu);
>  	cleanup_srcu_struct(&gdev->desc_srcu);
>
> +	revocable_put(&gdev->chip_rev);
>  	ida_free(&gpio_ida, gdev->id);
>  	kfree_const(gdev->label);
>  	kfree(gdev->descs);
> -	cleanup_srcu_struct(&gdev->srcu);
>  	kfree(gdev);
>  }

Could this cause a use-after-free crash during concurrent device removal?

The revocable object chip_rev is embedded directly in the gpio_device struct.
The new access cleanup pattern drops the SRCU lock before dropping the kref
on the revocable object.

During asynchronous device removal, revocable_revoke() executes
synchronize_srcu() to wait for readers. Because the reader drops the SRCU lock
first, revocable_revoke() will unblock, proceed to gpio_device_put(gdev), and
gpiodev_release() will execute kfree(gdev) while the reader thread is still
active.

The reader thread will then attempt to call kref_put() on the chip_rev that is
embedded inside the now-freed gdev.

--

Thanks,
Bartosz

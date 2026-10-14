Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B4485CDC
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970076; cv=none; b=HR3QZiKvJQffN7FgsH8SOgkeEefGS2/zxhJQOgs1s+DSdXWgrNtOy8ajG9Od4FIDVkhFV6AtCkx4txuzwdw5ogE0CnA4BFHv1BVHkgS5T9rNGjWrMXEq+LBraXIGzOSyZuCQ64FxzIWLlr7ZeLc+JzaQ8Vl6G4cKGSCgE+5HCm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970076; c=relaxed/simple;
	bh=C30qpkaH8LIUhfjK2L/ypTsQTkkn1faO5lFawrOlBuQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRD7eEa3kaUxFMHpsY5tMBZvhVMsSKQoBkuwnkq8it3rDfYXAJrdVJjSR9aYgw/enG0EkyLrgmXy2zMs/HFRmlQBlMHMSWFklpLZcH32xhC02PbRDZF7dGb5ORgvwkxfIgIgxZvuY0NZy3vWWo+6uYSuAHloIo2r+FakPWcayFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQwOAt64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQwOAt64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1901F000FF
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970074;
	bh=3eRZKbn1Ge1Ub2VHoa52iVTY2xAhSDHMuK2JDQBIThk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UQwOAt64FsZuJ0SzlVSyVpnuT5BGDM8UXc6hPx2RaqCuMY6rE/pr9WtEatmJSRE+F
	 m2TBpPk/fMXhsRSv+p7IDhgTf2ZGEWxOSohfifcwqSnF4j1YFVHAYcblCE5yBqHlNZ
	 T8TJC0bivSQPfqqDwndYSWw5AxhCYEuxeNbAFvbd0Z8V26deCkA/Meo48YK6/pb9AL
	 8s72UatVyV6phV9e0n+SiDeOqnwSpWmrkt0jDXIyUQkb4Qtym2fHg4+ci8h83tHAzz
	 HyvamdOtw4JSFtG7soQhYatXh8GB+2M7VlZYc73YPJb8UfmkbnXGe4Kor9mHxCecQv
	 Gk9OcZ/0syGfg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso458917e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 02:27:54 -0700 (PDT)
X-Gm-Message-State: AFq9FYIwVEfQL1DvzeJWGHPwJJO0rAx/3tODvkQ3+okiLdrrldc4i9TH
	0GxffV5ePHflmCMJ/+UOrJ2K20ARMZ2ZhNqzzrjc9HrEBT7w38bbb1GcP1Bh9ziyZlr7/PWHHMj
	VqnGrymFwr8ivxsQDSt0uSrTdzwQ31OoXSl+RPJXIQA==
X-Received: by 2002:a05:6512:3a88:b0:5b8:f94a:4d32 with SMTP id
 2adb3069b0e04-5bcdd536cd0mr4458424e87.34.1791970073091; Wed, 14 Oct 2026
 02:27:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 02:27:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 02:27:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-169821@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
 <20261013-gpio-shared-fwnode-lookup-v3-3-4553c1a7d80f@oss.qualcomm.com> <sashiko-outbox-169821@kernel.org>
Date: Wed, 14 Oct 2026 02:27:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfm9QjRtMOU=9QL+X-9C8wqnZ7-Wf6XU2U-sN4x3V_EBA@mail.gmail.com>
X-Gm-Features: AclHuK8ZHVCW4gWyDkxO68PTSzbMOWefobWxoXTSY5fyI5N8AmKEw56P6jRgMKA
Message-ID: <CAMRc=Mfm9QjRtMOU=9QL+X-9C8wqnZ7-Wf6XU2U-sN4x3V_EBA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] gpio: shared: detach the proxy device from struct gpio_shared_ref
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 15:31:53 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Critical] gpio: shared: race returns wrong GPIO desc on uninitialized =
proxy_fwnode
> - [High] gpio: shared: teardown unconditionally dereferences NULL proxy_d=
ev
> - [High] gpio: shared: NULL pointer evaluation misidentifies virtual chip=
s as proxies
> - [Medium] gpio: shared: memory leak of dynamically allocated proxy devic=
es on error path
> --
>
> commit 5669c21b32e82fcb8daf60473942426be156bbb3
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: shared: detach the proxy device from struct gpio_shared_ref
>
> This commit moves the auxiliary device struct out of the shared reference
> structure and dynamically allocates its memory during proxy setup. It als=
o
> renames the field to proxy_dev to better reflect its purpose.
>
>> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared=
.c
>> index 8c9ac9d933049..a57a2dd5ca00e 100644
>> --- a/drivers/gpio/gpiolib-shared.c
>> +++ b/drivers/gpio/gpiolib-shared.c
> [ ... ]
>> @@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *co=
nsumer, struct fwnode_handle *
>>  	return -ENOENT;
>>  }
>>
>> -static void gpio_shared_remove_adev(struct auxiliary_device *adev)
>> +static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
>>  {
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> +	auxiliary_device_delete(ref->proxy_dev);
>
> [Severity: High]
> Does this code crash if ref->proxy_dev is NULL?
>
> If a shared GPIO entry has 1 or fewer consumers, gpiochip_setup_shared() =
skips
> creating the proxy device, leaving ref->proxy_dev as NULL. Alternatively,=
 if a
> GPIO controller probes before gpio_shared_init populates the list, proxy_=
dev
> remains NULL. Later, when the controller is removed,
> gpio_device_teardown_shared() unconditionally calls
> gpio_shared_remove_proxy_dev().
>
> Because dev is at offset 0 of struct auxiliary_device, &auxdev->dev evalu=
ates
> to NULL, and device_del(NULL) dereferences NULL->parent, causing a panic.
>

That's not true. If an entry has 1 or fewer consumers, we remove the refere=
nce
from the list in gpio_shared_free_exclusive(). We'll never call
gpio_shared_remove_proxy_dev() in this case.

>> +	auxiliary_device_uninit(ref->proxy_dev);
>> +	ref->proxy_dev =3D NULL;
>>  }
>>
>>  int gpiochip_setup_shared(struct gpio_chip *gc)
>> @@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
>>
>>  	list_for_each_entry(entry, &gpio_shared_list, list) {
>>  		list_for_each_entry(ref, &entry->refs, list) {
>> -			if (gdev->dev.parent =3D=3D &ref->adev.dev) {
>> +			if (gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {
>
> [Severity: High]
> Can this evaluate to NULL =3D=3D NULL and incorrectly identify virtual co=
ntrollers
> as shared proxies?
>
> Because ref->proxy_dev is initially NULL before setup, and dev is at offs=
et 0,
> &ref->proxy_dev->dev evaluates to NULL. If a virtual GPIO controller like
> gpio-mockup or gpio-sim probes with no parent device, gdev->dev.parent is=
 also
> NULL. This early return would abort the actual shared setup.
>

This is a pre-existing issue, will fix in a follow-up.

>>  				/*
>>  				 * This is a shared GPIO proxy. Mark its
>>  				 * descriptor as such and return here.
> [ ... ]
>> @@ -592,7 +604,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
>>  				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
>>  				 ref->con_id ?: "(none)");
>>
>> -			ret =3D gpio_shared_make_adev(gdev, entry, ref);
>> +			ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
>>  			if (ret) {
>>  				gpiod_free_commit(desc);
>>  				return ret;
>
> [Severity: Medium]
> Does this leak memory and IDA identifiers if a subsequent consumer alloca=
tion
> fails?
>
> If gpio_shared_make_proxy_dev() fails, the function immediately returns
> without rolling back the dynamically allocated proxy devices from earlier
> iterations in the loop. Also, in the caller gpiochip_add_data_with_key(),
> a failure here jumps directly to err_remove_irqchip, bypassing
> err_teardown_shared and permanently leaking the auxiliary devices.
>

GPIO core calls gpio_teardown_shared() on failure in this function. We can
treat it as a potential improvement.

> [Severity: Critical]
> Does setting the shared flag earlier in this function expose an uninitial=
ized
> proxy to concurrent consumers?
>
> Since the provider is already on the gpio_devices list, setting
> GPIOD_FLAG_SHARED before creating the proxy device can allow a concurrent
> gpiod_get() to enter gpio_shared_get_proxy().
>
> Because the proxy and its fwnode are not yet initialized, the consumer wi=
ll
> read NULL. It then calls gpio_device_find_by_fwnode(NULL). In
> gpio_chip_match_by_fwnode(), the condition:
>     return node && node->secondary =3D=3D fwnode;
> evaluates to node->secondary =3D=3D NULL, incorrectly matching the first =
GPIO
> controller in the system that has a primary fwnode but no secondary. This
> could return an unrelated GPIO descriptor and cause cross-device hardware
> corruption.
>

Pre-existing, adding to the TODO list.

>>  			}
>> @@ -624,7 +636,7 @@ void gpio_device_teardown_shared(struct gpio_device =
*gdev)
>>  				ref->lookup =3D NULL;
>>  			}
>>
>> -			gpio_shared_remove_adev(&ref->adev);
>> +			gpio_shared_remove_proxy_dev(ref);
>>  		}
>>  	}
>>  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-sha=
red-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com?part=3D3
>
>

Bart

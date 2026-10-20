Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502321;
	b=vVBgKrFJ5VrnuMIhPNm6T7VI4MG422OFmkO5980kjdD45heD76N+jx91aE5D91py21f6
	 P54iFmBV/8UsUoH1KMjStG7ftIRzmMlLb85VAigAoBlRBVoygqQKVWrUu24J3PLRmsmAx
	 zbJsNm14GlkZtLCYrpHnfYjrM+oJsW0an9CKpqKc7pEpcdxqYOzVBhknMjTHM+OuL8U5N
	 qou6pbHb9P22Hzdjb5cJYfLLkQycTdL80WnMJ7UovN8auuVgDwyeZZl9MSm2r3ysS516u
	 9lSBs6sX0M0tDySvpTUlFsdv+Ch5Rb0HXr6wSUu+VA0vO6DSdThW4+Yk7kH+KKB5WiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502321;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8yEkH3hB9R1dBNWdijOLIHT3zqHN8svxAFnRjevNIlg=;
	b=AsS2eHC8TiBAeFS4M2EMnJEwkWguA7K/raEgMQl+O7/GNoDpaBwCCxL/LimiteEj8Mab
	 aKg8atLwbzn0+SHQdqlL6aF9XITqyXAY8aNQq6wpapv9H8Zc6umlAHaweXj52vjbNwzQv
	 0ZSXtztrgMtG6fSfmP4TdWFvFTl+KYdzYdMKm9SuRJKTFugmz7O1oKfhL2lql6sZ4u2uV
	 zwOHiltt+MpRzv6KGcRNyZdSXeBfQTEXMrzGZD6hwLIE56McVW2cTKjyssdK2+Y48Bbvo
	 OAW7cbtJ4Iv6SDmjMFcwTkavJ8l+1EKj9Ua07jagUnPy/KMD5yJuy1Xx5n56XLl4svw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4UKXf6f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCB606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4UKXf6f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201061F000C9
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502321;
	bh=8yEkH3hB9R1dBNWdijOLIHT3zqHN8svxAFnRjevNIlg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I4UKXf6f8oFAlvqkPCyoIo02vZPrcvBkkF5lsYcDt17uYDTt6A3bb62nGFp6LWkrx
	 UhqHpxj4pwxMQ+c4tuA51Ymwl7wqkOytRyJNwlTvXsI4HW5CJNHqPZiWDPAWdiKexm
	 hUqSNw9HaQnQmuYC2BZVSOuO/lKvqNKjrekzwuDS84ia1QiQO9OxYwsvuxMWJv+NJu
	 rA5aKE48Pdu5BIi2Ivq9W/g+9iyCe6rXmR5ZxJDi1GuFuOnw7+49oNuwhrXt2PSaca
	 47AK8L/hyR2rttxSn6Ffu1v4cjqOB+aiwrwGsH4c5sNmuHmTuXS86VU10hWLdovlXc
	 NE0Y4s/GYu3FA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso3426051e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:18:41 -0700 (PDT)
X-Gm-Message-State: AFq9FYLxzmypA8A6IjFEigY5BWXnY4yJr6If1pAZvw+cpo9G+nuV8EnT
	tYflikg6H75YmXqTTKmC8XlIbI2H1pj2ABFGYoLGGrrutdeO5Bv1od9qbshS9xDEvl9ZVN9ZmuA
	1otZ8qgzoQxgQGufq6DJ3j9q/+zTFJ6HmomwQLlKp0w==
X-Received: by 2002:a05:6512:32ce:b0:5bf:9eec:c9a3 with SMTP id
 2adb3069b0e04-5bf9eeccd1emr72788e87.18.1792502318705; Tue, 20 Oct 2026
 06:18:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 13:18:37 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 13:18:37 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:18:37 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfRpCs4pz8Jcy=XAtZLiLZjRfmPYYXxA8ARZLCzb_5bAQ@mail.gmail.com>
X-Gm-Features: AclHuK_NgcINKH_hBHt8udpzoQ3v7z8merjc37ePbnHL4pTaIvcwR5b3Uu5Ipn4
Message-ID: <CAMRc=MfRpCs4pz8Jcy=XAtZLiLZjRfmPYYXxA8ARZLCzb_5bAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] gpio: shared-proxy: Fix line accounting
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:01 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Four fixes for how the shared GPIO proxy accounts for users and
> votes.
>
> Patch 1 fixes a race between consumers that request a shared line
> concurrently. Each of them sees usecnt > 1, assumes another user has
> already configured the line, and fails with -EPERM. On Nord RRD this
> intermittently leaves both DAC supply regulators without their enable
> GPIO.
>
> Patch 2 fixes a stale vote left behind when a proxy releases the line
> and restoring the default value fails. The line stays at the
> non-default value for the remaining users, and votecnt can underflow
> when the line is requested again.
>
> Patch 3 fixes gpiod_set_value() to the default value doing nothing on
> a line that was requested with GPIOD_ASIS and left at the opposite
> value, e.g. by the bootloader.
>
> Patch 4 drops a proxy's vote when it switches the line to input, so
> releasing the line no longer fails trying to write the default value
> to an input
>

Thanks! Looks good but I have a comment on one patch and a question on
another.

Bart

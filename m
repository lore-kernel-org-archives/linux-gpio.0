Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA094A99B2
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641112; cv=none; b=OeCcHc4SDBkeqrpomFWrbUrJTz+o0xpm64/NEN3LD6JWvQ5/gpYxkS3XHdGtYfXgsaVUd2HzR9uzpRYCotIh6+09fyiSRvmD0wdTvTc3n//1twZgvhRnhCsfOxFNITSw304p7gonuyT1z0P1Ld/UO55Udl34arWmTb/ew180XME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641112; c=relaxed/simple;
	bh=Az1NTaTuqv2Z4fxUHIUgSUcjzTph0EfLku+jKq4xMGk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2QR/E6/LWTgwbEzJT6jldPw9pXqjt+YvXzufjVYOH1rzOfvNIPdz2ERZhPPbb23j+rIjdRZQILyaSeIOnUa9d/EKqn88OP+E6GC4cbSaImWZfqPTVQDfmN+k9UwKes4zUhSOAfn4d+l0zxXdZuN8oVhNLgYtWN+QKoKWBYwAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yfmw+7QB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yfmw+7QB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1BE1F0089C
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641105;
	bh=X6y0i64G8XR5kWUDmoKYu5is4U9uRtb6q6ksCG34bnA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Yfmw+7QBKwvhgdIt/Pey/q7cKNhwLiGX9VCJQrM5k54TQMMj3qoQXrSTdhh0XzUG5
	 1UmMObj1Z81wzQiSFt7lOxJzzdtF5LqzvuFDbIZPf666rpR0D+gDGv0vweUXnzL/qv
	 3uKrbI+KdTti/XIfwbzrds4CstNiVRElBR52iLMVjHAwuReXcB9rQ9/g5ngnyllEDq
	 3jaVINU5iBAysjrDOuSs+x5UJNB9ul7b04K2RIqrKtj3RGQBvRDw/TfHW8128SpvG8
	 5VVWnkijILlrv/1z+K09HfpO2eYnGC2XP2nM5doNSbcxKAR0Xmv3F3e1WwG7s7D+5p
	 yDYsfeDdMqZUQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so242340e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 03:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2FrChjEyj3Lk5CDkiMX0/YUV6xXpSy56iRUZe21YlVVvRbwKtc7rW9iO9ioUcwx1s1G0PV3dT+q/Q@vger.kernel.org
X-Gm-Message-State: AFuF++ki4xZyfCO30iFHD9xAX77cJW0CBCmHU2TVShoH2nYEn/HKz07M
	KYqxuezbIWobsYenWDSfKBe6J53DCye5Wf6MvEtxYCyzRbHUnQQOSRrVRnok9ObHmIyVz3K7718
	wVAtJawdOtaGqGJN71RBcKgmH3Bi0aquw0dQV26IDow==
X-Received: by 2002:a05:6512:6698:10b0:5b7:6665:1028 with SMTP id
 2adb3069b0e04-5b8ba5dabe5mr536793e87.9.1789641104047; Thu, 17 Sep 2026
 03:31:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 06:31:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 06:31:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260912123529.7951-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912123529.7951-1-tzungbi@kernel.org> <20260912123529.7951-4-tzungbi@kernel.org>
Date: Thu, 17 Sep 2026 06:31:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc-jfNSsGMFOhisSjqj+oTg=F=qshT-PnAj0hNRq1YF8g@mail.gmail.com>
X-Gm-Features: AcwNN1WHTK_ZaQL8Joo86WLcYu_OJK6Bh5z_a4jrWdowNu63hZMOOqCp1G1Hm-E
Message-ID: <CAMRc=Mc-jfNSsGMFOhisSjqj+oTg=F=qshT-PnAj0hNRq1YF8g@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] gpio: Leverage revocable for accessing struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Sep 2026 14:35:29 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Leverage revocable for accessing
> the struct gpio_chip and remove the `gdev->srcu`.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Bartosz: I dropped your T-b tag.  The patch itself didn't change too
>          much however the revocable core changed a bit.

I re-added it for the entire series. This patch looks good to me. The rest
seems to still have some issues pointed out by sashiko that I think should be
addressed. As I said before: I'm OK with this being introduced.

Bart

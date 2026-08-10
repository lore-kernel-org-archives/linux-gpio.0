Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECE3C3C09
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362220; cv=none; b=Qtr52C89lLkLe0kGOv+hEoozsCtPP35YWjE6/F6d+3qwvCEchGMjHFggEGp0jUgwk2ueB7mdv7fToNDiRxHLdeM5+KOdmkeOsnX73doDe28VFEGxZuOCJtJuZfDvF/G+DMT86DyxhigQ8EFANGrPrlOrx4UBSrR6Eh9q9akjJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362220; c=relaxed/simple;
	bh=+JPZbdycNVc4rSOnsH7rJih6amMYNMML+0wb8USk8u8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7OpKtGc/WVzYLw3F05fflJ0OOpV+kYxaZHprgz8YXHG11Hoc1HuTbt+UQmY/26ZfMShQBSQ6Lq0NOoGZg6FtTptDn6ZZVCQ/0UjL1b2erLJ44k+LaEctNx7wAB1XAZAlSrKEOS8NjRAAuWxXTkI+lCTwJ5SKACb2WaxTaOPnMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h48nqk3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h48nqk3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E721F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362218;
	bh=+JPZbdycNVc4rSOnsH7rJih6amMYNMML+0wb8USk8u8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h48nqk3khR3HXx8xSiaieO0PdKe7A5mgmz2nUss6Z8lfS6HbyvJLzFEy67CkAT/ES
	 1rkTafV7lHHtdDxIvJRsVnORtqeqynKRVwq+Ug+4AogSI4e6e8vbcvVKSd2DLfg98D
	 97vUMjpkLTp5qK1NIc90M3Ry0SwJpaydYUIU66C0yfrLTdtIl8n6uptDyeR0irq2Eb
	 h4h7dsJdgAIUcBqhJ5RQLweKvjof/55+MYzSaQa2A4f9Y4A8JazEGiJ7bGWrtfRQcv
	 2cec2kU4tLg1hvng4Re2D+azs9qf6RrPbe0Ap/sWGPCUnjT+7l1D49dsU4nvTYozBj
	 qf/bvJbCSiCCQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c74c469e8so10712371fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:43:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YwKUHuJ7umujrBt1uCEuS/50VnP9BySBN6gq3X7ESHS9SmShrjb
	CI5AnfkLd+CuSHTvP6SdGQtIKEpzo/bkMoqsFqNRn0BbE922zcWO/mucrnsGBan/qL/a/Y0+hf+
	+rSTLnvY7DR4763uMuARsQ0ImjX9BKledFsKEe9LH7Q==
X-Received: by 2002:a05:6512:159e:b0:5ae:b0c0:16bc with SMTP id
 2adb3069b0e04-5b30b770f07mr2764645e87.27.1786362217427; Mon, 10 Aug 2026
 04:43:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 07:43:36 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 07:43:36 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <anUA90ZcyYp9ka3E@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anUA90ZcyYp9ka3E@michalis-linux>
Date: Mon, 10 Aug 2026 07:43:36 -0400
X-Gmail-Original-Message-ID: <CAMRc=MerLCkPNic9jbgs5YDeR377mp3MsbbkfWO12P8WWaq+Mg@mail.gmail.com>
X-Gm-Features: AUfX_mzx2BmelMsi5YIAKeYTlb1_w5XHRSu6TqczyLY2LF95WNCs382yneJ-5to
Message-ID: <CAMRc=MerLCkPNic9jbgs5YDeR377mp3MsbbkfWO12P8WWaq+Mg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Put fwnode reference on failure
To: Michail Tatas <michail.tatas@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 23:47:35 +0200, Michail Tatas <michail.tatas@gmail.com> said:
> We get a reference to the fwnode handle which we pass to
> gpio_shared_make_ref. In case it fails we do not put the reference.
> Fix by putting the reference in the failure case
>
> Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> ---

Can you add the Fixes: and Cc: stable tags please?

Bart

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07383B0ACA
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240178; cv=none; b=l12LxNrWXrmyJHvz0+xMIhx/xld2JdE4nFkrPaNc5wTQgXnHlU0wklgrcUltb1QgKJWnzEJh6JPCfbiN/uZCyuDKTjWFXCNk9is7ACW/Oz1ZhXs+LMUuXEtmIGNAaxSRIhzjM8PRo0IUaCUXmCYI1woWV/9WIEOe99QThC/bfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240178; c=relaxed/simple;
	bh=4KhY2g0Uq9X4AzAqENY/qOKp9uWbBLjCKnpGY5gM8Cw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXOPXCICpoJ3jMuas56Bd6PcSHK0B5rn2aSVf++SQQRk2eESDUnMtftPffnSbO810yNuQZsAM415Lw7/GBQT5W95OnAxBnJMa5T9HqSaT6JZ1UNMnI8m7AgKN4cPQCT/rnS67t7NxZsJI7K3ZmMPj5Bl+TX8+Gu8hXBdtU4Mmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvvWx1Px; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvvWx1Px"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9E9C2BCB5
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240178;
	bh=4KhY2g0Uq9X4AzAqENY/qOKp9uWbBLjCKnpGY5gM8Cw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=QvvWx1Px+/Ji5z9+9syHhWg6rQ6hYV+1d3WKdbWWFd/i/hooXCbgY/luvFdkNke+j
	 v0HckijTxH+1MQs/LdHLzw52jER3OCmJ2U4fYwY9lav3nxzT5GeFSBTAr5ZFo0W2sX
	 wL9VVMdtMOPGx0V4P+8XqYdfLHTyiweZsV8Q7pNvAKfxzVNmjODwNVoB5MKNK2FRSo
	 Wa6jAbeHpLLEKgDszAUUg7By4k00M1x4gVnCfcjYlk0ahBJiUsB5VSCkC23fkc41Kr
	 txCRJykPPQQz32r2Mowf1XN8hJM5pQDpQi6RFK7aAZWgF2hO4nF3iRdXwU8sZ9yvUe
	 UekAx6Ar+P/1g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so7920231fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWKYXrBMHvtX8kgg8FdF5t+Aem8JWGMTZAbj4Y/0vbcE7Fg614PSgVPqJ4D6aMWFenzIUVWFyRBQXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwyeqfBTDqXuXlMOmEvYxB2VG9BMPUpgVWPrnBtlKBKPafjJ9g5
	OQJ/PaGrOsS3cWGXyyYvzqhaZn3YGU31gTZ9A9z6pXfbFMQZ19Y3QyQcKT76luuUVdkxQwybj1x
	OOwgq6mWvwvgnwk2mSoHANuuGs6r2iSDV3Qu/hWbcdQ==
X-Received: by 2002:a2e:a887:0:b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a67fe6ad2mr10189401fa.16.1773240177053; Wed, 11 Mar 2026
 07:42:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:42:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:42:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311131910.835513-5-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311131910.835513-1-antti.laakso@linux.intel.com> <20260311131910.835513-5-antti.laakso@linux.intel.com>
Date: Wed, 11 Mar 2026 07:42:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZNPaPD_1v13B1BWQYLKSb8zKiiKS2H9-ysfAyEDHTig@mail.gmail.com>
X-Gm-Features: AaiRm50eTy3He4v3FQM336edOHk8BCPzxs0CElg7RLW36lwupFwdvJs0mI-g6C4
Message-ID: <CAMRc=McZNPaPD_1v13B1BWQYLKSb8zKiiKS2H9-ysfAyEDHTig@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: tps68470: Add i2c daisy chain support
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, dan.scally@ideasonboard.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, 
	sre@kernel.org, hao.yao@intel.com, jimmy.su@intel.com, 
	miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 14:19:09 +0100, Antti Laakso
<antti.laakso@linux.intel.com> said:
> The tps68470 daisy chain make use of gpio 1 and 2. When in use, these
> gpios must be configured as inputs without pull-up.
>
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

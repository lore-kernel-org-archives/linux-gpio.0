Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334CC3812DB
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183087; cv=none; b=E2SZiw2pcQF112E3Ozum0c9wKqYvCbGapRTnmbdtce8TDEv4l1g6blsemz+lekAtuccDF2TgigtNuNFN4v5rxRkJ8VN4w0D0oLAreJfOmp/9oZOsS4LL5MMJ+Cm1ce463p7NDKBpT7oo6R3k68o+A9AiMftwe6VcLjxEKYy2jL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183087; c=relaxed/simple;
	bh=9/y4BMdNoOHqyIChKtMnQhTq9V3Z4NfopyZ2EReyz8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPs/OTpefRNUtCQzfsUc7Q4WH2X9UYEnYc2oY5NxHjuUFj1wIVEbsZQQoG01FxZ8w3G/GUVnBcdIy32yt7mYASZGm5HVwKHphKZXMwR8TgNqfMe+aqySfipCW/dH6u85f77y59+4FHG2A/BwVoDjjPVP6RwWEHRMju8dgPN7y7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdyQOwI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdyQOwI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8A91F000C7
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792183085;
	bh=9/y4BMdNoOHqyIChKtMnQhTq9V3Z4NfopyZ2EReyz8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UdyQOwI00BNVaK8zpEyfVU0R9pANc2aLphd2sKSfg4VOaHvQJxB+ufYywzyU/rDLV
	 TXZYXO7tnHdQIjxu/8EnqJWx9zm+wiHNulhAvIz42D9r9TTJFDb8IE1TI2Gga46NMP
	 6GMS84tC9Rlp0umc3mVPLkP4Ohhp3Vt1Wv4epyfOVXm1QYz06L9BYGv1elUZdd/aHz
	 YGIMgk2A6RP5eW2YvOKNMYhrvjnyHyLPvxN5/uTihwYuUbznieQA9BDvOIYUhCCblD
	 /GMun/X0iP00hwcTiX6xgYn0SlyhrXkV1yr2wVXsbewkabBUYQQEkH8QmW3nwBAlk3
	 wqqjd8yeeuoKQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso1453436e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9qKG/Kl2kb0pkLweTg8pLExtEp5FRp68WR5ZHUaaUQjnnRlMPFGU/Yk2p8ynoC4xM/ci9g9TeetOK@vger.kernel.org
X-Gm-Message-State: AFq9FYLZUJJ542ZG1SuOTZ6mO2oWpVRCVJhAd4w/b+0a3B9YSBbMQVDY
	xBw0AB12hu1AcxLgduvNjtNCMZk77XD6vK+iw8fAX6ElWP6FAUoOiriNJs077dMikPv5z3BTaGj
	nueZF15rtV/fXTUagFORFX1A9ZxifCPE=
X-Received: by 2002:a05:6512:4011:b0:5be:409b:9456 with SMTP id
 2adb3069b0e04-5be4792d63cmr1449387e87.34.1792183084660; Fri, 16 Oct 2026
 13:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
In-Reply-To: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 22:37:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrV97V5NKmdM=7Fk0wh8LEryDYEvkf7vQ4oxuTU07TWQ@mail.gmail.com>
X-Gm-Features: AclHuK-mDzl7GkIijDMv3CPRStcJneZuEg2L22g53JRLaFWKnXUdSjKw-gE8VrY
Message-ID: <CAD++jLmrV97V5NKmdM=7Fk0wh8LEryDYEvkf7vQ4oxuTU07TWQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: cgbc: Add init_valid_mask() operation
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Werner Gartner <Werner.Gartner@congatec.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 7:13=E2=80=AFPM Thomas Richard (congatec GmbH)
<thomas.richard@bootlin.com> wrote:

> Some pins can be reconfigured from the BIOS as alternate functions,
> which makes the corresponding GPIO lines unusable. Add the
> init_valid_mask() operation to mark as valid only the GPIOs which are
> usable.
>
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com=
>

Sashiko's review looks like nonsense, this is good to go.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

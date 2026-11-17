Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924220;
	b=i4xrNl+CrjVZj+ysMFOCxS0mjMJEV389l2R715EF2hVkumm0b0FNFDxeDNtTmAaB4gVk
	 Up53q74rkwgt61Kg0zhmETFKHPVGzzQhE+rSQAPNZUYGbCfzHbPDS/Z60tI/S52Ng7loU
	 ynztfHG12Qqn5e3o6uqWc0pLxQ/uPTsAs9TPhtUivvWGmsFtaLPtSQJtupWPcKMPRMygU
	 0WMveFjuwYVi2bLizVPsZOQy5tN9h+pV0CUHiRzHy/bPOWuXxi3UNsA1usIR00mH8t7gJ
	 yVVX8WtGvQTgLvAhfNihcUZkSNanRXvgCa5hUDU3AhOyw+wQ/GunSWAySnv6adgijyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924220;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ep7ekAqZFEuBLbi/Y29TSWVjYPWPHKoBWHpbvB4WggM=;
	b=zRI5uUWgpSDfILnP81UV69mZfAeJlaa/yQpsupt43tP8vvbMob38AVxtf5yJ20/3iB0b
	 MdDKBf9pFdDrh7rVQHSCbph1vB/OS2MAcNqdyCX1zHmrWku4qid8jwAl5zxVqMsI4DbwA
	 h2VpiX7dVO4r4Mqq4Py+ix2qTJ+JR+vwXt8qf3UYUmVToXqIhhmhGDZRTN3kjUMVD35gt
	 4UVihAdjBq9KJVRK60GvDFHAmzLIRc5ZykPoMGMVDrknUqrHcjPOw/RcNMdEf44YzFenI
	 tQBH1hDB1H/dcHKzTGTuXEFoENNMjxOOmFHDBfM4sKI6LoGX/Jn5j4HNNDEgiiLPJsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsDJRIxv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76746606A332
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsDJRIxv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546101F000C5
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924220;
	bh=ep7ekAqZFEuBLbi/Y29TSWVjYPWPHKoBWHpbvB4WggM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bsDJRIxvIYsfer5z2cHlqe7ukFERinuCny/wBVIPvOh7gUr0bdJHzMeD1xRnofVy2
	 spgUzFfHByz4ArkGXgQO05XEp41iNPcYiivQU1JBB7m3ZK235p47mzirzfpfn9X7U5
	 Z9I25vsSzJzKlVT0Ay36o8VL3mMxv3RYXPbgd+pcbLWWVuzL5ZeHgqYDzRZIsM/lyJ
	 pPrX6PBiQnbkkop7JcP7gNV/3aJZljhp8ZQJEumKGIkJHVvrvYM8Iw3+lktninNKk+
	 D9NkinOt9u562QVro73HMHAcR4usTdLJQ6pcRTzZOAmUEnTRAUAv2ujk26zipMKJA9
	 MrBfmbMndsoKg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso4181781e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:03:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzOTrkVj8R8HPbR24mKjCwvAhn8htwy733e2lVN/qOPcg5EveMnJU/x50v43aqEGKJcXUQ0kMX0e2p@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ib7ZaS55ytTyWv0Xejsom5PHz2+0XrqLEeQsyUXjb3K9AeQVE
	0biSgKU9PxlhTie/dkUHYfs0MQzRPWGNrUmaEwF17CimeuvINX4+kpr4ysyB7yrtqTGw57Rtb7p
	62M2MWwFnK6R2YAIM0a9UVk+ZAVIfZbA=
X-Received: by 2002:a05:6512:1591:b0:5bf:b144:fcbd with SMTP id
 2adb3069b0e04-5c17079171bmr5441932e87.42.1794924219160; Tue, 17 Nov 2026
 06:03:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
 <20261109-gpio-desc-flags-atomic-v2-1-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-1-c4c54b476628@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:03:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=-tshm2Wezg76r7itfKmb81pfoZfUH18WmAQt+ZM9uVg@mail.gmail.com>
X-Gm-Features: Aa3M54oq5YddyEW92v3s6tYSNhWqafHE8PHZGaAbR7Lra9sfb-qzvBmZqbaVAEA
Message-ID: <CAD++jL=-tshm2Wezg76r7itfKmb81pfoZfUH18WmAQt+ZM9uVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kent Gibson <warthog618@gmail.com>, Adrian Ambrozewicz <aambrozewicz@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:27=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> gpiod_get_direction() snapshots desc->flags with READ_ONCE(), updates
> FLAG_IS_OUT in the local copy and writes the whole word back with
> WRITE_ONCE(). Any bit that a concurrent user sets or clears atomically in
> between - for instance: FLAG_USED_AS_IRQ from gpiochip_lock_as_irq() - is
> silently lost.
>
> Update FLAG_IS_OUT with a single atomic assign_bit() directly on
> desc->flags. The earlier READ_ONCE() snapshot is only used for the
> open-drain check and stays.
>
> Cc: stable@vger.kernel.org
> Fixes: 2559f2e09211 ("gpio: reinforce desc->flags handling")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

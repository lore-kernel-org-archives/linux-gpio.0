Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218605;
	b=mKcmVPvZB4XUQFYgyGEejmA6npGIFKx0c++GXXyrtfBmPuDdx+JDSNs1xX+ZW+O5/Bae
	 tU46Swk/4ZnYH+xpj/ycJsHKeOcUmy6vx/xq5QX+h+1AQFiMvoqEmQ8+8xvYU4KBGkkJs
	 VrcBrioQarkYY9lHtktwJU9Gt8Q5XpJCILNDYeUo18umjMBYtPZkpwg1pwxQ/r07IrNAo
	 v/3e9gOXDdWzFHSVRpGh3Cw9Ftj8Tp4FO40OmUncMDqiRLG7W8hfOszpBc4fGUDnCHFtM
	 7LMt/5Cn2VsPMyKYyp+zLy9m5dv84A/9Vj6/wyivW+FzWY6A4H57mcUU3CL0UGTqEqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218605;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	b=QiBdfW401yMgiEziQ+zt8a0qDcXH3S0e9ELE+LFVMZfLYfQMMvoeSjaY4vx7zwhLsnoW
	 Mc28oUR/TYHTYD98htFTZEblM3x63DJjmbBf0We5oABbqJR/0hi51dxCbdZwut97lGDJe
	 kjeOV2ObPrbAXdqLViwEn4GXXjMeWgXFWib8PiHaY0+P8IEp/xAAfqw3MYCOCg2JPS2ps
	 xWtBWXRhpLk+DRz91OT5arTdEHhPvz4gNGKQEluDy8nKOEZsSt9OOdxTF+qw2MJV1UVqZ
	 poPZG4knQAN1xEhRfMuetDw0AuLayHMEmSlcgNOKopKaEvHlQytX87A6ZAL59iX6Ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98C606A322
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33F1F008A3
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218604;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FQ2hdhMZcO6AGFgMNJp/lVLguvcvHaZa3uXWT7s5DsP1SttkW9dE5QpKsoTek5aaP
	 RULhUZmZ3WDFpqr11avePvyRG9n5GwiC9E4h1PjYQwKWbnksZ9K4DiB2nuSzXdgDLR
	 AOBFdMhtPYZbd2fN57nU8B/BYh810KkOFIKcB+bg25NvYzxXUeStnBF8MoIWqzJXz1
	 UnHS3xJ1K1nKQHj7rOwBw2cKRQEzu5r0ptuj5xbLSWdTH/XWXSEy4QzHYdeTh3yQiW
	 L+q7geLr/1AMV+3vkA0t7HXQjEIoeU98uVpdN3TJtN4Hr015oWFPOy1LRA1GrMVM2f
	 Uxl8u8NUE7v3A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14f6f58aeso466443e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 02:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1MmJ46evpqmhvFKnrOfhiKg4MFqusbhC/2UG+s/aQkVqi02e12XzztzQHOfydsiR/QYKzdCt5NFQM@vger.kernel.org
X-Gm-Message-State: APuU4Z8H8wpzKOEdW3tvnMg6RCyJzdfEV+pP7sTWlW48AFdaPAi19HGx
	lvV4m8DNlTpBepvL9/i6RWmISt5w1PCpEYeA0VG6ETtwCEG1y0CrPQgG5SZOuu/Za2DVTgn2V3s
	1bPmwM4pB9919vi8jg2kGToddNW6vJUo=
X-Received: by 2002:a05:6512:10c9:b0:5c1:4bbc:45cf with SMTP id
 2adb3069b0e04-5c14c025163mr1024453e87.48.1794218603167; Mon, 09 Nov 2026
 02:03:23 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 11:03:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
X-Gm-Features: AclHuK9wM-_UwMl9vBffN1vrF8BaWOktYDbxaBWF1nkFxTvrjySApEcGDJHKmVE
Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Patch applied, catenated statement to one line as requested by Andy
while applying.

Andy will deal with patch 2/2!

Yours,
Linus Walleij

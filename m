Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798301;
	b=yysp+67sVNO1rMFZLQrjwC9N6BI9JmlA+bIc6ddjLolfFVVvkeVaSY7FSRj2UzPnhT09
	 +QXomHIAWe2PNNCXyrCpc8MXR4wpGgQR+ylGCfHxj8/EUrQXdn5pr4IjTypR+QWCy8zbt
	 d6Q73rTZh2k9eY4OkcCX0VUDqugWAWs7N60dhJ4HwTwX5t0mxgj5FvvNjFgaIBOJFY06v
	 yp2H+gTkdLZdWm8T7G0KTm9qqdtoH2Wr6VmMm8xpYaMPz8mM7uVdWXhKLgUvrYMGF7ugf
	 ddYHax4pZhb5aLgyRPtLMz3G5RXl3N+qB310iYdP3FFNbONRxri6KAmM6RepmksKR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798301;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NPXU/obMUBqP0IqkPu7BFvn6MXqdIXuThZBQod4m2fs=;
	b=kGGSiGry34PvXQUSP36KMl46+zC8nvMFD31sPu/RFpqPVXZXS2/0lMCp4fKMATPORx8x
	 8Y4rIvDecTr8b8fesiL730RqmabgLRCR97NtQH8mPDQcSCJQxZ0G87IdhMFxbPXvSOsf0
	 u9BWCYbYXcyaJrtz/UunlIBFRy/36VXBgh4Vr8B2MPCVp4Fl9SToSBHId9at9tdVOvupA
	 QIwKMAkyycKLFK8eJE0tGNwRctZoXBmspd4Gj3OBBLHoAr9tKa4BB85fVCWudvaaE64B6
	 msZgB2Usgs2uH2j0o+O4hoRLZ8wNILIi6xrw/oVbeHIrGeVvTjyXZRLZO4Mem/VnR2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M89QJ0U3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF21606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M89QJ0U3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE6F1F00919
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798300;
	bh=NPXU/obMUBqP0IqkPu7BFvn6MXqdIXuThZBQod4m2fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M89QJ0U3H9lg4HLLcIlNvpm2przatOINe1OpZoTn9qaN/dTB780kKx6Png9tISysM
	 rYaa98oxNgVHAfEKhh8o/TBjlNE8KWIwNrOicJT3PJ1ChvqiTh5Uj36xVGG/hYOFgm
	 h5Z2otqQGhfjz0K0sZHxGUvRc3bNAIyCOXm38AwCvsTwvvZt4QtPgUxVru9ExhyFtb
	 FRZ2kXRD/+Iab/AAQRIT8k0aS6KVMh+vG9Psk6h1+bM8B8RbPt8HEk9ZoSAdv8uYby
	 rsUuL6RVgOgm0lDUgjkOqlVOsE1DSJMq6PmCnKJxyyU9fwE/zNAMl6cQv0hf9O0v9Q
	 0XkWL/UYRPhOQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa686881fso483357e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:18:19 -0800 (PST)
X-Gm-Message-State: APuU4Z8w8S40JsvRjcLbn9OUZS5W6a87+SulzJvjo75+syY8LWz/X4yL
	j7DZoeNRZYHDEr7Oz1PKw4gYXvP+K2a8zvNKVmrbC2IdPSxbJjNaCX5UDKUATsTkptcCCR8pYDu
	Wf+XeeIN7Hu31q7dUjZ3TYcLfpvPO+wY=
X-Received: by 2002:a05:6512:6cd:b0:5bf:c5f6:cc03 with SMTP id
 2adb3069b0e04-5bfd9593dd2mr5361279e87.44.1793798298850; Wed, 04 Nov 2026
 05:18:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:18:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLkNAiGgqhAe50Vk3RiMT6=QvrHKpQ65VLPb8wzecYHHBg@mail.gmail.com>
X-Gm-Features: AclHuK8SoP59qstHlAk4pb65hAMtLi9R0aTy844OqEZyfGGyvyHB6TDdbxN4CEQ
Message-ID: <CAD++jLkNAiGgqhAe50Vk3RiMT6=QvrHKpQ65VLPb8wzecYHHBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Put stubs in order in linux/gpio/driver.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The stubs in linux/gpio/driver.h go in a slightly different order
> than declarations. Put stubs in the same order.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Why not.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

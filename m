Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416292;
	b=J261faKBf6y3NJJHnlxU6xDkPxKxocAk/Y6P+egbCjHa9lZhbeGhyylZ8RqpKJR/nHTv
	 sqFaDXRVJwC/IkxthlA420BROZNuB1rrwFjpS6HbRfPt4E0CWstJVoVll15GQd3keX9c4
	 HljJZXdjFtbZwh5Xs6eYPL8YEy06SkwjudLyEaqyvGOJE6ZmwAB7p0oAVQXQuwQ6nLfAC
	 FjLAN6jCTS1Fv1zhrnNCP10vIC4mN11MO3NtNavkfTY8o/e6TOKfRmy/3ybOVibgq9/UU
	 zQyn6FBnkgYGY2oIcGX2+k+98H1aQeS5mU3WV3CyAKBZ4UnWJw5zrHJusVZWRejcHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
	b=QTd472LT+rUj1y3ysJ15YHt8gdf+dmfj3C2h/VRBd+blApd6xo4FNTr7nGRrPb9nCZDo
	 akZV9zgYFVTVanqmL78IWD0TnBJtyBFEIRIQKId5bYsdsUnwVqvd+9obSDqqPiQv4KJEU
	 fbb+zsY3ZMOHxzOrbXDp/4qd7de6jbw3CY22SgnwWQhNNJk/nzYuZRsZI22Rn5rYALnDl
	 75ymDhuWDxTA9HhOcCv+zZeiBFxh1WreIlvRdVGAWJwkJL9BlFMfjaClV1nwu5txXbWjE
	 UGquzZjjapcx6bomM9bzi+EYNuRBuU40KZ9t/6eZ36d5cTHRb9D/OTqvtjpEpeN/osA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB62606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so2123017a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 22:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416291; x=1796021091; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=j4o2xYsGh3WF/JUZQQOuj/v67/PWJ7hBi2FsjvLLsZtbm29aHoYdH0NO+RcHpADiGL
         2dvXRLuk5oNLY5e3J5y6E54Umcm0YyNsO+tBVTYSYc8Xa+Jk/uS8g20d6XOSmM85q7Mv
         OOvTfnX7Egw7qPncqmwIy1jdpRDl0/Prkna0hyc/JYVrKiNwRkwjCwV3C6XJAL+vV7E7
         rmefry0U/PqpRQnG2xXtfNfXYUkv1b7CidqpNSjO077yuGBXMab68jiF244vxAbttmAO
         b74JQzwV1UZI8H2QsIDxvyqmNgfBnWyrqPslKLrBAFY8wGlBVH7Oxyb80w9pFsfby4Ex
         UGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416291; x=1796021091;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=EuTw8+mm2ByyADCxCwOfZBbXoiy1rsYMO/3MxFXjOKPvFLXCqEQFiCmiQSTovWxhts
         lt2i5K7lGvIyZD/jMbiTtQOXoVgvymd7J1yuTY/a/t2uqHeLFv3Qxz31V3puCjJ/ULg7
         JKLQXEEIAZ9WldH1zS8rjz/niam7Nonblbpqay5sk3pcqOvZK8/XXpNSDyRU61YLR8le
         jIEVQjUyKVpIEhD99cw84QiD75B/UWja3sVJ5LgIW9L7xHGlLIJaKlPxNmqSCWcXfM1L
         lfXem+Vlyqfplv+2ZLgpEvjyZtIZcbKWEzxq/iGod9qhtboEx6EoLN31t3LB9DspZECm
         pHNQ==
X-Forwarded-Encrypted: i=1; AL+hErE5+eltqyLzE7mBtsU6vC7H8RA6pi5x7g4XdoBbGGFNXb/b1LGiciW3AyAMP38a2Uhythi77NWaUwp1@vger.kernel.org
X-Gm-Message-State: APuU4Z//jW5szukC67Jhm+BDEyLfdCX5kyoenWqyF+VQsBC6jGpKHqv5
	qlgP3eQHm8KkkWs+gnFxhYffn/hBG3MYRnx5yvTR7vMTOgpr21ZE+gh9
X-Gm-Gg: AZFdTZfu0QzdN+sJsaX+BlIf9pXS1jxmDlIDfZYmNe99K3qiHJgeOvq4065Bzu95CV4
	JjK9PvShlibM2SFBsiBj5vU7uYK+6BHBT7vhG9q0dIz4SHEuqcMGoxKgtsNCeRX15Kws2qBrN87
	7m0a0VCI7ACcAfsOmRL/llfkdUQxiz2RmB7D80TfI7KYMuN21xwHyGYue+w8c+C+KT6VCbL6j0w
	396/HyfusnnLcfHV9tNvuUmEFvkq6uOSIf+HQousl5W7ZeFm74ITnT5BHFY13oOmVf5ZfbodO50
	0uFIDCPdWk/FSVZ3NCsqJZY+KANEHRkMo4mndYIH4wR4Tzm3sjLYXUzpvaQr3/cwQmUcxZ3/XMd
	ZHSSknWpEo3zuzdUxrafUUodoB0+74tVDK3VaDE+ux1p00/KOkqM4KtcE5vVCD8M2HAtoJfvA7v
	KDM8w0mYoW9UI/VM5BRhb3b6vS3ihhTMbd+8L4yP3t6RL4+Sry/+svMOv0iqysGIYjhVp05K/4I
	/nv/biVcW+ZCNqCZfFoKlVC6o0D6PgytCTHjpyXEq6sXWn/4CPswRuQM4Blk9tiNb+shB9IXOs3
	WSpCwc3knrmZ7TlHziAq2XzHAjL7m7wiu8hiUaHQTA40BrhJ+gMvHviPT7+beGOduURzKQ==
X-Received: by 2002:a17:90b:224e:b0:3b4:f92:ade8 with SMTP id 98e67ed59e1d1-3b41c7e1174mr10446536a91.7.1795416291007;
        Sun, 22 Nov 2026 22:44:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm17835023a91.5.2026.11.22.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:44:50 -0800 (PST)
Date: Sun, 22 Nov 2026 22:44:49 -0800
Message-ID: <dea00f90c205f8359baca729d8b0f31a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static device property, drop legacy gpio API
In-Reply-To: <arzKNhmoL6yiGrzH@ashevche-desk.local>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <3a51385d-9649-4bd7-87b3-0caf9e462b2e@app.fastmail.com> <arzKNhmoL6yiGrzH@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Adrian,

On Wed, Sep 30, 2026 at 11:37:10AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 09:23:21AM +0200, Arnd Bergmann wrote:
...
> > The patches look good to me. I have build-tested this with the snippet
> > below and my series from
> > https://lore.kernel.org/all/20260907090956.2825703-2-arnd@kernel.org/
> > to check that no use of the legacy interfaces remain.
> > You can probably fold my one-liner into your last patch.
...
> > I would guess even with access to hardware testing is going to be
> > challenging, I noticed that the defconfig kernel does not fit on the
> > 4MB flash any more (even without rootfs), and the USB support was
> > never added for rsk7203, only for 7264/7269.
>
> ...which induces a practical question, shouldn't we just drop the whole thing
> for good?

Gentle ping on this series. Will you be applying these patches (possibly
with Arnd's Kconfig tweak folded in), or would you prefer patches
removing rsk7203 support altogether since it is not working anyway?

Thanks.

-- 
Dmitry

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361063;
	b=KrwEjCJHQJ24uvY7am1xgiAiZMVFuzn0EqisGJbZe0iVq1QyZ/g7GwcBxLDYxnFlQbzl
	 E6YP7qJi9ENlODMLM4au+Hz7dkOEKdvse/8rDQh0mXRIhAGJN/mpcFtcMpJuKUJu7nZP9
	 jKnUxnOAaw7HXLfTxrr+H/H43czT20Hj2ol6QovhmkNzqRaEk17mTqoGQbGjihO3vbP6n
	 eUTBnP5qCd9RnhzF1ctcW2r+uIjYGqFagQrPF4V58/Jdlde99NVzitgLsxk/xacSRpMJX
	 dvFcD95PzWe1uKX6VnpEu93UUIHG5wJTBNEHzI9QR5z7dS5TcMwsVF5J3Tigf/xE3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=d5PLHzh/pcXIF3jGw/TubwEZB/nzV7oeGoYggO6jhU4=;
	b=r7QbH5hcfSI3l6Pj87wHggLhHbEriHoReJnvOquHrZT9ToTtTX6a3Y3wtoHtf2dYdjXr
	 9g6ZHdJcv4GrvpiOTs3VGl6bQLx+K8jRGOOqp0kL1q1c9tOMu+P9G+Dpcf3Pm/NKFm0bT
	 6jMGQmfxY2nx1AwPNV4asUVLDw9hXOemGN7PTP0UbEYaGd58v9Rf4Bf/c0FnUy79kW4hi
	 9yStrqKtn/wtg4vP6Xw6P6uMRTgin6MbbqWb0cnZ/Mogj0WCu/yqxZcTAcpbaPcQ9oO9b
	 FWR05bSRor+VXVUlnorQOaBfM2/+HIScBnaY2WmvY3P6lR6Oi97b+qqeG8Wwmf5+vDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeVZLDX1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3308C606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeVZLDX1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D43F1F000C1;
	Fri, 30 Oct 2026 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361062;
	bh=d5PLHzh/pcXIF3jGw/TubwEZB/nzV7oeGoYggO6jhU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QeVZLDX1ZDAN5gJeMDPzTHlTuXW6pCofI7m760KXgGC4fajLesgfYBozvsZMEHxj1
	 zpiaenREF2bdDJS0NOG0cM81JoLjJnZ4RVRh/rtwLSkYQdaA2FdZ68vbydZSBJYzL+
	 qk84tpY/XWaIEviofvQiLGHgaBxLjoJVL/lXDNTBp7QS/qopX1vVBnlJ/14J9PClQt
	 wlgZHybuLqV2J0GAqZiiWh+5Y3GBXLSEfvy+X9TQqzLhQK09iws4qIV1+t1ivjEIb9
	 vB1XrbEGF/o1YZrtPBETOAOfbqAecf5qDyZvJRe+pSE+rwuA0jdUAMkDslXWXYSsTl
	 a7jG0rXxDrilA==
Date: Fri, 30 Oct 2026 12:50:58 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3] build: honor default_library for the
 installed libraries
Message-ID: <if2xlew7mmnmc7svjesuycgxfpkkmbckc67fe77dnoeuhmiopo@c6jw6damflxf>
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
 <20261030104631.1044556-1-yegorslists@gmail.com>
 <z6uzdpsuwffjjlca5isgrznpxzlbmfgc5rryvw7keb37r5xogf@aiw7cjkayux6>
 <CAGm1_ktZLP4UrSfie0FOybLX=p3dPodyvg-SmucFtm-2u32ryw@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGm1_ktZLP4UrSfie0FOybLX=p3dPodyvg-SmucFtm-2u32ryw@mail.gmail.com>

On Fri, Oct 30, 2026 at 12:39:07PM +0100, Yegor Yefremov wrote:
> On Fri, Oct 30, 2026 at 12:24 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> >
> > On Fri, Oct 30, 2026 at 11:46:31AM +0100, Yegor Yefremov wrote:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
> > > libgpiodbus and libgpiosim) are built with both_libraries(), so the
> > > shared variant is always built, even with -Ddefault_library=static.
> > > When the toolchain or the environment requests a fully static link
> > > (e.g. LDFLAGS=-static, as done by Buildroot for static-only builds),
> > > linking the shared library then fails:
> > >
> > >   FAILED: lib/libgpiod.so.3.1.2
> > >   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
> > >
> >
> > This is a reply to a previous thead again. :(
> 
> My bad. The In-Reply-To was embedded into the patch file so I missed it :-(
>

Please consider using b4 for managing patches.

Bart

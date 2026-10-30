Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359359;
	b=vvWfgsQSkBCMwMqgt1xPoPTGIgcew/gM9Sl0KYJP4QtuZTkceCaAmigqrppif2YIgDvf
	 /1VKInz/Jd5B8pIL+HzERwOQ0i0IE8Ox/wM/DjqeKAdWCN9BV2ovv9L+2uEJTuK7olWfY
	 n87z1PgxHWP8mt4qxTujYTWFNziEHQEtLW2CiT5ujSSI//oxhRz4wXjIE/KV6vhDQSy5+
	 DZVhhoh0tbImAOFFP2zFgu9qCVWQtVHg+0OhXbjm2SGuElbjjDQ+mVDXTetybxRMPfMHS
	 ztDL1Y1PWk7iJ55Gd3tQ5RMF/L8R4XNcpt/w6LBK2PKf1ull9HiQEqB8YE80exdzdaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359359;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yJqDl0TWWpvU7A0NfZvQiMiQvyoQM27Wt5aSa3fPKKo=;
	b=DOXsFWdI7/U87GBqgqikaMXeKGO6v/AlQ7Xj+D9Blhn5k1yHbbDqVWDHEFyK6yMVn2q0
	 fEFrxtNjEjneN/c8iCIGKo5nEavSxO/pYEMNeICinzP9NfeT0R0qzstXCMjB+MYz5aqF4
	 ZiBb49jIBoChoWkm9c31TMEkbryuSBwgwhIBJLqYoVn9k6+BtZbt5oPVdNIY9cxaPES4t
	 iT8RNfKEoOKTn+n0HayLpQoWaMSHYRGec8b+4KlX/5guZcHVFZagKRpijDfSIen3UKqSz
	 LippAFME+MFDGcE5yYNAv18yvFI650/282ub5E3woHgzUA7quesgHuhzBUeY5dL7mLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3BSZfY+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4218C606A31C;
	Fri, 30 Oct 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3BSZfY+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E3B1F000C1;
	Fri, 30 Oct 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359358;
	bh=yJqDl0TWWpvU7A0NfZvQiMiQvyoQM27Wt5aSa3fPKKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3BSZfY+Y1EQAwV6Wq+uGYr94s4Hno6DW3nPAPWNAt3qF07f9yM3Gh2YsZUee1ngI
	 9xqNwU3PhvvAmOutw2yA/nQ3r3UuHZNgmvtFml45qPHvAZIEaQztd8Jp9ObQ+vmP/p
	 xlQqoZdorP5J0zm+HFlAwpCCu2goVvBuJdwwaxxhrHCexYdIg/AMu68Nfl8JkHh61Z
	 BNeEexvORDA/R64QAJM28/4KLP8pWXPj2DnGjERiV4SKZUE+yDCDqNVZXRAsuh9C3g
	 DeTuBQgMGtkD6JDS4i7Exscr0gF1SvzgrzGB0xDqOGoE/M8wy6B814On0OUmwefOYU
	 lRxz27NWojIAw==
Date: Fri, 30 Oct 2026 12:22:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <svjb2ivlopgphqueanfjykfedqejyr4akxbo4y4eycuf5qesxq@3efk7hu6xeft>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
 <20261028123448.510401-2-shengchao.guo@oss.qualcomm.com>
 <CGME20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94@eucas1p1.samsung.com>
 <01841455-880c-4477-ac69-ea8c117cc6cd@samsung.com>
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
Content-Disposition: inline
In-Reply-To: <01841455-880c-4477-ac69-ea8c117cc6cd@samsung.com>

On Fri, Oct 30, 2026 at 10:58:05AM +0100, Marek Szyprowski wrote:
> On 28.10.2026 13:34, Shawn Guo wrote:
> > The proxy lets a consumer set the line direction and reset the
> > default value and vote tally only when usecnt == 1, i.e. when it is
> > the sole requester. But request() and direction_output() take the
> > descriptor mutex separately. When two consumers probe concurrently,
> > both request the line before either configures it, both see
> > usecnt == 2, both fall into the shared path, read back the still
> > unconfigured direction (input) and fail with -EPERM.
> >
> > On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> > sharing tlmm GPIO 41. They probe asynchronously and intermittently
> > both fail, leaving the codecs without supplies:
> >
> >   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
> >
> > Requesting the line is not evidence that a consumer has claimed it.
> > Instead, count proxies that have actually configured the line (set its
> > direction or voted for a value) in a new cfgcnt, with a per-proxy
> > configured flag, and allow (re)initialization only while no other
> > proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> > gpiod_set_value() without ever setting the direction counts as
> > configured, so a later user can never reset def_val/votecnt behind its
> > vote. The count is dropped when the proxy frees the line.
> >
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> I've hit the same issue on RUBIK Pi3 board, see:
> 
> https://lore.kernel.org/all/20261028222803.2682808-1-m.szyprowski@samsung.com/
> 
> This patch fixes it, so feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
 
Thanks, I'll queue this instead of your patch as it's more
comprehensive.

Bart

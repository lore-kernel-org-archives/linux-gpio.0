Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290422;
	b=zOfF9TMeia2zbxBtAMoAHmGiyAIfmSFBlPYZoGkuxrCwT7UbwVPFj0yI5fkdheaL3JIF
	 65fRtECUphWFB0p2S11VmB4LucPnTPYwEQ3BdBvDH3yWAQRFenHUMuC6870i8nFffOtoI
	 GIbXOAiysqixZgzHstTnQMzU8YPAqbPagrP3Uj0KP7oAXItVmA2Ve6XCa1q0T1oFFfQKT
	 pzCP1+pTB8JgVHjiG8F/U3JgTU619ZaPSQ8ZOi8Cax1Funvkop+IuLf11Bv/zvcCTWp03
	 x/VkTR4UAWU9m5VXVUf7MHdmdJUZNn+93qKyNiXFA3CGaS2MrcaOg/C6OpYYx7p0dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290422;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uT1J6bKMfPDh6Cp/Pg806qQt5aisvbifTOqIdeAAv8U=;
	b=YF1JK6lDjx4MR/fi3p6zanYOJBwyxoXyo+8YfwrO0FLrMW3K0+eb8tds3GRMFWaZBVDG
	 /bXUjS6+rIE7UQLkmjMyupTfMwzglHx3EojAmcF4XdnirQfg0KxW66TXtwNiTbsIKOhXL
	 PM2QOqzsl3iJh2f76ve6dTuZnOZutMSZz8xoU8WQDH+gGXhkuY/aTXKrIBptjwDb2AsMr
	 GD1gRLy6VsE/a+EpcXa6u/TxxGV4hZDys71EyTeEoNW+pIqz3OLeMrzbcF4DncylnJtwT
	 AbfYdEDbVLwnbmR4X9npP1b914261ixlPIH/D2Dm0a4U7DOyQt9Xfufdyy8UuDSi4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtkvhEVm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38A606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtkvhEVm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256D61F01816;
	Thu, 29 Oct 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290421;
	bh=uT1J6bKMfPDh6Cp/Pg806qQt5aisvbifTOqIdeAAv8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtkvhEVmJE7XxrbtKgBDaaYlYdYVbsyGhKqy+77u1e/wib+DHImV1qyfJpkTKsk/K
	 n+JygYIuIqDMftyYia2zB6DaijGCeFId+rQhusSa8/0O7xfHpYsVrWJ0AqFX8WwGw0
	 8JKzTWaqQZzO2T5N0tTQeTERS+xawbPJoni6+4WbF/v43BjwbUaK/0dAS7RaAoCuJW
	 ETroaVrbX/kVgb6yRXeBxtYxRUplxLzeU2pg9ZzyEAL+HPD6Vc6lkCxmqDmxmCmyqn
	 FMKDy3WLSIt0Z5lfua4u+n48F6H8wx4uq3r5cwlNI4+y+RHwe2kWjk6Cvbkf3nwz6e
	 cAzW/YcVQmN9g==
Date: Thu, 29 Oct 2026 17:13:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Payton Fack <facksweng@gmail.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux-gpio@vger.kernel.org, 
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH v2] dbus: add optional D-Bus activation file
 for gpio-manager
Message-ID: <jnlornbkzegl25va72v6v6pnlkabapk5xex5eldvlwk2vqxrgc@5fof6xiqfknm>
References: <CAMRc=Mc_K1B=5S3YsAiRc6s0My4rAb0ktLk26XawijnVEOGvow@mail.gmail.com>
 <20261029154623.387575-1-facksweng@gmail.com>
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
In-Reply-To: <20261029154623.387575-1-facksweng@gmail.com>

On Thu, Oct 29, 2026 at 10:46:23AM -0500, Payton Fack wrote:
> Add an io.gpiod1.service D-Bus system-service file whose
> SystemdService= points at gpio-manager.service, which lets dbus-daemon
> start the manager through systemd on demand when a client sends a
> request to io.gpiod1.
> 
> On-demand activation is not wanted on every system, so gate it behind
> a new dbus-activation feature option. It defaults to disabled and
> requires systemd support. When disabled, the activation file is not
> installed.
> 
> Signed-off-by: Payton Fack <facksweng@gmail.com>
> ---
> On Wed, 28 Oct 2026 at 12:27, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > This has none of the sandboxing features the original .service file has. :(
> >
> > It also runs as root, as opposed to the gpio-manager user.
> 
> I updated the file so that the dbus service must always use systemd to
> start, since dbus service files do not really have the same sandboxing
> features.

Don't send new iterations in reply to previous threads. Each new
iteration should be a new thread. Consider using b4 for managing patch
series.

Please resend it as a new thread.

Thanks,
Bartosz

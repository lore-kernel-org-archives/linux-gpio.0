Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683136;
	b=gX7Ut6Pf7hN/x4yClh7zyfGbzFamfDjZdp/BCcgIc9/iHXpvqbGbo6R+GCBT/qN3OfGT
	 vSMk/7VA2ytOz3xr8lSdut9eZaVNITXL24brHIYqQ5ZFt8medP/g8/+K8hgr7xFYNJofc
	 Ae/ny9e9wNvNUge0Qtz24FeNaRzf4dubl0UpDKA6DE+aY+K6raiyZK9CsxkUlUcm1Y7yA
	 2sbRvToMV84vNcqS7cnCimkCXKCFe2ypr+ZopO26Y+mjbCeNyv3SEBF/39R+V2LWGp8ak
	 C+6rXU/r9bpd1bi87i5R41MO9S8TI95TafCVvVj1b2lBakY2ogpn0Isp1cTePwbmXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683136;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pwDPmB+TeRoAPoy5WgrWyYUyHVTyS1wc/i7oLyN7up8=;
	b=b/0FnFNa0iHFNptDDW9fviWrGPjKgz19IVPmkPfPzXLO58pS/GL5nDZ/t4orFHw/a8bm
	 sgZNYW0vTTuam9UEGvEdVXkAJcZnqdLdCSfTB+ywi306L/ePKU34ZrwVCUPfwzhjX7EMe
	 /zy8JDOmha8jHVy/Dgvfi3pwWMNA4P3zoaPV/N3l2mNlOVd+61/m9f2qLMkXidk3nofWM
	 aJ2NpLq5mcGfqQJX9NswwCGwqq4MYZhVV+71cvOC5uO83FQ6apSXGHfNGV1yhT4iCQ2WB
	 tBDinzPcGon+hXv/TrAFPNnwKbguM5TZmziekx/96v+p9QYUqF4MjP+uE+r4rTgdOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+ca9aWR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF6606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+ca9aWR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DC81F000CA;
	Thu, 26 Nov 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795683135;
	bh=pwDPmB+TeRoAPoy5WgrWyYUyHVTyS1wc/i7oLyN7up8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G+ca9aWRI8B+aulUnZMESeIS0LLC+57+LhVESmDopjEsrWkrR38zTEwE7P7TFBL/s
	 7l4AhZzD/0uL0zH/e+vfYK+da7G/39UCTiq1V3OtVGjibyF/8gBBQr8hiCr6ZNRoqF
	 PnnGaUq0uELHOxWmfYQXxjY5CYK8/wegiQxoJBt6yX5X/eQE/cCxsub9gq8xz7ev2j
	 dhVsbw6kJhk8bscEGueDHbvHegaWtGs6/zoqebNzjYETD7glEF9om1b6cC5VNiVEGO
	 gSAl83yq1mlxKQ+Y0jcEo2qrXd5wzXEpVD89Yz5WVnQyL5YBG9EWAi0h4uvAzJ6Spk
	 LIAbDM60Cnvxw==
Message-ID: <sashiko-outbox-235059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: Use srcu_barrier() instead of
 synchronize_srcu() in gpiodev_release()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zqiang <qiang.zhang@linux.dev>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126084233.17381-1-qiang.zhang@linux.dev>
References: <20261126084233.17381-1-qiang.zhang@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:52:15 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] gpiolib: missing Fixes trailer for srcu_barrier() fix in
  gpiodev_release()
--

commit a9a1a00addf42a3f612e043479c9501ad1c6053c
Author: Zqiang <qiang.zhang@linux.dev>

> gpiolib: Use srcu_barrier() instead of synchronize_srcu() in gpiodev_rele=
ase()
>
> The gpio_desc_label object are freed asynchronously via call_srcu() on
> gdev->desc_srcu (see desc_set_label()). to drain these pending SRCU
> callbacks before cleanup the SRCU structure, gpiodev_release() currently
> calls synchronize_srcu(&gdev->desc_srcu).
>
> However, synchronize_srcu() only waits for a grace period to elapse and
> for its own wakeme_after_rcu callback to be invoked. it does not guarantee
> that callbacks queued on other CPUs have actually been invoked by the time
> it returns. The following race may happen:
>
>               CPUA                                        CPUB
> call_srcu(desc_srcu, desc_free_label)
>
>                                                gpiodev_release()
>                                                ->synchronize_srcu()
>                                                  ->call_srcu() queue wake=
me_after_rcu()
>
> SRCU GP end
> timer_reduce(delay_work)
>
>                                                SRCU GP end
>                                                 synchronize_srcu() return
>                                                ->cleanup_srcu_struct()
> /* timer still pending! */                        ->for CPUA timer_delete=
_sync() return true
>                                                     and cblist not empty.=
 tigger WARN_ON()
>
> This commit therefore use srcu_barrier() instead of synchronize_srcu() on
> gdev->desc_srcu,  it entrains a barrier callback on every CPU that has ca=
llbacks
> queued and waits until all of them have been invoked.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>

[Severity: Low]
Since this fixes the use of synchronize_srcu() to drain call_srcu()
callbacks before cleanup_srcu_struct() in gpiodev_release(), should this
include:

  Fixes: a86d27693066 ("gpiolib: fix the speed of descriptor label setting =
with SRCU")
  Fixes: 7765ffed533d ("gpiolib: use a single SRCU struct for all GPIO desc=
riptors")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126084233.1738=
1-1-qiang.zhang@linux.dev?part=3D1

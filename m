Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701157;
	b=Hz5smST0SWiKLmoz0JO0bbFCLg2E0XALDwXXnPkrSYgzzgY3FXqw/IboWTyzpgDxYsNG
	 rN20V+eCUQpU+I01YsOHItb7Wwl8Nf8XA2m6pXfRzqI5XKCpNYWoE7jkIW4fPDhE5vSwQ
	 hTS9SpwTojh3V9ofqO2dA5+TScVkBjTbbEIwCLPmmxQ9kx4S/J1wykuK2a7WYwl4ko4sx
	 t6BoQL326xl9mH5ke+2vYm5btGqOW0zvHPS//7XnUpDo+v2OnfcXHt89cyuW1tFfXGSCI
	 SaAXqdYF5cGhAWAGNRmWOWQNKDdIWVD35cspRdCdZuFJVSPTGy6nP+ipcGQGRdUq6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701157;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dO47GcUag+bmDxotCWLihzVd3crs6RTsQDfW+nGMD/Y=;
	b=y8gJ4uR79IORE0fFTlIS+JyJvs21zu/02bF0xZMIhaD9Jq3YdhI9ks59TVz2wIPrxSZx
	 TtZGyqrcFldkaAhqRKhGr9HM86n2DoNpu+n+2eYY+blWULTYEPbRQqH+yBkKsTlWjfKbz
	 fjakbYaox4a9jXEgcOBZbD6yeeFG+BB0gFjCg1FdzXIFmPpBQMK39My4YPcD5yYfDg8uW
	 DAeDfOsdptQ03DyOgNXvFaxG0ayDuwXMPdp5HAhgT9yQuS13hdKP0Ifgxj9avmPyD7oAf
	 i8y2dgQ8P8H6PBqrJX8swBfdicvkbJ+o7+OhN+O18fLqGNNhrush2KUJmmGtf1DD1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ubth0gDZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B5B606A327;
	Thu, 26 Nov 2026 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ubth0gDZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9196F1F000C6;
	Thu, 26 Nov 2026 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701156;
	bh=dO47GcUag+bmDxotCWLihzVd3crs6RTsQDfW+nGMD/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ubth0gDZOiXjUKEgvH3lDYCXoloRdlqyfm/7ZM/MPzWkCGQKMP7Ac9ClfxHB0R+pl
	 izbyj+tIcQD9EN78suTfDD4q8LoPUOjTuHRzqLEnHEjzlc2aawIUwXiA/GjawjQKu8
	 siJRjATbHdrvwxOEt4idpx7SFU4v8kKQFKMeX3LzE53WL4sZgUJsMownx9pLCPuaO8
	 gGxqo/4Mbt0vuk88AFd4itYnd0thI4gUOH7N81B2m7RdQodW55McuYXzkWKVI6bfAU
	 cpNltwsmlDEfPNvOG3aVdzr3EMEhCSwoPIIAt1wVuA0CTxV4s4ZIfWA+IsTetx8Kdp
	 KTLJBmJ6gBi5A==
Message-ID: <sashiko-outbox-235656@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] drm/panel: novatek-nt36672e: Fix the reset
 GPIO polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126134508.320700-4-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
 <20261126134508.320700-4-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:52:36 +0000
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
- [Low] drm/panel: novatek-nt36672e: missing Fixes trailer for reset
  GPIO polarity fix
--

commit 9b3b20020b17a5e54e69c4e88df2960f428e2e60
Author: Vladimir Zapolskiy <vz@kernel.org>

> drm/panel: novatek-nt36672e: Fix the reset GPIO polarity
>
> The RESET_N pin of NT36672E panels is an active low signal, however
> the driver drives the reset GPIO with inverted logical values, thus
> the reset GPIO has to be described as active high in device trees,
> which contradicts the panel hardware as well as the panel-common.yaml
> convention.
>
> Fix the driver to assert the reset GPIO to put the panel into reset,
> and to deassert it to release the panel from reset along with adding
> a gpiolib-of quirk, which enforces the active low polarity of the
> NT36672E panel reset GPIO. With the quirk the reset signal levels
> remain unchanged for dtbs, which describe the reset GPIO as active
> high, and device trees, which describe it as active low, start to work.
>
> To: Linus Walleij <linusw@kernel.org>
> To: Bartosz Golaszewski <brgl@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

[Severity: Low]
This fixes the inverted reset GPIO logical polarity from the initial driver
commit.  Should this include:

  Fixes: ea4f9975625a ("drm/panel: Add support for Novatek NT36672E panel d=
river")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126134508.3207=
00-1-vz@kernel.org?part=3D3

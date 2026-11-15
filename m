Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710926;
	b=eV2yIVtIvAfZ+5N0sBsIaurAM/02bUkXAivNjVePRmkaZsdrNqRPB1UxUN5H3VTp6Wpr
	 PJeln8XJWTjVZmb4BIkv4XZwB18/1pTVhjGqu8f+8lNuQSgtuZsZ2RBTNeKe4Eh4nXxBh
	 r/pk4iBJrVCI6qU0QiBC1i6jnivVJ110klNNp2a47PmLdVHIyc5PBwdZyd1wzJ5DJko8F
	 OtOGhX4MV442fQ0FovAFYVmuF13t85l3iu7dO5xbSt8T2igaDRxc6qaq4xsRd7h74fkx0
	 IpoYyFlqldAWhaHphSJBvSQEulKP9yHDiiZmmN5YL7AyInpnkWDFtuu64iI1DUYhIDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710926;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Message-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2umo0JJCXvLyvEoZSPmOUtOWPTh4QvDBiX7/qSnHTbg=;
	b=AZX0cJImz8/S7Jmv4Z24kpbULCkDsJrCs3aMgWACPHSaI5W9kER+ovaJOJzUUyxNpZSA
	 hkvJP9dbEHUbCiTkp/FeW+iBoz3dyESVjhe4QxFNKJUuoxNkSUXU7XoyHfILBhELXJHXc
	 ePxwP+bdh6zwNyddMNqeOg0YMSKf5UGmxkUkI7bCxX/jJSFTyU4jpBMmjfRV8ftb7C2+Z
	 lgQ89tys9htdQ3UIJe61uD71s4PV5dcIM3UVBKIgotHzRf1b8iCNCMoTJyv0/p0ahVnN0
	 QkGk1t9GIKIoysfrACsBC5po07CVZE9z768PixX5xrkimeqNmHLvRN+MPgmRf+orvug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ScY0RC3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C405606A323
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 02:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C405606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ScY0RC3N
ARC-Seal: i=1; a=rsa-sha256; t=1794710890; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=LVrE22cZhBk3ivFqRSVvvHabRDpGaP404VVFyRqKHcPmnVnTtgECkS9qDZp7AJ2yqjsyYdB2zSJnQTq8jRQKeK/k1qtGZ1UIpB3FyzZPxn1bDubqp7/f8NxMM0Pcb01F1I2sGlvTgVULhjvS8ev1CFAAm1lGpuXAEbT9OSA5eG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794710890; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2umo0JJCXvLyvEoZSPmOUtOWPTh4QvDBiX7/qSnHTbg=; 
	b=kEkSugXzXkgqwKXcv70Y5PQ+6TyWxM6Adv/BJY+w8evoDiebkXKmkJgreLcG7jDlC2OKKdBIoUVp7ud4IenBWx22bLFBa2WsUutLuA86XUNBINzNC3cX4pZMas4h31JttfoGVdGl19hcg7xlfiFjM6n7Rfgx1EGkv3hKuiNHsIE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ScY0RC3NAjThsYJrvp3gIYxyyiS6+P2JdBb9J7UdAcQkKgEU2F8JnUl0cfxw0vN64KjESt3iLcXcC2bwUcFo0HI5O4b9IYWV7jfI3+QhS2PMYCAHycfC3h0qkqm9KzFOAnlEiF7EQOYLH9mOyy/3+5faKzTS8M8JbU0hxMjQ4e8=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=2umo0JJCXvLyvEoZSPmOUtOWPTh4QvDBiX7/qSnHTbg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794710888931829.3476602075157;
	Sun, 15 Nov 2026 03:48:08 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 regressions@lists.linux.dev
Subject: [REGRESSION] gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
Message-ID: <20261115-hc4-gpio-shared-od-1@iav.lv>
Date: Sun, 15 Nov 2026 04:55:00 +0200
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
Content-Transfer-Encoding: 8bit

Since f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms"), two of the three fixed regulators sharing GPIOH_8
(GPIO_OPEN_DRAIN) on ODROID-HC4 fail on every boot:

  reg-fixed-voltage regulator-p12v-0: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-p12v-0: error -EPERM: can't get GPIO

The first user (vcc_5v) sets the line to output high in
gpiod_configure_flags(). Its enable then goes through
gpio_set_open_drain_value_commit(), which emulates high by calling
direction_input on the proxy, and the proxy switches the shared line to
input. The next users hit "Shared GPIO's direction already set to input,
refusing to change" in gpio_shared_proxy_direction_output(). Stack from
trace_trigger=gpio_direction.stacktrace:

  gpiod_direction_input <- gpio_shared_proxy_direction_input
  <- gpio_set_open_drain_value_commit <- gpiod_set_value_cansleep
  <- _regulator_do_enable <- set_machine_constraints <- regulator_register

Armbian v7.4-rc2 (its patches don't touch gpiolib or these nodes); same
with the five shared-proxy fixes from the v7.4-rc3 pull. The winner
depends on probe order: without the fixes vcc_5v lost in 2 of 4 boots,
leaving the SD card unpowered and no rootfs.

#regzbot introduced: f918e3804498

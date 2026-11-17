Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939394;
	b=EkIVeIyWnvaa1fEC9/bnPK8FsANQaHOeLRSrRaQ6hoVKl4UaZrsEzlbnB0e2e7Wr/zgi
	 z0FH8t+3BTXVX8w9efL9+GCfj8eIlZvnd6tMhfYGeihFXSsIclMY0cCorD1vS098zjV//
	 HCaxRsl6yMyw27oJdq2CJbIJyhmHZowHVobsE5ww9QTgacwHN81i/+IGmLDoCRnranso/
	 uhS9iEGNTxBVhiIMhq0D2ZWv3KuZIdomOpBXbEi449/wF9s/X+2usyoP5qDxX553nSU7h
	 t+SUydy9digH31SMe4OjNYVCPC4cTcpulrpr+Rdtn5FU4ECMvaHL1jZEXQcmykGt98g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939394;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=;
	b=j9rT8L4jnXVH5wcg0E2iWX2JnUBnKZvRwxpo6GC/B43vCuPaONjpMA3TaNmnISGaVbPW
	 h5MXf/2rjpQoDSaYvwLZvgJ8HWJ7vgMOLf0+Ll3FUvrrKOb+hF1/yCu2erV2YKd3QlZhJ
	 dRTrm6qqccHI9jdZ4WsAz2ifL/cpSfIOir0mH0tvdTOqbieoMzEg9/975QRbRaLnbPe4J
	 Cl8YQmqVCoSqmcWmLo2vezTbIHTGiwsTU9AwxW/HBu7EG+Rksm2fsA6PwlrThJsZSW219
	 qWkxSncF2k1JJPE2kuWNfkiW8tWYDjBl8fue3/bWmAiiTrT87DfMENmv1EYQg3rlN/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ZllJTcWm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72A606A31C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 18:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA72A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ZllJTcWm
ARC-Seal: i=1; a=rsa-sha256; t=1794939373; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jPM86I5fXXkHprkvLBi4twb7QXQFfGNSR471U4Xj2AmO33WwucwF4X/RByhfEVf/qStA55x0RUW+OLfQHVLvSLHp/cGG38CJxWp8GDdwPWTa7xrK9EGlg3N448KFGzVcMM+HvIBOmy/sKLpOfhpdHTF9ZCHSaeAu0wzy46Onpiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794939373; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; 
	b=c0PUZxL6+rrPi5a894TpamTZZdLM9HmSRhUkHs/m/153b9lQT/XXZgwWeQpmCs8boR1MSN8RlUSNw8wnhkFGinH9MmtxzDxayDDSwqtJ49pO1e/IcAgdKfdUgESEuIXj1xtJhi9kXMsirBr6K75g+PXjTbD04KycgRz3UmS++1I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ZllJTcWmygp+HGw1t9C5Z3dZMdLLoAUl+GmOz6SupgIpuMNnG+fiqVVkUkHp+W0yv7C46SBl/YZy3rcIcplXT07wDPPAcVL0FyCMESvt4CFt+q6QxfKHwswFWUjvmoIDVb7ALKrCqk/lRkdOB8BlvPX4iSwusI1uh4IKABJcexA=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794939371281278.3710763207241;
	Tue, 17 Nov 2026 19:16:11 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
Message-ID: <20261117-hc4-gpio-shared-od-2@iav.lv>
In-Reply-To: <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
References: <20261115-hc4-gpio-shared-od-1@iav.lv>
 <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
Date: Tue, 17 Nov 2026 20:15:00 +0200
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

On Tue, Nov 17, 2026 at 02:35:03PM +0100, Bartosz Golaszewski wrote:
> I think the issue is with the proxy driver not
> propagating the -ENOTSUPP error code in set_config().
[...]
> Could you try the following diff?

Thanks, that fixes it. With the diff on v7.4-rc3, 4 of 4 cold boots:
no -EPERM, vcc_5v and both p12v regulators probe as open-drain
outputs, and both SATA disks come up. Stock rc3 on the same board
failed both p12v regulators on the boot before.

Tested-by: Igor Velkov <iav@iav.lv>

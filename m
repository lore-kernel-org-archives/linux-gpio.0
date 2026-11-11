Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399633;
	b=EmoWkm0/ZMdpqFjC42nsRYIHlGtcJ3MHv3HlWfvSF20NyYnSiLfymYMw+kxAeygyNjgr
	 9DFfNZIvBtW23s6NqKegON0EcCRuPGe+6FszfE2FHuXOSZd79sgZC+dSETZjrDwc2JMlS
	 2Oc6u+u1tZSPiVJYY3LLiUha8toDW3I5CHybBmVJKu8dX2GVnhsqz20B0+sQWNwm2LiEZ
	 2cxetIX0epuZoJpUC2scJ5eajFcHBoOpdlmmdfDe/QEp1LSwG0fFRQh3jsndbo3Rbm+qf
	 yx4xK6ibJJo36JS5Nqsb55ndOQAVjqYQZ879WzlHnl5rvjWvQ1vKS3FMc0DOg3TZoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
	b=hHRXBnP0GqiV4N4OhFmkIMa3VCBq6WcaGXeEaQNw3+o4JfN5hVV1/kgNcJ0ZQChxGw0Z
	 RKnRMcz1qjkrN5fob7UN1vT5QTZL1x6H9qrN/AlIeLZ/w2r8YkhYq9FnYy0reg/F0Wr3E
	 RA8akfbrepMdFjEtAJEZ5K/5ZTFSqbnrmevno5G6fM8CDrzC94GM9BRxL8CLvJBmvuo5Z
	 dA1+9Mh/wGQ/befhrqlhlUe5LTV6Zbu4iPGW/Sao/7fkkNFQwpxT+yxQtfcZH1EAZqc2t
	 OjIwft6+bVpoDQPZPxovGUhoI7R6JlAsHV/PRmpy3zOHo+QBZxqKZYr6R3GISxAK9fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBnKSdIe;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C0606A333
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 12:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979C0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBnKSdIe
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3b31a6290so1943197b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399627; x=1795004427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=bBnKSdIenrrIOZGpvznYF3HyWtY3D/ihG7DGFbh49iO3oUIOt6jhmKq0EgxOksIrF3
         fzNHrVKt9VZXZf4f6qlEtiCyWhmMdNdNrG0388SeHDBIpe9MlwucfPziPB05eZVz09xs
         HmDUnxL9TDO2Fu0KkUjNek+ahuwF+owaTGjJGqXScglXkW9LZLei28vXLg53QAwq6SaJ
         bD0HXIYVfh2+jDCSkzqm5Hz5sDy1hffDDFGhPe7lu1SYj9O+ZsLOj41CRYzEYQvgC2Lm
         hutjfQOYOies+duvioCraOK37KQel6g1rXUtff2z8Wc9I9qbmGhmwEHW18ww8EI1WpqP
         Aomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399627; x=1795004427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=mlhxctSdTKkLw4BboAv3O8a/Olor8d/ZCm2U1VhidWPQNmZPoQ+7Ql/d9J2qYOShxn
         19NknOSGH3ntf2JiNML5QpCRFzz898uI634TseLr/Ne8Agw88hBSFnaCu039M3AqZtLU
         k2AD+bwHjBHuutVv4zEuL6ChhqMgkuGkdGXdYhHkX22EdKdp/21DH1FvJ0AMEsQpZqdA
         ykS5boqlWGUr6lQfUXtdtFMht9YE3OKJMuoR4CrZN/O3NTgjmvZQUXTAJAMasuCTJ08c
         AhIlremveVSdiUfSGU4e1Mhh8ub4GFh8BrMS7aiu5ASu1UKKHUEcuC86RBp9GMh+cTMa
         0yiw==
X-Forwarded-Encrypted: i=1; AL+hErEk29BOnloIHPQjedDUtf7mxxlJItje91UhZKgDc9eDG9UzGCaGiyqUvTej/8rNSHF3Nc48IwkEIil9@vger.kernel.org
X-Gm-Message-State: APuU4Z+QMEUmBqcmhDoc58G4G8TxAV9XpxqGr7OF5qYtV/T9rAEo4UCN
	EcGXKSsg53nv5UIxPTjj+0GI+x51iLOLamS8WLl3JWu6EqrZoS9xDO/5
X-Gm-Gg: AYBFou2ahGadWHwxrfo5qABB/FFD8p14WJ25iI+HkExtSxwgYyzcvG3NDQVESAnBBF1
	X1YtxE02OOFu722gkCb9qhM7WpUndmu1iZMdPrmL2Jz5qFp1hH4IiRHCMWFlK7ec6LdrsriOzNI
	yFzDQXEZFuBlouaaHiIj+huBTxE3JfqC4IQ+gC/vp4d1TGoUHddv93nyqRKy03kmy9k9RpcDnzZ
	PcN8Cfpx+Jteu4S6GQpa/WyA18EHNcNYyFPSDvSjkpxE0dv1S343NWYqqwMf2aVG86ewO980SsT
	MPm1S73PaN6FA6oz+YRzeSKNSLsFkgyle6BYVEvdMR8IiN/KDs0v3vfVrMt0e2LpKE7j8PGVdXm
	44noVZxWj3lkIWytE3dijSTYD3pt/HT0KW7Hk9xaUVmPSs+2Rjq9BWIMllBN7AFrfS+quuS7jo2
	GZD9hgR2g2EZQoSZ2uvYljF+5oVHCtKf9+rhgOMTLJaYTMGCVSoB9A7LFSqStOWs4RYq6UV2yhS
	+YlfZ0cBv5EWQyGd6vlB5LeLfvLahxR52rqdOvudX+qz7COeYYDvDwvoXBplNG08CeXI3IwRvP+
	AAPKXnYB3crTON8oCt2lTAz2QAnfWy6P4tvni2y2iFdDSBR/LEjplf6Bz02hjU2XiMLBOYYP0LO
	K4r8d7K9Im75+HhxJRaJqlJK4YvmeH5bQPKcH0aoYH+tp3K+H9llv5YuA6ANF5i5x7oWgNni6qU
	ktZ+wQ92BzOI/9vQH6NJHL
X-Received: by 2002:a05:690c:a849:20b0:8b3:344a:4f44 with SMTP id 00721157ae682-8b3a817a55cmr9874957b3.62.1794399627423;
        Wed, 11 Nov 2026 04:20:27 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm42716417b3.14.2026.11.11.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:20:26 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Wed, 11 Nov 2026 09:20:12 -0300
Message-ID: <20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 21:11, Enzo Adriano wrote:
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

Tested with the posted prerequisites and my local board DT. POW_MOD_SEL
reads back 0x05555555 on the main PIO and 0x00055555 on R-PIO, and
UART0, MMC0 at 3.3 V, R-I2C0/PMIC and GPIO interrupts on eight main PIO
banks worked.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629394;
	b=qskRxoLvbxbOFW1B1Oepp49NvTx1UBjsMWKqbyem+SzgT+qAiD7/P1ArpW/Ez3rUu7bc
	 xnZi2z5cL9uzbzooKv1kvtq4Ac05MiwRvKnhQZRvfbNsQ9D5rI7XJYgbP2ByQntxz5jsa
	 N6FhC2IzqK7ndoQcfGU/OdNND24BxtQcBB3jnIpSE//gwGZBDufn92TP53jUSpBOCBJi6
	 DdX9mbLmySGDkzZfnyP46Yd7fIgaEmSEuIyxDuVnIRnT7KCRqWE44ftwmf7okYShPLcJM
	 8/qiDolJpsgw7c1xb4JYyA87YL++d1n9dxIDeKSUI5wT5SnmA66YF77L6ioi7oIs7CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
	b=ZTVeSUlTZpUJWo1znlJcd3wJV/cta6s/66CnpAm1hrgPTBs+KeKO1gaR/plsk3JCKxQR
	 TzOs1atKZ4GUFPdMTpAgNxx0Xwyri78CqQXBitD6WhA/QXtcorL3YidIWw9VuzaKDwROO
	 NoT5ZUXXhWXQrIevpFBhwIHQf7iRLKq3bNxO9z0GknZ/dRHUj007sw+6a3LP9H/R5IaH+
	 xsFQQxj3AwdKy/xnPHxrv77oFgMV25hGFTiTTHfQHOCNeVzQa0UVlqX+3lxn3dcApy/99
	 KsEKi8B64ADmV5INd+XScnGFqBDKBWE6jJg0jONsm9BBqPkDd1azKT3cFn0YJPik/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE760A3809
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EE760A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso1102276a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629393; x=1794234193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=0FsI8JKfdwQmudyzyfmTQVlPByzYNYayujLicTy5q2pnwA3kjZGMJapOQ6MTLzgTey
         sv2u3Pk+lLXkuI+OC+/J3DjbHekDnHy+c5G087tA2Le9rNkjzfaYr2cQe7PNC7prgD4v
         F+9K4c2P73XReb2VxRYXhhQhkKpKws04CBX4cZ5d0fhkSlP4nDszMoFcdsGkg0xPddpj
         FAEJZ6ff2ipqfgiKbYhKpnZI7et2OEME8aCu3hutxuVw+Fj2dc2lwsCvNoRtZpmnwGCh
         LwR0fZsw6bzXxE1UxIDLU2FvH7e6K5z679/E5PBYLQgS3k3Zkp0liWioZKsz4vJIC5wd
         FcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629393; x=1794234193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=236v0EivlBDe5QdqQntVHQiwe+nYTrmvMveC8FD2p3vHlusG1iSkv8y0MkNpY9Zivu
         H/ceV/ku5sXsp/Akf2FD/HqyTuOU5BJTCeavyGlNXVhthNDdaTGf8X56Vzc+XqfFVqy0
         mq86zkJmlcI0dh06n+0AUFojuJRhvGJoOSTfGCkPhTkZbcCIW7dWLugbjQKgMVnCszor
         Bvbu1Ox2cV+tsVf3eqJT5XKmV30weMvoo4ZbyzI/Y+PCv/7s3yBvjyxMpgIw3I9eRA9K
         LO0IhM/RM/F8S5FDoShZPmSARFxmYGpGYOH0qx2xHujvL2eIyGV8P9GA8VDKS6Q9idc3
         YEOA==
X-Forwarded-Encrypted: i=1; AKwUvBxxmbXBqAnjNRgI89li3zpLvtif1LPbvbosXuxNMcyNc6ENO6F1yBpoFSpHraUhSnmYRLNh5WAekdaR@vger.kernel.org
X-Gm-Message-State: APuU4Z+kVWaB/W80iOFlxb+Amdq9cW3Yu1zxfA/uMdoBkqqq6RNJcd5e
	XfMNOLBD+3RceS9XMBdKbseaKdqk7ylkerzTgq7fcxOS+8DsVuH43SKs
X-Gm-Gg: AYBFou11DmwgQQ62He21E6nbFfVtbtXg6ibml25BxJOuiIM8+YbzJ11deSCeV/y2GA7
	U8TyfcdE4hagaUoVHRFfnfdI8I+XOixFOGxQrvd5UEA+TtQdBysfcM0FKhH9V5DTjruQrP36mg7
	IguMscwBsJpfjNr4j//yYWbPhqWPNDiIxebFlxyCvbkhts02Yf5jrafd/5E9M0RGAZnYGQJLSps
	PShOgHZovDrp4qI12/S6emty4yF9/Am3SCrk+e75fIg+zVjE07bE6QuXZq5UJ3CKVNF7DEXcJlp
	F1M4lNjxudAHdJGiDvVrUP/qbzz5quJCNhI00TXXuU6otN4vU2fhbdn+Wan25gjoLcMzmmIS5Tr
	+XJepbVQBJq+0zY5B0vNLiNbFFMWBX/2n1UIHMMlvinQwoN+TEMnWuFj6krkpj0fUUZt1GlqJPs
	io9z9UqH+tDGlAz4yjWLiriuIXKuyKoa+lXbSglO2B5z4W/TA2nhst5h0Hrc7R0tAFHfAoFVzU2
	aiQQorH9eDoROea7Ocj2DrrRQ2EoUn6qukR0S26GVIoBo+QrJjI+07SwocQtlIzv4DAGeTnUZRt
	Rqa2b4WxmqXW6q2Pg5qk7t6ccB3DsBtdAGiGYEpJ+1MKp1jFnoISfLLW6w==
X-Received: by 2002:a17:902:f70c:b0:2e9:5829:9b3b with SMTP id d9443c01a7336-2eb364b55b9mr86204895ad.35.1793629392936;
        Mon, 02 Nov 2026 06:23:12 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486d5sm29700245ad.29.2026.11.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:10 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Date: Mon,  2 Nov 2026 22:22:53 +0800
Message-ID: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-concrete-rebound-593001f1ac18@spud>
References: 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5511..b9b3bca12089 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ZHIHE=y
> >  CONFIG_ARCH_ULTRARISC=y
> >  CONFIG_ARCH_VIRT=y
> >  CONFIG_ARCH_CANAAN=y
> > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
> >  CONFIG_KEYBOARD_SUN4I_LRADC=m
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=10
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=10
> 
> Why are these options needed?

The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
UARTs beyond the 4th don't get a fixed ttyS index and end up in
whatever slot is free. Raising both to 10 keeps the index stable.

> 
> >  CONFIG_SERIAL_8250_DW=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_PINCTRL_A210=y
> >  CONFIG_PINCTRL_TH1520=y
> >  CONFIG_PINCTRL_SOPHGO_CV1800B=y
> >  CONFIG_PINCTRL_SOPHGO_CV1812H=y
> > 
> > -- 
> > 2.55.0
> > 
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)

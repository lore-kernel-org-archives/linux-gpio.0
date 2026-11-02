Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629496;
	b=X0x+PesoeIvg+TaqeZxAIOvJvuDsp9/RWMmRnkEypmiH/xsoqxS0VE8i6GoSvJGzQpLk
	 qoFoO9qWSx0l2zrXSOg5OtdCqDNcinZaP2q4nAjB24h1AeGKhyL3s4R3PoJxa888vVc2N
	 ax8EUIP7RVrN5/wwnREcUD+ckYtT9mD69BKnagDXIvau574yB/Nj9OLpmoqixlHk91CRu
	 KWZyX1RlHpA14C3RGtenEsoS3lndDHn1fD9II7wE4oDyEnADtZOIdewaMNsZ5Ul0ldyXf
	 mfZ2ZDF2T4/ijfoJvUPuEsmpCjN/2mNI4QbMNmLpN2M8MtmaoNim/HoqKwNeUiVlfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
	b=G0EFtnVwVCaiC7OBbqEgoV8a3529wP90WKrH92kBxKKC4g/l+Ga5OANHPtC0O7kchkwO
	 nrWhHf/+ZlkvY2PiZYCC4Ir4OGaS5HX/xT4wKlmlkSw3LtXvFbzSp4M4x71c/kBM1+kIG
	 GE+UgcNpx1YdSWLCiV6N4Ubp0CnxdTau3jqa8i58W1tOltmE+qWMu1fRzQflzFKMuvUmU
	 nMpA3fEow4VUauY3iU3uTuWekfFc9C+tPK49XqUfO/evIe8WzHWhKqIyXJxQEyA/KHCTb
	 NDn0i/X5MzsO9LLbhqCx+NNiTV23KLChMx4tR+ischXjSTyVtJsSGljeDvxXjdJmBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CGf/6wG6";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49056606A936
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49056606A936
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGf/6wG6
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9ae391a05so21187505ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629496; x=1794234296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=CGf/6wG6HrD1nXTDASXQnD+Py+nvrQdLruMml935MtSVqpMqRekdAtsa7uvlpxZ+1Y
         8PHql+xyG69D71HRpkBzDGG5fWIdtyh83VaBKeRDHQqDRbIMw1W6jETA+ycr+1N50SaE
         sV6L1+suxdiHPijgn/jedn0+KcMZKBsSrZ86BrY6kT+IL3OZMVjQG51injm1sd5TWBD3
         DG6ig865RrIhZVMIrBJaF0ezJoOIHwFPWp+a7JT0kIheHXHPYBl7feIs/uW/PvSoqtoH
         Dm1xZLNWah8+S11qO3EaH7JKiUMea+mDtohV+IcGLvEsYitZ42oM+jZLos4QqKFhOs34
         heJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629496; x=1794234296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=u4LzsNMtN1/TxbuBluw0Vfenlj1MEtBQ99FvZf/MGf6KTPARSEUhKHWyO6jpGrbH+t
         4UvpBJvlGlHKUN+cmNTokleNpPG24fyd7hb0x3yZfkcn0YfoFO0SSRp+UWFZCDgs3u/1
         yYAxPJitX0i4vfFvVmrvcii28FU53pYf9wrSGicgHlgSDR/AByg7S8n3R63MweoUwu2u
         dQHIf2xvODNZsxyPbQKCDZKHGyFjzpH+jUWyrMhSbCDj35OAfcWH8GuVbpmh0j+4hRgL
         uM4dhGaiiys7wpgrYIPLdZnZ4fQwmGVsIU6XLTNeoA37Q7RQBIkAADmjoK98Vc++Vpsu
         kT1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLN2+ex+Crj2MOCZWtEwL2J6zvnrJHhOSQRb1j4BYjK/++TkJnNg4Rn9HYOAdc++KaYKU3LaPhoLnb@vger.kernel.org
X-Gm-Message-State: APuU4Z+ftrKxK5Vy7E2wexYDwMtdP5D2XYnv/qx4Id/BFqKVS1KYMiv5
	tNo9dSEsytXoGqTVxToBAuXoxvF/ZqxN9jVJFD4JgqjNR/4q0Y6IV9me
X-Gm-Gg: AYBFou32UtopGDRu8cesgEcA4QinqLpr+G4KMbwKTcdZuQWm8w5Kaf4qri5UatZcG/r
	GLWvu/f6C+QZheOiAxUXixxtUBhWiHiHRO5mISKheNqFDe3cEG14F42iMST0uGEpKD/3kiUR4Wf
	KKCF/4o+ASmPdmr6sFTvzmPxw1frpAenb0s/vHOH9Y5Tegb6qtJ1tE+9KgJyDV3MOnTKN1r+eaE
	i70NO/fILmHld2wSHTPlqARKcBuzmBWqtLMBBC4gWTmx1teN9djgXve51esqe9mAiEMcvLNVAcY
	k4eZ1uAoXES7djVLuj+ztmbRY5wZDwlD4xJGiYUoVSRz+m2jKYGW+ltwhxIRQfFC4fA9AnZtK1L
	QYc7ZmYIpY5jss2DdUWPfnI3EMLPpnUIY9AzKp4zbRq0zxmZh7gmgZCnMelpZ8fQBQ6leIV7OO2
	Kvxjj5BCC5lDspaNyCk6/l49hq4tFdRWPpzMPJr5Y85J/cE9lg0bjKYS9gwjMFjh9jH/7fzLPV/
	1IihNqlYtOc78+2OTXRowZPcV1AyQ/U5hsEsz7pcGi0C7OskwJTAVXsKofL6A4L31e0mkJRK7AJ
	0KEa25rvXt8Gu34uZYpPcgR4SeYJB/aHtxY2KQM5t0fMKmIDJONW05l5Vg==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id d9443c01a7336-2eb364e1741mr69092915ad.29.1793629495462;
        Mon, 02 Nov 2026 06:24:55 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298543sm28720445ad.60.2026.11.02.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:24:54 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
Date: Mon,  2 Nov 2026 22:24:46 +0800
Message-ID: <20261102142448.3784989-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
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

On Thu, 22 Oct 2026 11:22:51 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> > From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > 
> > Add the ten A210 UARTs with their clocks, resets and interrupts, using
> > the snps,dw-apb-uart compatible.
> > 
> > Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > index bbad51a3edb0..a07b67d10633 100644
> > --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> > +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		uart0: serial@2014000 {
> > +			compatible = "snps,dw-apb-uart";
> 
> Prepend a vendor compatible if you need two resets, similar to
> "starfive,jh7100-uart"?

Thanks, agreed. The RFC that replaced this series adds a
"zhihe,a210-uart" compatible and lists both resets.

> 
> > +			reg = <0x0 0x02014000 0x0 0x400>;
> > +			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
> > +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> > +			clock-names = "baudclk", "apb_pclk";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
> > +			reg-io-width = <4>;
> > +			reg-shift = <2>;
> > +			resets = <&rst_peri1 PERI1_UART0_PRST>;
> 
> This looks to me like it should be
> 
> 			resets = <&rst_peri1 PERI1_UART0_PRST>,
> 				 <&rst_peri1 PERI1_UART0_S_RST>;
> 
> instead.
> 
> regards
> Philipp
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
